include "enums.thrift"
include "structs.thrift"
include "exceptions.thrift"

namespace cpp LineThrift.secondarypwlesslogin
namespace py LineThrift.secondarypwlesslogin
namespace go LineThrift.secondarypwlesslogin

service SecondaryPwlessLoginPermitService {
    structs.GetLoginActorContextResponse getLoginActorContext(
        1: structs.GetLoginActorContextRequest request) throws(1: exceptions.SecondaryPwlessLoginException e)

    structs.PutE2eeKeyResponse putE2eeKey(
        1: structs.PutE2eeKeyRequest request) throws(1: exceptions.SecondaryPwlessLoginException e),

    structs.AuthenticateWithPaakResponse authenticateWithPaak(
        1: structs.AuthenticateWithPaakRequest request) throws(1: exceptions.SecondaryPwlessLoginException e)
    
    structs.CancelPaakAuthResponse cancelPaakAuth(
        1: structs.CancelPaakAuthRequest request) throws(1: exceptions.SecondaryPwlessLoginException e),
    
    structs.GetChallengeForPaakAuthResponse getChallengeForPaakAuth(
        1: structs.GetChallengeForPaakAuthRequest request) throws(1: exceptions.SecondaryPwlessLoginException e)

    structs.GetExchangeKeyResponse getExchangeKey(
        1: structs.GetExchangeKeyRequest request) throws(1: exceptions.SecondaryPwlessLoginException e)
}

service SecondaryPwlessLoginService {
    structs.CreateSessionResponse createSession(
        1: structs.CreateSessionRequest request) throws(1: exceptions.SecondaryPwlessLoginException e),

    void verifyLoginCertificate(
        1: structs.VerifyLoginCertificateRequest request) throws(1: exceptions.SecondaryPwlessLoginException e),

    structs.RequestPinCodeVerifResponse requestPinCodeVerif(
        1: structs.RequestPinCodeVerifRequest request) throws(1: exceptions.SecondaryPwlessLoginException e),

    void putExchangeKey(
        1: structs.PutExchangeKeyRequest request) throws(1: exceptions.SecondaryPwlessLoginException e),
        
    void requestPaakAuth(
        1: structs.RequestPaakAuthRequest request) throws(1: exceptions.SecondaryPwlessLoginException e),

    structs.GetE2eeKeyResponse getE2eeKey(
        1: structs.GetE2eeKeyRequest request) throws(1: exceptions.SecondaryPwlessLoginException e),

    structs.LoginResponse login(
        1: structs.LoginRequest request) throws(1: exceptions.SecondaryPwlessLoginException e),

    structs.LoginV2Response loginV2(
        1: structs.LoginV2Request request) throws(1: exceptions.SecondaryPwlessLoginException e)
}

service SecondaryPwlessLoginPermitNoticeService {
    void checkPinCodeVerified(
        1: structs.CheckPinCodeVerifiedRequest request) throws(1: exceptions.SecondaryPwlessLoginException e),

    void checkPaakAuthenticated(
        1: structs.CheckPaakAuthenticatedRequest request) throws(1: exceptions.SecondaryPwlessLoginException e)
}