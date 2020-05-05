include "enums.thrift"
include "structs.thrift"
include "exceptions.thrift"

namespace py LineThrift.agecheck
namespace go LineThrift.agecheck

service AgeCheckService {

  enums.UserAgeType checkUserAge(
    2: enums.CarrierCode carrier,
    3: string sessionId,
    4: string verifier,
    5: i32 standardAge) throws (1: exceptions.TalkException e)

  structs.AgeCheckDocomoResult checkUserAgeWithDocomo(
    2: string openIdRedirectUrl,
    3: i32 standardAge,
    4: string verifier) throws (1: exceptions.TalkException e)

  string retrieveOpenIdAuthUrlWithDocomo() throws (1: exceptions.TalkException e)

  structs.AgeCheckRequestResult retrieveRequestToken(
    2: enums.CarrierCode carrier) throws (1: exceptions.TalkException e)

}