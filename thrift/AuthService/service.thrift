include "enums.thrift"
include "structs.thrift"
include "exceptions.thrift"

namespace py LineThrift.auth

service AuthService {

  string confirmE2EELogin(
    1: string verifier,
    2: binary deviceSecret) throws (1: exceptions.TalkException e)

  string createAccountMigrationPincodeSession() throws (1: exceptions.TalkException e)

  structs.SnsIdUserStatus findSnsIdUserStatus(
    2: enums.SnsIdType snsIdType,
    3: string snsAccessToken,
    4: string udidHash,
    5: string migrationPincodeSessionId,
    6: string oldUdidHash) throws (1: exceptions.TalkException e)

  structs.AuthQrcode getAuthQrcode(
    2: bool keepLoggedIn,
    3: string systemName) throws (1: exceptions.TalkException e)

  structs.RSAKey getRSAKeyInfo(
    2: enums.IdentityProvider provider) throws (1: exceptions.TalkException e)

  structs.SecurityCenterResult issueTokenForAccountMigration(
    2: string migrationSessionId) throws (1: exceptions.TalkException e)

  structs.SecurityCenterResult issueTokenForAccountMigrationSettings(
    2: bool enforce) throws (1: exceptions.TalkException e)

  structs.LoginResult loginZ(
    2: structs.LoginRequest loginRequest) throws (1: exceptions.TalkException e)

  void logoutZ() throws (1: exceptions.TalkException e)

  string normalizePhoneNumber(
    2: string countryCode,
    3: string phoneNumber,
    4: string countryCodeHint) throws (1: exceptions.TalkException e)

  structs.RegisterWithSnsIdResult registerWithSnsId(
    2: enums.SnsIdType snsIdType,
    3: string snsAccessToken,
    4: string region,
    5: string udidHash,
    6: structs.DeviceInfo deviceInfo,
    7: string mid,
    8: string migrationPincodeSessionId) throws (1: exceptions.TalkException e)

  void respondE2EELoginRequest(
    1: string verifier,
    2: structs.E2EEPublicKey publicKey,
    3: binary encryptedKeyChain,
    4: binary hashKeyChain,
    5: enums.ErrorCode errorCode) throws (1: exceptions.TalkException e)

  string verifyQrcode(
    2: string verifier,
    3: string pinCode) throws (1: exceptions.TalkException e)

  string verifyQrcodeWithE2EE(
    2: string verifier,
    3: string pinCode,
    4: enums.ErrorCode errorCode,
    5: structs.E2EEPublicKey publicKey,
    6: binary encryptedKeyChain,
    7: binary hashKeyChain) throws (1: exceptions.TalkException e)

}