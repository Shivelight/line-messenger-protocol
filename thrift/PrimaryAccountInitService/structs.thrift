include "enums.thrift"

namespace py LineThrift.primaryaccountinitservice.structs
namespace go LineThrift.primaryaccountinitservice.structs

struct AccountIdentifier {
 1: enums.AccountIdentifierType type,
 2: string identifier,
 11: string countryCode
}

struct Device {
 1: string udid,
 2: string deviceModel
}

struct EncryptedPassword {
 1: enums.EncryptionKeyVersion encryptionKeyVersion,
 2: string cipherText
}

struct ExchangeEncryptionKeyRequest {
 1: enums.EncryptionKeyVersion authKeyVersion,
 2: string publicKey,
 3: string nonce
}

struct ExchangeEncryptionKeyResponse {
 1: string publicKey,
 2: string nonce
}

struct GetAcctVerifMethodResponse {
 1: enums.AvailableMethod availableMethod,
 2: bool sameAccountFromAuthFactor
}

struct GetCountryInfoResponse {
 1: string countryCode,
 2: bool countryInEEA,
 3: set<string> countrySetOfEEA
}

struct GetPhoneVerifMethodResponse {
 1: list<enums.VerifMethod> availableMethods,
 3: string prettifiedPhoneNumber
}

struct GetSecondAuthMethodResponse {
 1: enums.SecondAuthMethod secondAuthMethod
}

struct GetUserProfileResponse {
 1: UserProfile userProfile
}

struct IssueWebAuthDetailsForAcctVerifResponse {
 1: WebAuthDetails webAuthDetails
}

struct IssueWebAuthDetailsForSecondAuthResponse {
 1: WebAuthDetails webAuthDetails
}

struct MigratePrimaryResponse {
 1: string authToken
}

struct OpenSessionRequest {
 1: map<string, string> metaData
}

struct SendPinCodeForPhoneResponse {
 1: enums.VerifMethod availableMethods
}

struct SimCard {
 1: string countryCode,
 2: string hni,
 3: string carrierName
}

struct RegisterPrimaryResponse {
 1: string authToken
}

struct SetPasswordResponse {}

struct SocialLogin {
 1: enums.SocialLoginType type,
 2: string accessToken,
 3: string countryCode
}

struct UserPhoneNumber {
 1: string phoneNumber,
 2: string countryCode
}

struct UserProfile {
 1: string displayName,
 2: string profileImageUrl
}

struct ValidateProfileResponse {}

struct VerifyAccountUsingPwdResponse {
 2: UserProfile userProfile
}

struct VerifyPhoneResponse {
 2: bool accountExist,
 3: bool sameUdidFromAccount,
 11: UserProfile userProfile
}

struct VerifySocialLoginResponse {
 2: bool accountExist,
 11: UserProfile userProfile
}

struct WebAuthDetails {
 1: string baseUrl,
 2: string token
}