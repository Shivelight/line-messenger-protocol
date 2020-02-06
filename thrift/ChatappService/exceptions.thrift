include "enums.thrift"
include "structs.thrift"

namespace py LineThrift.chatapp.exceptions

exception ChatappException {
  1: enums.ChatappErrorCode code
  2: string reason
}

