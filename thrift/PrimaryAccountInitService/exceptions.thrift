include "enums.thrift"
include "structs.thrift"

namespace py LineThrift.primaryaccountinitservice.exceptions
namespace go LineThrift.primaryaccountinitservice.exceptions

exception AuthException {
 1: enums.AuthErrorCode code,
 2: string alertMessage,
 11: structs.WebAuthDetails webAuthDetails
}
