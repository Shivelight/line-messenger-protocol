namespace cpp LineThrift.secondarypwlesslogin.structs
namespace py LineThrift.secondarypwlesslogin.structs
namespace go LineThrift.secondarypwlesslogin.structs

struct GetExchangeKeyRequest {
    1: string sessionId
}

struct GetExchangeKeyResponse {
    2: map<string, string> exchangeKey
}

struct PublicKeyCredentialDescriptor {
    1: string type (content = "PublicKeyCredentialType")
    2: string id
    3: set<string> transports (content = "AuthenticatorTransport")
}

struct PublicKeyCredentialRequestOptions {
    1: string challenge
    2: i64 timeout
    3: string rpId
    4: set<PublicKeyCredentialDescriptor> allowCredentials
    5: string userVerification (content = "UserVerificationRequirement")
    6: AuthenticationExtensionsClientInputs extensions
}

struct AuthenticatorAssertionResponse {
    1: string clientDataJSON
    2: string authenticatorData
    3: string signature
    4: string userHandle
}

struct AuthenticationExtensionsClientInputs {
    91: set<string> lineAuthenSel
}
struct AuthenticationExtensionsClientOutputs {
    91: bool lineAuthenSel
}

struct AuthPublicKeyCredential {
    1: string id
    2: stirng type (content = "PublicKeyCredantialType")
    3: AuthenticatorAssertionResponse response
    4: AuthenticationExtensionsClientOutputs extensionResults
}

struct GetLoginActorContextRequest {
    1: string sessionId
}
struct GetLoginActorContextResponse {
    1: string appType
    2: string accessLocation
}

struct CreateSessionRequest {
    1: string phoneNumber
    2: string countryCode
}

struct CreateSessionResponse {
    1: string sessionId
}

struct VerifyLoginCertificateRequest {
    1: string sessionId
    2: string certificate
}

struct RequestPinCodeVerifRequest {
    1: string sessionId
}

struct RequestPinCodeVerifResponse {
    1: string pinCode
}

struct PutExchangeKeyRequest {
    1: string sessionId
    2: map<string, string> exchangeKey
}

struct CancelPaakAuthRequest {
    1: string sessionId
}
struct CancelPaakAuthResponse {
}

struct GetChallengeForPaakAuthRequest {
    1: string sessionId
}
struct GetChallengeForPaakAuthResponse {
    1: PublicKeyCredentialRequestOptions options
}

struct AuthenticateWithPaakRequest {
    1: string sessionId
    2: AuthPublicKeyCredential credential
}
struct AuthenticateWithPaakResponse {
}

struct RequestPaakAuthRequest {
    1: string sessionId
}

struct PutE2eeKeyRequest {
    1: string sessionId
    2: map<string, string> e2eeKey
}

struct PutE2eeKeyResponse {
}

struct GetE2eeKeyRequest {
    1: string sessionId
}

struct GetE2eeKeyResponse {
    1: map<string, string> metaData
}

struct LoginRequest {
    1: string sessionId,
    2: bool allowAutoLogin
    3: string systemDisplayName
}

struct LoginResponse {
    1: string authToken
    2: string certificate
    4: string mid
}

struct LoginV2Request {
     1: string sessionId
     2: bool allowAutoLogin
     3: string systemDisplayName
     4: string modelName
}

struct LoginV2Response {
}

struct CheckPinCodeVerifiedRequest {
    1: string sessionId
}

struct CheckPaakAuthenticatedRequest {
    1: string sessionId
}
