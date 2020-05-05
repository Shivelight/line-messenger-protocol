include "enums.thrift"
include "structs.thrift"

namespace py LineThrift.channel.exceptions
namespace go LineThrift.channel.exceptions

exception ChannelException {
  1: enums.ChannelErrorCode code
  2: string reason
  3: map<string, string> parameterMap
}

