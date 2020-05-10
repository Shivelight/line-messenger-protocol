namespace py LineThrift.auth.enums
namespace go LineThrift.auth.enums

/**
 * Updated: 2020-02-21 (Android 10.1.1)
 */
enum AuthKeyVersion {
  UNKNOWN = 0
  V1 = 1
}

/**
 * Updated: 2020-02-21 (Android 10.1.1)
 */
enum AuthLoginVersion {
  UNKNOWN = 0
  V1 = 1
  V2 = 2
}

enum LoginType {
  ID_CREDENTIAL = 0
  QRCODE = 1
  ID_CREDENTIAL_WITH_E2EE = 2
}

/**
 * Updated: 2020-02-21 (Android 10.1.1)
 */
enum ResponseType {
  UNKNOWN = 0
  SUCCESS = 1
  REQUIRE_SERVER_SIDE_EMAIL = 2
  REQUIRE_CLIENT_SIDE_EMAIL = 3
}
