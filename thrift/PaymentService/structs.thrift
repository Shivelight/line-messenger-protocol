include "enums.thrift"
include "../Common/enumsC.thrift"
include "../Common/structsC.thrift"

namespace py LineThrift.payment.structs
namespace go LineThrift.payment.structs


struct PaymentSettingsMenuInfoAccount {
	1: string financialCorporationName
	2: string accountNo
	4: string imageUrl
}
struct PaymentSettingsMenuInfo {
	1: string certificationStatus
	2: string memberGradeType
	3: bool recieveMoneyEnabled
	4: list<PaymentSettingsMenuInfoAccount> accounts
	5: string bankAccountSettingUrl
	6: bool lineCardUser
}

struct DisplayMoney {
	1: string amount
	2: string amountString
	3: string currency
}
struct PaymentCancellationInfo {
	1: enums.TransactionType transactionType
	3: i64 cancelDate
	4: DisplayMoney cancelAmount
	5: DisplayMoney remainAmount
}
struct PaymentDetailInfo {
	1: string transactionId
	2: i64 transactionDate
	3: enums.TransactionType transactionType
	4: string productName
	6: enums.PayMethodType paymethod
	7: string cardCorporation
	8: string maskedCardNumber
	9: string merchantName
	10: string merchantTelNo
	11: string merchantRepresentative
	12: list<PaymentCancellationInfo> cancelList
	13: DisplayMoney moneyAmount
	14: string accountNickname
	15: string merchantEmail
	16: i64 confirmDate
	17: string merchantLabel
}

struct PaymentFlowTypeCustomElement {
	1: string id
	2: string value
	3: string style
	4: string regularExpression
	5: bool visible
	6: string uri
}
struct PaymentFlowTypeCustom {
	1: string view
	2: list<PaymentFlowTypeCustomElement> elements
}
struct PaymentRequiredAgreementsInfo {
	1: string title
	2: string desc
	3: string linkName
	4: string linkUrl
	5: list<string> newAgreements
}

struct PaymentFlowTypeInfo {
	1: enums.FlowType flowType
	2: enums.AuthType authType
	// session: list<str>
	3: map<binary, list<string>> handleableOps
	4: list<PaymentFlowTypeCustom> customs
}

struct PaymentTransferTargetInfo {
	1: string name
	2: string accountNo
	3: string referenceNo
	4: string lineMemberId
}

struct PaymentAuthenticationInfo {
	1: string authToken
	2: string confirmMessage
}

struct PaymentAvailableAuth {
	1: list<enums.AuthMethodType> methods
	2: string authToken
}

struct CheckOperationResult {
	1: bool trandable
	2: string reason
	3: string detailMessage
}

struct PaymentCountrySettingMenu {
	16: i64 id
	1: enums.SettingMenuType type
	2: i32 order
	3: string imgUrl
	4: string touchImgUrl
	5: string linkUrl
	6: string name
	7: enums.LinkType linkType
	8: enums.BadgeType badgeType
	9: string androidImageUrl
	10: string iosImageurl
	11: string androidLinkUrl
	12: string androidPackageName
	13: string iosLinkUrl
	14: string androidStoreUrl
	15: string iosStoreUrl
	17: i64 sequence
	18: enums.DisplayType displayType
}
struct PaymentUrlInfo {
	1: string url
	2: bool mustScroll
	3: string pageTitle
	4: string label
	5: string labelJoin
	6: bool acceptanceRequired
	7: string labelDesc
}
struct PaymentTosUrlBundle {
	1: list<string> urls
	2: string prefixText
}
struct PaymentCardValidationRule {
	2: string regex
	3: string grouping
	4: i32 maxLength
	5: string cardBrandName
	6: string securityCodeHelper
	7: enums.CardBrandType cardBrand
}
struct PaymentMyCode {
	1: string shortcutUrl
	2: string shortcutIconUrl
	3: string shortcutIconText
	4: string shortcutSchemeUrl
}
struct PayInvoiceSetting {
	1: string regexp
	2: i32 maxLength
}
struct PaymentCacheableSettings {
	1: map<enums.CachableSettingType, i64> timestamps
	2: map<enums.MenuType, list<PaymentCountrySettingMenu>> menus
	3: map<string, PaymentUrlInfo> urls
	4: map<enums.UrlGroupType, list<string>> urlGroups
	5: map<enums.TosUrlType, list<PaymentTosUrlBundle>> tosUrlBundles
	6: list<PaymentCardValidationRule> cardValidationRules
	7: map<enums.MessageType, map<string, string>> messages
	8: PaymentMyCode myCode
	9: PayInvoiceSetting invoice
	10: map<enums.SettingFeatureType, map<string, string>> features
}


