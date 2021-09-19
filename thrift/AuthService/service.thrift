include "structs.thrift"
include "../Common/enumsC.thrift"
include "../Common/structsC.thrift"
include "../Common/exceptionsC.thrift"

namespace cpp LineThrift.auth
namespace py LineThrift.auth
namespace go LineThrift.auth

service AuthService {

  structsC.LoginResult loginV2(
    2: structs.LoginRequest loginRequest) throws(1: exceptionsC.TalkException e),

  string confirmE2EELogin(
    1: string verifier,
    2: binary deviceSecret) throws (1: exceptionsC.TalkException e)

  /**
   * Updated: 2020-02-21 (Android 10.1.1)
   */
  structs.IdentityCredentialResponse confirmIdentifier(
    2: string authSessionId,
    3: structs.IdentityCredentialRequest identityCredentialRequest) throws (1: exceptionsC.TalkException e)

  string createAccountMigrationPincodeSession() throws (1: exceptionsC.TalkException e)

  /**
   * Updated: 2020-02-21 (Android 10.1.1)
   */
  structs.AuthKeyExchangeResponse exchangeKey(
    2: string authSessionId,
    3: structs.AuthKeyExchangeRequest authKeyExchangeRequest) throws (1: exceptionsC.TalkException e)

  structs.SnsIdUserStatus findSnsIdUserStatus(
    2: enumsC.SnsIdType snsIdType,
    3: string snsAccessToken,
    4: string udidHash,
    5: string migrationPincodeSessionId,
    6: string oldUdidHash) throws (1: exceptionsC.TalkException e)

  structsC.AuthQrcode getAuthQrcode(
    2: bool keepLoggedIn,
    3: string systemName) throws (1: exceptionsC.TalkException e)

  /**
   * Updated: 2020-02-21 (Android 10.1.1)
   */
  structsC.RSAKey getAuthRSAKey(
    2: string authSessionId,
    3: enumsC.IdentityProvider provider) throws (1: exceptionsC.TalkException e)

  structsC.RSAKey getRSAKeyInfo(
    2: enumsC.IdentityProvider provider) throws (1: exceptionsC.TalkException e)

  structs.SecurityCenterResult issueTokenForAccountMigration(
    2: string migrationSessionId) throws (1: exceptionsC.TalkException e)

  structs.SecurityCenterResult issueTokenForAccountMigrationSettings(
    2: bool enforce) throws (1: exceptionsC.TalkException e)

  structsC.LoginResult loginZ(
    2: structs.LoginRequest loginRequest) throws (1: exceptionsC.TalkException e)

  void logoutZ() throws (1: exceptionsC.TalkException e)

  string normalizePhoneNumber(
    2: string countryCode,
    3: string phoneNumber,
    4: string countryCodeHint) throws (1: exceptionsC.TalkException e)

  /**
   * Updated: 2020-02-21 (Android 10.1.1)
   */
  string openAuthSession(
    2: structs.AuthSessionRequest authSessionRequest) throws (1: exceptionsC.TalkException e)

  structs.RegisterWithSnsIdResult registerWithSnsId(
    2: enumsC.SnsIdType snsIdType,
    3: string snsAccessToken,
    4: string region,
    5: string udidHash,
    6: structsC.DeviceInfo deviceInfo,
    7: string mid,
    8: string migrationPincodeSessionId) throws (1: exceptionsC.TalkException e)

  void respondE2EELoginRequest(
    1: string verifier,
    2: structsC.E2EEPublicKey publicKey,
    3: binary encryptedKeyChain,
    4: binary hashKeyChain,
    5: enumsC.ErrorCode errorCode) throws (1: exceptionsC.TalkException e)


  /**
   * Updated: 2020-02-21 (Android 10.1.1)
   */
  structs.IdentityCredentialResponse removeIdentifier(
    2: string authSessionId,
    3: structs.IdentityCredentialRequest identityCredentialRequest) throws (1: exceptionsC.TalkException e)

  /**
   * Updated: 2020-02-21 (Android 10.1.1)
   */
  structs.IdentityCredentialResponse resendIdentifierConfirmation(
    2: string authSessionId,
    3: structs.IdentityCredentialRequest identityCredentialRequest) throws (1: exceptionsC.TalkException e)

  /**
   * Updated: 2020-02-21 (Android 10.1.1)
   */
  structs.AuthLoginResponse setClovaCredential(
    2: string authSessionId,
    3: structs.AuthLoginRequest authLoginRequest) throws (1: exceptionsC.TalkException e)

  /**
   * Updated: 2020-02-21 (Android 10.1.1)
   */
  structs.IdentityCredentialResponse setIdentifier(
    2: string authSessionId,
    3: structs.IdentityCredentialRequest identityCredentialRequest) throws (1: exceptionsC.TalkException e)

  /**
   * Updated: 2020-02-21 (Android 10.1.1)
   */
  structs.IdentityCredentialResponse setIdentifierAndPassword(
    2: string authSessionId,
    3: structs.IdentityCredentialRequest identityCredentialRequest) throws (1: exceptionsC.TalkException e)

  /**
   * Updated: 2020-02-21 (Android 10.1.1)
   */
  structs.IdentityCredentialResponse setPassword(
    2: string authSessionId,
    3: structs.IdentityCredentialRequest identityCredentialRequest) throws (1: exceptionsC.TalkException e)

  /**
   * Updated: 2020-02-21 (Android 10.1.1)
   */
  structs.IdentityCredentialResponse updateIdentifier(
    2: string authSessionId,
    3: structs.IdentityCredentialRequest identityCredentialRequest) throws (1: exceptionsC.TalkException e)

  /**
   * Updated: 2020-02-21 (Android 10.1.1)
   */
  structs.IdentityCredentialResponse updatePassword(
    2: string authSessionId,
    3: structs.IdentityCredentialRequest identityCredentialRequest) throws (1: exceptionsC.TalkException e)

  string verifyQrcode(
    2: string verifier,
    3: string pinCode) throws (1: exceptionsC.TalkException e)

  string verifyQrcodeWithE2EE(
    2: string verifier,
    3: string pinCode,
    4: enumsC.ErrorCode errorCode,
    5: structsC.E2EEPublicKey publicKey,
    6: binary encryptedKeyChain,
    7: binary hashKeyChain) throws (1: exceptionsC.TalkException e)

}