@echo off
build_thrift -bin "thrift-0.14.2.exe" -gen go:"thrift_import=github.com/ii64/linego/lib/thrift,package_prefix=github.com/ii64/linego/lib/gen/"