struct RSAEncryptedPassword {
	1: string encrypted
	2: string keyName
}
struct ThRegionalInfo {
	1: string firstName
	2: string lastName
	3: string identificationNo
	4: enums.RegionalInfoIdentificationType identificationType
}
struct PaymentRegionalInfo {
	1: ThRegionalInfo th
}
struct CreatedPaymentUserInfoEx {
	1: bool carryOverAvailable
}

struct PaymentLineCardInfo {
	1: string designCode
	2: string imageUrl
}
struct PaymentLineCardIssueForm {
	1: enums.TosUrlType requiredTermsOfServiceBundle
	2: list<PaymentLineCardInfo> availableLineCards
}

struct UnregisterAvailabilityInfo {
	1: enums.UnregisterInfoType result
	2: string message
}

struct PaymentTradeInfo {
	1: string chargeRequestId
	2: enums.TradeRequestType chargeRequestType
	3: i64 chargeRequestYmdt
	4: string tradeNumber
	7: string agencyNo
	8: string confirmNo
	9: i64 expireYmd
	10: DisplayMoney moneyAmount
	11: i64 completeYmdt
	12: string paymentProcessCorp
	13: enums.TradeStatusType status
	14: string helpUrl
	15: string guideMessage
}

struct PaymentAddressSearchResult {
	1: string state
	2: string address1
}

struct BankInfo {
	1: i64 bankId
	2: string financialCorpId
	3: string financialCorpCode
	4: enums.BankType type
	5: string name
	6: string imageUrl
	7: string name2
	8: string preCreationText
}

struct LinePayAccountInfo {
	1: enums.LinePayAccountType accountType //
	2: string accountId
	3: string nickname
	4: enums.LinePayAccountStatus status //
	5: string financialCorporationName
	6: string realAccountNo
	7: string currency
	8: enums.AccountProductCode accountProductType
	9: string branchName
	10: bool withdraw
	11: bool deposit
	12: string ownerName
	13: string imageUrl
	14: bool primary
	15: string accountProductName
	16: bool holderNameRegistered
	17: enums.CardBrandType cardBrand
	18: string debitImageUrl
	19: bool lineCard
	20: string lineCaardImageId
	21: string textColor
	22: string placeholderColor
	23: string backgroundColor
	24: set<enums.LinePayExtendedFeatureType> extendedFeatures
}

struct TransferRequestReceivedInfo {
	1: string requestId
	2: enums.TransferRequestType requestType
	3: string receiveLineMemberId
	4: string receiveLineUserNickname
	7: string sendMessage
	8: i64 requestDate
	9: enums.TransferStatusType status
	10: DisplayMoney moneyAmount
}
struct TransferRequestInfo {
	1: string requestId
	2: enums.TransferRequestType requestType
	3: string requestLineMemberId
	4: string requestLineUserNickname
	5: string receiveLineMemberId
	6: string receiveLineUserNickname
	9: string sendMessage
	10: i64 requestDate
	11: enums.TransferStatusType status
	13: list<TransferRequestReceivedInfo> requestReceivedInfo
	14: map<string, string> messageMetadata
	15: DisplayMoney moneyAmount
	16: i32 totalMemberCount
	17: i32 startNum
	18: string messageId
	19: i32 otherMemberCount
}

struct BankBranchInfo {
	1: string branchId
	2: string branchCode
	3: string name
	4: string name2
}


struct PaymentCybsInfo {
	1: string merchantId
	2: string orgId
	3: string serverUrl
}
struct PaymentCountrySettingLimitInfo {
	1: i32 depositBank
	2: i32 withdrawalBank
	3: i32 possessionOfCards
}
struct PayWithdrawStaticMenu {
	1: string title
	2: string urlKey
	3: string imageurl
}
struct PaymentCountrySettingInfoEx {
	1: bool balanceSupport
	2: enums.BalanceType balanceType
	3: i32 asyncWaitTimeout
	4: bool creditcardSupport
	5: PaymentCybsInfo cybs
	6: bool crossBorderTransfer
	7: enums.AddressType addressSearchType
	8: list<PaymentCountrySettingMenu> menu
	9: list<enums.DepositMethodType> depositMethods
	10: map<string, PaymentUrlInfo> urls
	11: map<enums.UrlGroupType, list<string>> urlGroups
	12: bool paygEnabled
	13: PaymentCountrySettingLimitInfo limit
	14: bool emailRequired
	15: map<enums.TosUrlType, list<PaymentTosUrlBundle>> tosUrlBundles
	16: enums.RegistrationType registrationType
	17: bool pointSupport
	18: string registrationUrl
	19: string introUrl
	20: bool touchidMenuAvailable
	21: bool myCodePasswordRequired
	22: map<enums.WithdrawStaticMenuType, list<PayWithdrawStaticMenu>> settingWithdrawStaticMenu
}

struct PaymentEligibleFriendStatus {
	1: string mid
	2: enums.EligibleFriendStatusType type
}