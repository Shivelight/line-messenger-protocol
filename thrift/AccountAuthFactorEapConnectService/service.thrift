include "enums.thrift"
include "structs.thrift"
include "../Common/structsC.thrift"
include "../Common/exceptionsC.thrift"

namespace cpp LineThrift.accountauthfactoreapconnect
namespace py LineThrift.accountauthfactoreapconnect
namespace go LineThrift.accountauthfactoreapconnect

service AccountAuthFactorEapConnectService {
	structs.ConnectEapAccountResponse connectEapAccount(
		1: structs.ConnectEapAccountRequest request
	) throws (1: exceptionsC.TalkException e)

	structs.DisconnectEapAccountResponse disconnectEapAccount(
		1: structs.DisconnectEapAccountRequest request
	) throws (1: exceptionsC.TalkException e)

	structs.VerifyEapLoginResponse verifyEapLogin(
		1: structs.VerifyEapLoginRequest request
	) throws (1: exceptionsC.TalkException e)
}