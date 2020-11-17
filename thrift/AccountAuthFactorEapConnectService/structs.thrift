include "enums.thrift"

namespace py LineThrift.accountauthfactoreapconnect.structs
namespace go LineThrift.accountauthfactoreapconnect.structs

struct EapLogin {
	1: enums.EapType type
	2: string accessToken
}

struct ConnectEapAccountRequest {
	1: string authSessionId
}
struct ConnectEapAccountResponse {
}

struct DisconnectEapAccountRequest {
	1: enums.EapType eapType
}
struct DisconnectEapAccountResponse {
}

struct VerifyEapLoginRequest {
	1: string authSessionId
	2: EapLogin eapLogin
}
struct VerifyEapLoginResponse {
	1: bool accountExists
}