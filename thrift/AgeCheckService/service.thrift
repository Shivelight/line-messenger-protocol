include "enums.thrift"
include "structs.thrift"
include "../Common/_enums.thrift"
include "../Common/_exceptions.thrift"

namespace py LineThrift.agecheck
namespace go LineThrift.agecheck

service AgeCheckService {

  enums.UserAgeType checkUserAge(
    2: _enums.CarrierCode carrier,
    3: string sessionId,
    4: string verifier,
    5: i32 standardAge) throws (1: _exceptions.TalkException e)

  structs.AgeCheckDocomoResult checkUserAgeWithDocomo(
    2: string openIdRedirectUrl,
    3: i32 standardAge,
    4: string verifier) throws (1: _exceptions.TalkException e)

  string retrieveOpenIdAuthUrlWithDocomo() throws (1: _exceptions.TalkException e)

  structs.AgeCheckRequestResult retrieveRequestToken(
    2: _enums.CarrierCode carrier) throws (1: _exceptions.TalkException e)

}