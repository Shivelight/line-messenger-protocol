include "enums.thrift"
include "../Common/enumsC.thrift"

namespace py LineThrift.auth.structs
namespace go LineThrift.auth.structs

struct SnsIdUserStatus {
  1: bool userExisting
  2: bool phoneNumberRegistered
  3: bool sameDevice
  4: enumsC.AccountMigrationCheckType accountMigrationCheckType
}

/**
 * Updated: 2020-02-21 (Android 10.1.1)
 */
struct AuthKeyExchangeRequest {
  1: enums.AuthKeyVersion authKeyVersion
  2: string publicKey
  3: string nonce
}

/**
 * Updated: 2020-02-21 (Android 10.1.1)
 */
struct AuthKeyExchangeResponse {
  1: string publicKey
  2: string nonce
}

/**
 * Updated: 2020-02-21 (Android 10.1.1)
 */
struct AuthLoginRequest {
  1: enums.AuthLoginVersion authLoginVersion
  2: map<string, string> metaData
  3: string cipherText
}

/**
 * Updated: 2020-02-21 (Android 10.1.1)
 */
struct AuthLoginResponse {
  1: map<string, string> metaData
  2: string cipherText
}

/**
 * Updated: 2020-02-21 (Android 10.1.1)
 */
struct AuthSessionRequest {
  1: map<string, string> metaData
}

struct SecurityCenterResult {
  1: string uri
  2: string token
  3: string cookiePath
  4: bool skip
}

struct LoginRequest {
  1: enums.LoginType type
  2: enumsC.IdentityProvider identityProvider
  3: string identifier
  4: string password
  5: bool keepLoggedIn
  6: string accessLocation
  7: string systemName
  8: string certificate
  9: string verifier
  10: binary secret
  11: i32 e2eeVersion
  12: string modelName
}

struct RegisterWithSnsIdResult {
  1: string authToken
  2: bool userCreated
}

/**
 * Updated: 2020-02-21 (Android 10.1.1)
 */
struct IdentifierConfirmationRequest {
  1: map<string, string> metaData
  2: bool forceRegistration
  3: string verificationCode
}

/**
 * Updated: 2020-02-21 (Android 10.1.1)
 */
struct IdentityCredentialRequest {
  1: map<string, string> metaData
  2: enumsC.IdentityProvider provider
  3: string chiperKeyId
  4: string cipherText
  5: IdentifierConfirmationRequest confirmationRequest
}

/**
 * Updated: 2020-02-21 (Android 10.1.1)
 */
struct IdentityCredentialResponse {
  1: map<string, string> metaData
  2: enums.ResponseType responseType
  3: string confirmationVerifier
  4: i64 timeoutInSeconds
}
