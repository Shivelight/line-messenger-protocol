import glob
import re
import json

thriftData = {}
commonThriftData = {
	"enum": {},
	"struct": {},
	"exception": {},
}

toRemove = []

def proccessData(path, searchType):
	with open(path, "r") as handle:
		dotThrift = handle.read()
	found = re.findall(rf"{searchType} (\w+) ", dotThrift)
	return found

files =  [file.replace("\\", "/") for file in glob.glob("../thrift/**/*.thrift", recursive=True)]
for file in files:
	data = file.split("/")[2:]
	if data[0] not in thriftData:
		thriftData[data[0]] = {}
	if data[1] == "service.thrift":
		continue
	dataType = data[1].replace("s.thrift", "")
	proccessedData = proccessData("../thrift/"+ data[0] + "/" + data[1], dataType)
	thriftData[data[0]][dataType] = proccessedData

for service in thriftData.items():
	for tObjects in service[1].items():
		for tObject in tObjects[1]:
			# commonThriftData[tObjects[0]][tObject] = commonThriftData[tObjects[0]].get(tObject, 0) + 1
			if tObject not in commonThriftData[tObjects[0]]:
				commonThriftData[tObjects[0]][tObject] = {}
			if "foundIn" not in commonThriftData[tObjects[0]][tObject] and "count" not in commonThriftData[tObjects[0]][tObject]:
				commonThriftData[tObjects[0]][tObject]["foundIn"] = []
				commonThriftData[tObjects[0]][tObject]["count"] = 0
			commonThriftData[tObjects[0]][tObject]["foundIn"].append("../thrift/" + service[0] + "/" + tObjects[0] + "s.thrift")
			commonThriftData[tObjects[0]][tObject]["count"] = commonThriftData[tObjects[0]][tObject].get("count", 0) + 1

for tObjects in commonThriftData.items():
	for tObject in tObjects[1].items():
		if tObject[1]["count"] > 1:
			print(f"common {tObjects[0]} => {tObject[0]}")
			print("  Found in:")
			for foundIn in tObject[1]["foundIn"]:
				print("    {}".format(foundIn.split("/")[2]))
		else:
			toRemove.append((tObjects[0], tObject[0]))

for rem in toRemove:
	del commonThriftData[rem[0]][rem[1]]

for typeData in ["enum", "struct", "exception"]:
	if typeData == "enum":
		data = "namespace py LineThrift.common._enums\nnamespace go LineThrift.common._enums\n\n"
	elif typeData == "struct":
		data = "include \"_enums.thrift\"\n\nnamespace py LineThrift.common._structs\nnamespace go LineThrift.common._structs\n\n"
	else:
		data = "include \"_enums.thrift\"\ninclude \"_structs.thrift\"\n\nnamespace py LineThrift.common._exceptions\nnamespace go LineThrift.common._exceptions\n\n"
	for enumData in commonThriftData[typeData].items():
		with open(enumData[1]["foundIn"][0], "r") as handle:
			thriftData = handle.read()
			x = re.findall(r"(?s)" + typeData+ " "+ enumData[0] + r" {(.*?)}", thriftData, re.MULTILINE)
			if len(x) != 0:
				data += typeData + " " + enumData[0] +" {"
				data += x[0]
				data += "}\n\n"
	with open(f"_{typeData}s.thrift", "w+") as handle:
		handle.write(data)
	print(f"File _{typeData}s.thrift has been written successfully.")
