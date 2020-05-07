#!/usr/bin/env python
from collections import defaultdict
import sys
import os
import json
import pprint

from ptsd import ast
from ptsd.loader import Loader

in_struct = False

export_dir = "./"

def get_prefix(ttype):
    prefix = ""
    if hasattr(ttype, "noprefix"):
        return prefix
    if isinstance(ttype, ast.Identifier):
        obj = loader.lookup(ttype.value)
        if isinstance(obj, ast.Enum):
            prefix = "enums."
        elif not in_struct and isinstance(obj, ast.Struct):
            prefix = "structs."
        elif isinstance(obj, ast.Exception_):
            prefix = "exceptions."
    return prefix


def patch():
    def custom_func_str(self):
        tmpl = "{oneway}{type} {name}({arguments}){throws}{annotation}"
        arguments = ""
        if self.arguments:
            args = ",\n    ".join(map(str, self.arguments))
            arguments = f"\n    {args}"
        throws = (
            (" throws (%s)" % ", ".join(map(str, self.throws))) if self.throws else ""
        )
        return tmpl.format(
            oneway="oneway " if self.oneway else "",
            type=f"{get_prefix(self.type)}{self.type}",
            name=self.name,
            arguments=arguments,
            throws=throws,
            annotation=self.annotations_str(),
        )

    ast.Function.__str__ = custom_func_str

    def custom_service_str(self):
        return "service %s%s {\n\n  %s\n\n}%s" % (
            self.name,
            " extends %s" % self.extends if self.extends else "",
            "\n\n  ".join(map(str, self.functions)),
            self.annotations_str(),
        )

    ast.Service.__str__ = custom_service_str

    def custom_struct_str(self):
        return "%s %s {\n  %s\n}%s\n" % (
            "union" if self.union else "struct",
            self.name,
            "\n  ".join(map(str, self.fields)),
            self.annotations_str(),
        )

    ast.Struct.__str__ = custom_struct_str

    def custom_field_str(self):
        return "%d: %s%s%s %s%s%s" % (
            self.tag,
            "required " if self.required else "",
            get_prefix(self.type),
            self.type,
            self.name,
            " = %s " % ast.Const.render_value(self.const_value)
            if self.const_value
            else "",
            self.annotations_str(),
        )

    ast.Field.__str__ = custom_field_str

    def custom_enum_str(self):
        return "enum %s {\n  %s\n}%s\n" % (
            self.name,
            "\n  ".join(map(str, self.values)),
            self.annotations_str(),
        )

    ast.Enum.__str__ = custom_enum_str

    def custom_list_str(self):
        return "list<%s%s>" % (get_prefix(self.value_type), self.value_type)

    ast.List.__str__ = custom_list_str

    def custom_set_str(self):
        return "set<%s%s>" % (get_prefix(self.value_type), self.value_type)

    ast.Set.__str__ = custom_set_str

    def custom_map_str(self):
        return "map<%s%s, %s%s>" % (
            get_prefix(self.key_type),
            self.key_type,
            get_prefix(self.value_type),
            self.value_type,
        )

    ast.Map.__str__ = custom_map_str

    def custom_exc_str(self):
        return 'exception %s {\n  %s\n}%s\n\n' % (
            self.name,
            '\n  '.join(map(str, self.fields)),
            self.annotations_str())

    ast.Exception_.__str__ = custom_exc_str


e_global = defaultdict(int)
s_global = defaultdict(int)
x_global = defaultdict(int)


def write(service, enums, structs, exceptions):
    # Strip "Service"
    namespace = service.name.value.lower()[:-7]
    with open(os.path.join(export_dir, f"{service.name}/enums.thrift"), "w+") as fp:
        fp.write(f'namespace py LineThrift.{namespace}.enums\n\n')
        for _, value in enums.items():
            fp.write(f"{value}\n")

    with open(os.path.join(export_dir, f"{service.name}/structs.thrift"), "w+") as fp:
        global in_struct
        in_struct = True
        fp.write('include "enums.thrift"\n\n')
        fp.write(f'namespace py LineThrift.{namespace}.structs\n\n')
        for _, value in structs.items():
            fp.write(f"{value}\n")
        in_struct = False

    with open(os.path.join(export_dir, f"{service.name}/exceptions.thrift"), "w+") as fp:
        fp.write(
            'include "enums.thrift"\n'
            'include "structs.thrift"\n\n'
        )
        fp.write(f'namespace py LineThrift.{namespace}.exceptions\n\n')
        for _, value in exceptions.items():
            fp.write(f"{value}")

    with open(os.path.join(export_dir, f"{service.name}/service.thrift"), "w+") as fp:
        fp.write(
            'include "enums.thrift"\n'
            'include "structs.thrift"\n'
            'include "exceptions.thrift"\n\n'
        )
        fp.write(f'namespace py LineThrift.{namespace}\n\n')
        fp.write(f"{service}")

