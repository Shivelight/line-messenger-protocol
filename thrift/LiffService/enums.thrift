namespace py LineThrift.liff.enums
namespace go LineThrift.liff.enums

/**
 * Updated: 2021-02-08 (Android 10.11.1)
 */
enum LiffPermanentLinkPattern {
  CONCAT = 1
  REPLACE = 2
}

/**
 * Updated: 2021-02-08 (Android 10.11.1)
 */
enum LiffLaunchOption {
  ALLOW_DIRECT_LINK = 1
}

/**
 * Updated: 2020-02-17 (Android 10.1.1)
 */
enum LiffViewFeature {
  GEOLOCATION = 1
  ADVERTISING_ID = 2
  BLUETOOTH_LE = 3
  QR_CODE = 4
  ADVERTISING_SDK = 5
  ADD_TO_HOME = 6
  SHARE_TARGET_MESSAGE = 7
  VIDEO_AUTO_PLAY = 8
  PROFILE_PLUS = 9
}

enum LiffErrorCode {
  INVALID_REQUEST = 1
  UNAUTHORIZED = 2
  CONSENT_REQUIRED = 3
  VERSION_UPDATE_REQUIRED = 4
  SERVER_ERROR = 100
}

