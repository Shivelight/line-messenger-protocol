namespace py LineThrift.secondaryqrcode.enums
namespace go LineThrift.secondaryqrcode.enums

enum SecondaryQrCodeErrorCode {
	INTERNAL_ERROR = 0,
	ILLEGAL_ARGUMENT = 1,
	VERIFICATION_FAILED = 2,
	NOT_ALLOWED_QR_CODE_LOGIN = 3,
	VERIFICATION_NOTICE_FAILED = 4,
	RETRY_LATER = 5,
	INVALID_CONTEXT = 100,
	APP_UPGRADE_REQUIRED = 101
}