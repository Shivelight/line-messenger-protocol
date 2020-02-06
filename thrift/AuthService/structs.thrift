include "enums.thrift"

namespace py LineThrift.auth.structs

struct SnsIdUserStatus {
  1: bool userExisting
  2: bool phoneNumberRegistered
  3: bool sameDevice
  4: enums.AccountMigrationCheckType accountMigrationCheckType
}

struct AuthQrcode {
  1: string qrcode
  2: string verifier
  3: string callbackUrl
}

struct RSAKey {
  1: string keynm
  2: string nvalue
  3: string evalue
  4: string sessionKey
}

struct SecurityCenterResult {
  1: string uri
  2: string token
  3: string cookiePath
  4: bool skip
}

struct VerificationSessionData {
  1: string sessionId
  2: enums.VerificationMethod method
  3: string callback
  4: string normalizedPhone
  5: string countryCode
  6: string nationalSignificantNumber
  7: list<enums.VerificationMethod> availableVerificationMethods
  8: string callerIdMask
}

struct LoginResult {
  1: string authToken
  2: string certificate
  3: string verifier
  4: string pinCode
  5: enums.LoginResultType type
  6: i64 lastPrimaryBindTime
  7: string displayMessage
  8: VerificationSessionData sessionForSMSConfirm
}

struct LoginRequest {
  1: enums.LoginType type
  2: enums.IdentityProvider identityProvider
  3: string identifier
  4: string password
  5: bool keepLoggedIn
  6: string accessLocation
  7: string systemName
  8: string certificate
  9: string verifier
  10: binary secret
  11: i32 e2eeVersion
}

struct RegisterWithSnsIdResult {
  1: string authToken
  2: bool userCreated
}

struct DeviceInfo {
  1: string deviceName
  2: string systemName
  3: string systemVersion
  4: string model
  10: enums.CarrierCode carrierCode
  11: string carrierName
  20: enums.ApplicationType applicationType
}

struct E2EEPublicKey {
  1: i32 version
  2: i32 keyId
  4: binary keyData
  5: i64 createdTime
}

