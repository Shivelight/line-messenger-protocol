include "enums.thrift"
include "structs.thrift"
include "exceptions.thrift"

namespace cpp LineThrift.primaryaccountinit
namespace py LineThrift.primaryaccountinit
namespace go LineThrift.primaryaccountinit

service PrimaryAccountInitService {
  // 08/04/2021 :: LINE 11.5.2 - DISCOVERED
  structs.FetchPhonePinCodeMsgResponse fetchPhonePinCodeMsg(
    1: structs.FetchPhonePinCodeMsgRequest request) throws(1: exceptions.AuthException e),

 set<string> getCountries(
  2: enums.CountryGroup countryGroup) throws(1: exceptions.AuthException e),

 structs.ExchangeEncryptionKeyResponse exchangeEncryptionKey(
  1: string authSessionId,
  2: structs.ExchangeEncryptionKeyRequest request) throws(1: exceptions.AuthException e),

 structs.GetAcctVerifMethodResponse getAcctVerifMethod(
  1: string authSessionId,
  2: structs.AccountIdentifier accountIdentifier) throws(1: exceptions.AuthException e),

 structs.GetCountryInfoResponse getCountryInfo(
  1: string authSessionId,
  11: structs.SimCard simCard) throws(1: exceptions.AuthException e),

 structs.GetPhoneVerifMethodResponse getPhoneVerifMethod(
  1: string authSessionId,
  2: structs.Device device,
  3: structs.UserPhoneNumber userPhoneNumber) throws(1: exceptions.AuthException e),

 structs.GetPhoneVerifMethodV2Response getPhoneVerifMethodV2(
   1: structs.GetPhoneVerifMethodV2Request request
 ) throws (1: exceptions.AuthException e),

 structs.GetSecondAuthMethodResponse getSecondAuthMethod(
  1: string authSessionId) throws(1: exceptions.AuthException e),

 // 08/04/2021 :: LINE 11.5.2 - DISCOVERED
 structs.GetSessionContentBeforeMigCompletionResponse getSessionContentBeforeMigCompletion(
  1: string authSessionId) throws(1: exceptions.AuthException e),

 structs.GetUserProfileResponse getUserProfile(
  1: string authSessionId,
  2: structs.AccountIdentifier accountIdentifier) throws(1: exceptions.AuthException e),

 structs.IssueWebAuthDetailsForAcctVerifResponse issueWebAuthDetailsForAcctVerif(
  1: string authSessionId,
  2: structs.AccountIdentifier accountIdentifier) throws(1: exceptions.AuthException e),

 // 08/04/2021 :: LINE 11.5.2 - DISCOVERED
 structs.IssueWebAuthDetailsForSecondAuthResponse issueWebAuthDetailsForSecondAuth(
  1: string authSessionId) throws(1: exceptions.AuthException e),

 // 08/04/2021 :: LINE 11.5.2 - UPDATE not exist anymore maybe deprecated?
 structs.MigratePrimaryResponse migratePrimaryUsingPhone(
  1: string authSessionId) throws(1: exceptions.AuthException e),

 // 08/04/2021 :: LINE 11.5.2 - UPDATE not exist anymore maybe deprecated?
 structs.MigratePrimaryResponse migratePrimaryUsingSocialLogin(
  1: string authSessionId) throws(1: exceptions.AuthException e),

 // 08/04/2021 :: LINE 11.5.2 - DISCOVERED
 structs.MigratePrimaryV2Response migratePrimaryUsingEapAccountV2(
  1: string authSessionId) throws(1: exceptions.AuthException e),

 // 08/04/2021 :: LINE 11.5.2 - DISCOVERED
 structs.MigratePrimaryV2Response migratePrimaryUsingPhoneV2(
  1: string authSessionId) throws(1: exceptions.AuthException e),

 // 26/08/2021 :: LINE 11.14.2 - DISCOVERED
 structs.MigratePrimaryWithTokenV3Response migratePrimaryUsingEapAccountWithTokenV3(
  1: string authSessionId) throws(1: exceptions.AuthException e),

 // 26/08/2021 :: LINE 11.14.2 - DISCOVERED
 structs.MigratePrimaryWithTokenV3Response migratePrimaryUsingPhoneWithTokenV3(
  1: string authSessionId) throws(1: exceptions.AuthException e),

 string openSession(
  1: structs.OpenSessionRequest request) throws(1: exceptions.AuthException e),

 structs.RegisterPrimaryResponse registerPrimaryUsingPhone(
  2: string authSessionId) throws(1: exceptions.AuthException e),

 structs.RegisterPrimaryResponse registerPrimaryUsingSocialLogin(
  2: string authSessionId) throws(1: exceptions.AuthException e),

 // 26/08/2021 :: LINE 11.14.2 - DISCOVERED
 structs.RegisterPrimaryWithTokenV3Response registerPrimaryUsingPhoneWithTokenV3(
  2: string authSessionId) throws(1: exceptions.AuthException e),
 
 // 26/08/2021 :: LINE 11.14.2 - DISCOVERED
 structs.ReqToSendPhonePinCodeResponse requestToSendPhonePinCode(
  1: structs.ReqToSendPhonePinCodeRequest request) throws(1: exceptions.AuthException e),

 structs.SendPinCodeForPhoneResponse sendPinCodeForPhone(
  1: string authSessionId,
  2: structs.Device device,
  3: structs.UserPhoneNumber userPhoneNumber,
  4: enums.VerifMethod verifMethod) throws(1: exceptions.AuthException e),

 structs.SetPasswordResponse setPassword(
  1: string authSessionId,
  2: structs.EncryptedPassword encryptedPassword) throws(1: exceptions.AuthException e),

 structs.ValidateProfileResponse validateProfile(
  1: string authSessionId,
  2: string displayName) throws(1: exceptions.AuthException e),

 structs.VerifyAccountUsingPwdResponse verifyAccountUsingPwd(
  1: string authSessionId,
  2: structs.AccountIdentifier accountIdentifier,
  3: structs.EncryptedPassword encryptedPassword) throws(1: exceptions.AuthException e),

 structs.VerifyPhoneResponse verifyPhone(
  1: string authSessionId,
  2: structs.Device device,
  3: structs.UserPhoneNumber userPhoneNumber,
  4: string pinCode) throws(1: exceptions.AuthException e),

 // 26/08/2021 :: LINE 11.14.2 - DISCOVERED
 structs.VerifyPhonePinCodeResponse verifyPhonePinCode(
  1: structs.VerifyPhonePinCodeRequest request) throws(1: exceptions.AuthException e),

 structs.VerifySocialLoginResponse verifySocialLogin(
  1: string authSessionId,
  2: structs.Device device,
  3: structs.SocialLogin socialLogin) throws(1: exceptions.AuthException e)
}