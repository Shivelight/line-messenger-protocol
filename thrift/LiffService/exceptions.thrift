include "enums.thrift"
include "structs.thrift"

namespace py LineThrift.liff.exceptions

exception LiffException {
  1: enums.LiffErrorCode code
  2: string message
  3: structs.LiffErrorPayload payload
}

