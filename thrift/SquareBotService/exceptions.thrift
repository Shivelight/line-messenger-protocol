include "enums.thrift"
include "structs.thrift"

namespace py LineThrift.squarebotservice
namespace go LineThrift.squarebotservice

exception BotException {
  1: enums.BotErrorCode errorCode
  2: string reason
  3: map<string, string> parameterMap
}