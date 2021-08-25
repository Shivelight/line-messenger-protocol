namespace cpp LineThrift.secondarypwlesslogin.enums
namespace py LineThrift.secondarypwlesslogin.enums
namespace go LineThrift.secondarypwlesslogin.enums

enum SecondaryPwlessLoginErrorCode {
    INTERNAL_ERROR = 0
    VERIFICATION_FAILED = 1
    LOGIN_NOT_ALLOWED = 2
    EXTERNAL_SERVICE_UNAVAILABLE = 3
    RETRY_LATER = 4
    
    NOT_SUPPORTED = 100
    ILLEGAL_ARGUMENT = 101
    INVALID_CONTEXT = 102
    FORBIDDEN = 103

    FIDO_UNKNOWN_CREDENTIAL_ID = 200
    FIDO_RETRY_WITH_ANOTHER_AUTHENTICATOR = 201
    FIDO_UNACCEPTABLE_CONTENT = 202
}