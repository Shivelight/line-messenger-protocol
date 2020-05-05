include "enums.thrift"
include "structs.thrift"

namespace py LineThrift.channelapplicationprovided.exceptions
namespace go LineThrift.channelapplicationprovided.exceptions

exception TalkException {
  1: enums.ErrorCode code
  2: string reason
  3: map<string, string> parameterMap
}