def write_meta(service, enums, structs, exceptions):
    o = {"_endpoint": "https://legy-jp.line.naver.jp/S5", "names": [function.name.value for function in service.functions]}
    with open(os.path.join(export_dir, f"{service.name}/meta.json"), "w+") as fp:
        json.dump(o, fp, indent=4)

def split(service):
    if not isinstance(service, ast.Service):
        raise ValueError("Cannot split, not a Service object.")

    mantra = loader.modules[filename]
    thrift_enums = {}
    thrift_structs = {}
    thrift_exceptions = {}

    types = []

    def deep_scan(obj):
        if isinstance(obj, ast.BaseType):
            return

        obj = obj.type if hasattr(obj, "type") else obj

        if isinstance(obj, ast.Identifier):
            deep_scan(loader.lookup(obj.value))
            if obj.value not in types:
                types.append(obj.value)
        elif isinstance(obj, ast.Enum):
            if obj.name.value not in types:
                types.append(obj.name.value)
        elif isinstance(obj, (ast.Struct, ast.Exception_)):
            for field in obj.fields:
                deep_scan(field.type)
        elif isinstance(obj, (ast.List, ast.Set)):
            deep_scan(obj.value_type)
        elif isinstance(obj, ast.Map):
            deep_scan(obj.key_type)
            deep_scan(obj.value_type)

    for function in service.functions:
        deep_scan(function)

        for argument in function.arguments:
            deep_scan(argument)

        for exception in function.throws:
            deep_scan(exception)

    for ttype in types:
        obj = mantra[ttype]
        if isinstance(obj, ast.Enum):
            thrift_enums[ttype] = obj
            e_global[ttype] += 1
        elif isinstance(obj, ast.Struct):
            thrift_structs[ttype] = obj
            s_global[ttype] += 1
        elif isinstance(obj, ast.Exception_):
            thrift_exceptions[ttype] = obj
            x_global[ttype] += 1

    write_meta(service, thrift_enums, thrift_structs, thrift_exceptions)
    write(service, thrift_enums, thrift_structs, thrift_exceptions)


if __name__ == "__main__":
    patch()
    if len(sys.argv) < 2:
        print("[!] Needed base .thrift source")
        os._exit(2)
    elif len(sys.argv) >= 3:
        export_dir = sys.argv[2]
        try:
            os.mkdir(export_dir)
        except Exception as e:
            print(f"[!] Cannot create directory: {e}")
            export_dir = "./exported"
            try:
                os.mkdir(export_dir)
            except Exception:
                pass
    print(f"Export Directory: {export_dir}")
    loader = Loader(sys.argv[1])
    filename = os.path.splitext(os.path.basename(sys.argv[1]))[0]
    for k, v in loader.modules[filename].items():
        if isinstance(v, ast.Service):
            try:
                os.mkdir(os.path.join(export_dir,k))
            except Exception:
                pass

            split(v)

    types = [ast.Enum, ast.Struct, ast.Exception_]
    comparison = [e_global, s_global, x_global]
    common = {}
    for i in range(len(comparison)):
        available = [
            k for k, v in loader.modules[filename].items() if isinstance(v, types[i])
        ]
        current = len(comparison[i])
        missing = []
        for x in available:
            if x not in comparison[i]:
                missing.append(x)
            if comparison[i][x] > 1:
                common[x] = comparison[i][x]

        pprint.pprint(missing)
        print(
            f"Used {current}/{len(available)} "
            f" - Missing: {len(missing)} | "
            f"Completeness: {current + len(missing)} / {len(available)}\n"
        )

    print(f"Common ({len(common)}):")
    pprint.pprint(common)
