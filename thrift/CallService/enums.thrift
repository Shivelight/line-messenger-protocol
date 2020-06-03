namespace py LineThrift.call.enums
namespace go LineThrift.call.enums

enum CallType {
  AUDIO = 1;
  VIDEO = 2;
  FACEPLAY = 3;
}

enum MediaType {
  AUDIO = 1
  VIDEO = 2
  LIVE = 3
}

enum PaidCallType {
  OUT = 0
  IN = 1
  TOLLFREE = 2
  RECORD = 3
  AD = 4
  CS = 5
}

enum PaidCallProductType {
  COIN = 0
  CREDIT = 1
  MONTHLY = 2
}

enum PaidCallerIdStatus {
  NOT_SPECIFIED = 0
  VALID = 1
  VERIFICATION_REQUIRED = 2
  NOT_PERMITTED = 3
  LIMIT_EXCEEDED = 4
  LIMIT_EXCEEDED_AND_VERIFICATION_REQUIRED = 5
}

enum PersonalInfo {
  EMAIL = 0
  PHONE = 1
  BIRTHDAY = 2
  RAW_BIRTHDAY = 3
}

enum Protocol {
  STANDARD = 1;
  CONSTELLA = 2;
}

enum UserStatus {
  NORMAL = 0
  UNBOUND = 1
  UNREGISTERED = 2
}
