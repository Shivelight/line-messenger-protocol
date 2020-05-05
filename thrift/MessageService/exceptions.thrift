include "enums.thrift"
include "structs.thrift"

namespace py LineThrift.message.exceptions
namespace go LineThrift.message.exceptions

exception TalkException {
  1: enums.ErrorCode code
  2: string reason
  3: map<string, string> parameterMap
}

