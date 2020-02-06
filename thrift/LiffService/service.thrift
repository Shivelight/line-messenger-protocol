include "enums.thrift"
include "structs.thrift"
include "exceptions.thrift"

namespace py LineThrift.liff

service LiffService {

  structs.LiffViewResponse issueLiffView(
    1: structs.LiffViewRequest request) throws (1: exceptions.LiffException e)

  void revokeToken(
    1: structs.RevokeTokenRequest request) throws (1: exceptions.LiffException e)

}