namespace py LineThrift.secondaryqrcode.structs
namespace go LineThrift.secondaryqrcode.structs

struct CreateQrSessionRequest {}

struct CreateQrSessionResponse {
    1: string authSessionId
}

struct CreateQrCodeRequest {
    1: string authSessionId
}

struct CreateQrCodeResponse {
    1: string callbackUrl
}

struct CreatePinCodeRequest {
    1: string authSessionId
}

struct CreatePinCodeResponse {
    1: string pinCode
}

struct CancelPinCodeRequest {
	1: string authSessionId
}

struct VerifyCertificateRequest {
    1: string authSessionId,
    2: string certificate
}

struct QrCodeLoginRequest {
    1: string authSessionId,
    2: string systemName,
    3: bool autoLoginIsRequired
}

struct QrCodeLoginResponse {
    1: string certificate,
    2: string accessToken,
    3: i64 lastBindTimestamp,
    4: map<string, string> metaData
}

struct CheckQrCodeVerifiedRequest {
    1: string authSessionId
}

struct CheckPinCodeVerifiedRequest {
    1: string authSessionId
}


struct GetLoginActorContextRequest {
	1: string authSessionId
}

struct GetLoginActorContextResponse {
	1: string appType,
	2: string accessLocation
}

struct VerifyPinCodeRequest {
	1: string authSessionId,
	2: string pinCode
}

struct VerifyQrCodeRequest {
	1: string authSessionId,
	2: map<string, string> metaData
}