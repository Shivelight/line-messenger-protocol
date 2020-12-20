include "enums.thrift"
include "structs.thrift"
include "exceptions.thrift"

namespace cpp LineThrift.liff
namespace py LineThrift.liff
namespace go LineThrift.liff

service LiffService {

  structs.LiffViewResponse issueLiffView(
    1: structs.LiffViewRequest request) throws (1: exceptions.LiffException e)

  void revokeToken(
    1: structs.RevokeTokenRequest request) throws (1: exceptions.LiffException e)

}