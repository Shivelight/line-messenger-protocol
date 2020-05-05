include "structs.thrift"
include "exceptions.thrift"

namespace py LineThrift.secondaryqrcode
namespace go LineThrift.secondaryqrcode

service SecondaryQrCodePermitService {
	void cancelPinCode(
		1: structs.CancelPinCodeRequest request) throws(1: exceptions.SecondaryQrCodeException e),

	structs.GetLoginActorContextResponse getLoginActorContext(
		1: structs.GetLoginActorContextRequest request) throws(1: exceptions.SecondaryQrCodeException e),

	void verifyPinCode(
		1: structs.VerifyPinCodeRequest request) throws(1: exceptions.SecondaryQrCodeException e),

	void verifyQrCode(
		1: structs.VerifyQrCodeRequest request) throws(1: exceptions.SecondaryQrCodeException e)
}

service SecondaryQrCodeLoginService {
    structs.CreateQrSessionResponse createSession(
        1: structs.CreateQrSessionRequest request) throws(1: exceptions.SecondaryQrCodeException e),

    structs.CreateQrCodeResponse createQrCode(
        1: structs.CreateQrCodeRequest request) throws(1: exceptions.SecondaryQrCodeException e),

    structs.CreatePinCodeResponse createPinCode(
        1: structs.CreatePinCodeRequest request) throws(1: exceptions.SecondaryQrCodeException e),

    void verifyCertificate(
        1: structs.VerifyCertificateRequest request) throws(1: exceptions.SecondaryQrCodeException e),

    structs.QrCodeLoginResponse qrCodeLogin(
        1: structs.QrCodeLoginRequest request) throws(1: exceptions.SecondaryQrCodeException e),
}

service SecondaryQrCodeLoginPermitNoticeService {
	void checkQrCodeVerified(
        1: structs.CheckQrCodeVerifiedRequest request) throws(1: exceptions.SecondaryQrCodeException e),

    void checkPinCodeVerified(
        1: structs.CheckPinCodeVerifiedRequest request) throws(1: exceptions.SecondaryQrCodeException e),
}