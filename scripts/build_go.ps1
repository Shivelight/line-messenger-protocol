Get-ChildItem "../thrift" -Recurse -Filter *service.thrift | Foreach-Object {
	thrift -r --gen go $_.FullName
}