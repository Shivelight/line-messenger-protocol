include "enums.thrift"
include "structs.thrift"
include "../Common/enumsC.thrift"
include "../Common/structsC.thrift"
include "../Common/exceptionsC.thrift"

namespace py LineThrift.payment
namespace go LineThrift.payment


service PaymentService {

	structs.PaymentSettingsMenuInfo getSettingsMenuInfo() throws (1: exceptionsC.TalkException e)

	void cancelTradeRequest(
		1: string chargeRequestId) throws (1: exceptionsC.TalkException e)

	string issueFinanceRequestToken() throws (1: exceptionsC.TalkException e)

	structs.PaymentDetailInfo getPaymentDetail(
		1: string transactionId) throws (1: exceptionsC.TalkException e)

	structs.PaymentRequiredAgreementsInfo getRequiredAgreements() throws (1: exceptionsC.TalkException e)

	void createIpassAccount() throws (1: exceptionsC.TalkException e)

	void carryForwardLinePayAccount(
		1: string authToken) throws (1: exceptionsC.TalkException e)

	string issueTTSPinCodeV2(
		1: string authToken) throws (1: exceptionsC.TalkException e)

	structs.PaymentFlowTypeInfo getFlowType(
		1: enums.FeatureType featureType,
		2: string accountId,
		3: bool onlyPointPayment) throws (1: exceptionsC.TalkException e)

	structs.PaymentTransferTargetInfo getTransferTargetInfo(
		1: string toMid,
		2: enums.SearchType searchType) throws (1: exceptionsC.TalkException e)

	structs.PaymentAuthenticationInfo authenticateUsingBankAccountEx(
		1: enums.BankType type,
		2: string bankId,
		3: string bankBranchId,
		4: string realAccountNo,
		5: enums.AccountProductCode accountProductCode,
		6: string authToken) throws (1: exceptionsC.TalkException e)

	structs.PaymentAuthenticationInfo authenticateUsingBalanceEx(
		1: string balanceAmount,
		2: string authToken) throws (1: exceptionsC.TalkException e)

	structs.PaymentAuthenticationInfo authenticateUsingNameAndBirthdayEx(
		1: string firstName,
		2: string lastName,
		3: string phoneticFirstName,
		4: string phoneticLastName,
		5: string birthday,
		6: string authToken) throws (1: exceptionsC.TalkException e)

	structs.PaymentAvailableAuth checkAvailableAuthMethods(
		1: enums.AuthPasswordType type) throws (1: exceptionsC.TalkException e)

	structs.CheckOperationResult checkOperationTimeEx(
		1: enums.OperationType type,
		2: string lpAccountNo,
		3: enums.ChannelType channelType) throws (1: exceptionsC.TalkException e)

	// maf01
	structs.PaymentCacheableSettings getCacheableSettings(
		1: enums.ResolutionType resolutionType,
		2: map<enums.CachableSettingType, i64> timestamps) throws (1: exceptionsC.TalkException e)

	structs.CreatedPaymentUserInfoEx createAccountV4(
		1: structs.RSAEncryptedPassword password,
		2: set<string> agreements, // Set<PaymentUrlId>
		3: enums.JoinPathType joinPath,
		4: string transactionReserveId,
		5: string deviceIdentifier,
		6: string publicValueX,
		7: string publicValueY,
		8: structs.PaymentRegionalInfo regionalInfo) throws (1: exceptionsC.TalkException e)

	structs.PaymentLineCardIssueForm getLineCardIssueForm(
		1: enums.ResolutionType resolutionType) throws (1: exceptionsC.TalkException e)

	structs.PaymentCountrySettingInfoEx getCountrySettingV4(
		1: string processor,
		2: string manufacture,
		3: string model) throws (1: exceptionsC.TalkException e)

	structs.TransferRequestInfo getTransferRequestInfo(
		1: string requestId,
		2: i32 startNum,
		3: i32 count) throws (1: exceptionsC.TalkException e)


	structs.UnregisterAvailabilityInfo checkCanUnregisterEx(
		1: enums.AccountType type) throws (1: exceptionsC.TalkException e)

	structs.PaymentTradeInfo requestTradeNumber(
		1: string requestToken,
		2: enums.TradeRequestType requestType,
		3: string amount,
		4: string name) throws (1: exceptionsC.TalkException e)

	structs.PaymentAddressSearchResult searchAddress(
		1: enums.AddressType type,
		2: string query) throws (1: exceptionsC.TalkException e)

	list<structs.BankInfo> listBanks(
		1: enums.BankType type) throws (1: exceptionsC.TalkException e)

	list<structs.LinePayAccountInfo> listLinePayBankAccounts(
		1: enums.BankType type,
		2: string transactionReserveId) throws (1: exceptionsC.TalkException e)

	list<structs.PaymentTradeInfo> listTradeNumbers(
		1: enums.TradeRequestType type,
		2: i64 startDate,
		3: i64 endDate,
		4: i32 startNum,
		5: i32 count,
		6: enums.TradeStatusType status) throws (1: exceptionsC.TalkException e)

	list<structs.TransferRequestInfo> listTransferRequests(
		1: string type,
		2: i64 startDate,
		3: i64 endDate,
		4: i32 startNum,
		5: i32 count) throws (1: exceptionsC.TalkException e)

	list<structs.BankBranchInfo> getBankBranches(
		1: string financialCorpId,
		2: string query,
		3: i32 startNum,
		4: i32 count) throws (1: exceptionsC.TalkException e)

	structs.PaymentEligibleFriendStatus validateEligibleFriends(
		1: list<string> friends,
		2: enums.EligibleType type) throws (1: exceptionsC.TalkException e)

	void checkAuthType(
		1: enums.AuthType authType,
		2: enums.FeatureType featureType,
		3: string accountId) throws (1: exceptionsC.TalkException e)

	void resumeSuspendedUser(
		1: structs.RSAEncryptedPassword password,
		2: string sessionToken) throws (1: exceptionsC.TalkException e)

	void authPassword(
		1: structs.RSAEncryptedPassword password,
		2: string authRequestId,
		3: string sessionToken) throws (1: exceptionsC.TalkException e)

	void bindDevice(
		1: structs.RSAEncryptedPassword password,
		2: string deviceIdentifier,
		3: string publicValueX,
		4: string publicValueY) throws (1: exceptionsC.TalkException e)

	void issueOtpAsync(
		1: string requestToken,
		2: enums.FeatureType featureType,
		3: string accountId,
		4: string toMid,
		5: string amount,
		6: bool isManual) throws (1: exceptionsC.TalkException e)

	//verifyPasswordStrengthAsync
	//changePasswordAsync
	//authPasswordAsync
	//validateIdPasswordAsync
	//registerBarcodeAsync
	//authenticateUsingCitizenIdAsync
	//createDutchTransferRequestAsync
	//cancelTransferRequests
	//postPopupButtonEvents
	//inviteFriends
	//updateUserGeneralSettings
	//changeAgreementStatus
	//enablePointForOneTimeKey
	//removeUser
	//setMinimumBalanceNotification
	//getBalance
	//authenticateUsingReferenceNoEx
	//carryForwardLinePayAccount
	//requestIdentification
	//createTransferRequestAsync
	//updatePasswordLock
	//getLinePayAccount
	//getPoint
	//verifyTTSPinCode
	//getAccountBalanceAsync
	//getPaymentDetail
	//getRequiredAgreements
	//getSettingsMenuInfo
	//getPaymentUrlByKey
	//getUserInfoDigest
	//getUserInfoDigest
	//getStatusInfo
	//issueFinanceRequestToken
	//issueCreditCardToken
	//issueNonce
	//issueTTSPinCodeV2
	//listInvitationInfo
	//listInvitationInfo
	//issueRequestToken
	//issueTrackingTicket
	//removeLinePayAccount
	//listJobs
	//validatePayg
	
}