include "enums.thrift"
include "structs.thrift"

namespace py LineThrift.square.exceptions
namespace go LineThrift.square.exceptions

exception SquareException {
  1: enums.SquareErrorCode errorCode
  2: structs.ErrorExtraInfo errorExtraInfo
  3: string reason
}

