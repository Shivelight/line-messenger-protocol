namespace py LineThrift.primaryaccountinitservice.enums
namespace go LineThrift.primaryaccountinitservice.enums

enum AccountIdentifierType {
 UNKNOWN = 0,
 PHONE_NUMBER = 1,
 EMAIL = 2
}

enum AuthErrorCode {
 INTERNAL_ERROR = 0,
 ILLEGAL_ARGUMENT = 1,
 VERIFICATION_FAILED = 2,
 NOT_FOUND = 3,
 RETRY_LATER = 4,
 HUMAN_VERIFICATION_REQUIRED = 5,
 INVALID_CONTEXT = 100,
 APP_UPGRADE_REQUIRED = 101
}

enum AvailableMethod {
 UNKNOWN = 0,
 SKIP = 1,
 PASSWORD = 2,
 WEB_BASED = 3
}

enum VerifMethod {
 UNKNOWN = 0,
 UNAVAILABLE = 1,
 SMS = 2,
 TTS = 3
}

enum EncryptionKeyVersion {
 UNKNOWN = 0,
 V1 = 1
}

enum SecondAuthMethod {
 UNKNOWN = 0,
 SKIP = 1,
 WEB_BASED = 2 
}

enum SocialLoginType {
 UNKNOWN = 0,
 FACEBOOK = 1
}