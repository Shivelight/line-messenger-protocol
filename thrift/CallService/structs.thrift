include "enums.thrift"

namespace py LineThrift.call.structs
namespace go LineThrift.call.structs

struct CallHost {
  1: string host
  2: i32 port
  3: string zone
}

struct GroupCallRoute {
  1: string token
  2: CallHost cscf
  3: CallHost mix
  4: string hostMid
  5: list<string> capabilities
}

struct PaidCallCurrencyExchangeRate {
  1: string currencyCode
  2: string currencyName
  3: string currencySign
  4: bool preferred
  5: string coinRate
  6: string creditRate
}

struct PaidCallDialing {
  1: enums.PaidCallType type
  2: string dialedNumber
  3: string serviceDomain
  4: enums.PaidCallProductType productType
  5: string productName
  6: bool multipleProduct
  7: enums.PaidCallerIdStatus callerIdStatus
  10: i32 balance
  11: string unit
  12: i32 rate
  13: string displayCode
  14: string calledNumber
  15: string calleeNationalNumber
  16: string calleeCallingCode
  17: string rateDivision
  20: i32 adMaxMin
  21: i32 adRemains
  22: string adSessionId
}

struct SpotItem {
  2: string name
  3: string phone
  4: enums.SpotCategory category
  5: string mid
  6: string countryAreaCode
  10: bool freePhoneCallable
}

struct PaidCallResponse {
  1: CallHost host
  2: PaidCallDialing dialing
  3: string token
  4: list<SpotItem> spotItems
}

struct ContactTransition {
  1: string ownerMid
  2: string targetMid
  3: enums.ContactStatus previousStatus
  4: enums.ContactStatus resultStatus
}

struct Contact {
  1: string mid
  2: i64 createdTime
  10: enums.ContactType type
  11: enums.ContactStatus status
  21: enums.ContactRelation relation
  22: string displayName
  23: string phoneticName
  24: string pictureStatus
  25: string thumbnailUrl
  26: string statusMessage
  27: string displayNameOverridden
  28: i64 favoriteTime
  31: bool capableVoiceCall
  32: bool capableVideoCall
  33: bool capableMyhome
  34: bool capableBuddy
  35: i32 attributes
  36: i64 settings
  37: string picturePath
  38: string recommendParams
  39: enums.FriendRequestStatus friendRequestStatus
  40: string musicProfile
  42: string videoProfile
}

struct Room {
  1: string mid
  2: i64 createdTime
  10: list<Contact> contacts
  31: bool notificationDisabled
  40: list<string> memberMids
}

struct SimpleChannelContact {
  1: string mid
  2: string displayName
  3: string pictureStatus
  4: string picturePath
  5: string statusMessage
}

struct CoinProductItem {
  1: string itemId
  2: i32 coin
  3: i32 freeCoin
  5: string currency
  6: string price
  7: string displayPrice
  8: string name
  9: string desc
}

struct CoinPayLoad {
  1: i32 payCoin
  2: i32 freeCoin
  3: enums.PayloadType type
  4: i32 rewardCoin
}

struct CoinHistory {
  1: i64 payDate
  2: i32 coinBalance
  3: i32 coin
  4: string price
  5: string title
  6: bool refund
  7: string paySeq
  8: string currency
  9: string currencySign
  10: string displayPrice
  11: CoinPayLoad payload
  12: string channelId
}

struct Coin {
  1: i32 freeCoinBalance
  2: i32 payedCoinBalance
  3: i32 totalCoinBalance
  4: i32 rewardCoinBalance
}

struct CoinHistoryResult {
  1: list<CoinHistory> historys
  2: Coin balance
  3: bool hasNext
}

struct CoinHistoryCondition {
  1: i64 start
  2: i32 size
  3: string language
  4: string eddt
  5: enums.PaymentType appStoreCode
}

struct CompactContact {
  1: string mid
  2: i64 createdTime
  3: i64 modifiedTime
  4: enums.ContactStatus status
  5: i64 settings
  6: string displayNameOverridden
}

struct ExtendedProfileBirthday {
  1: string year
  2: enums.PrivacyLevelType yearPrivacyLevelType
  3: bool yearEnabled
  5: string day
  6: enums.PrivacyLevelType dayPrivacyLevelType
  7: bool dayEnabled
}

struct ExtendedProfile {
  1: ExtendedProfileBirthday birthday
}

struct GroupCall {
  1: bool online
  2: string chatMid
  3: string hostMids
  4: list<string> memberMids
  5: i64 started
  6: enums.MediaType mediaType
}

struct GroupPreference {
  1: string invitationTicket
  2: i64 favoriteTimestamp
}

struct Group {
  1: string id
  2: i64 createdTime
  10: string name
  11: string pictureStatus
  12: bool preventedJoinByTicket
  13: GroupPreference groupPreference
  20: list<Contact> members
  21: Contact creator
  22: list<Contact> invitee
  31: bool notificationDisabled
  32: string picturePath
  40: list<string> memberMids
  41: list<string> inviteeMids
}

struct IdentityCredential {
  1: enums.IdentityProvider provider
  2: string identifier
  3: string password
}

struct MetaProfile {
  1: i64 createTime
  2: string regionCode
  3: map<enums.RegistrationType, string> identities
}

struct PaidCallAdResult {
  1: i32 adRemains
}

struct PaidCallBalance {
  1: enums.PaidCallProductType productType
  2: string productName
  3: string unit
  4: i32 limitedPaidBalance
  5: i32 limitedFreeBalance
  6: i32 unlimitedPaidBalance
  7: i32 unlimitedFreeBalance
  8: i64 startTime
  9: i64 endTime
  10: bool autopayEnabled
}

struct PaidCallHistory {
  1: i64 seq
  2: enums.PaidCallType type
  3: string dialedNumber
  4: string calledNumber
  5: string toMid
  6: string toName
  7: i64 setupTime
  8: i64 startTime
  9: i64 endTime
  10: i64 duration
  11: i32 terminate
  12: enums.PaidCallProductType productType
  13: i32 charge
  14: string unit
  15: string result
}

struct PaidCallHistoryResult {
  1: list<PaidCallHistory> historys
  2: bool hasNext
}

struct PaidCallAdCountry {
  1: string countryCode
  2: string rateDivision
}

struct PaidCallMetadataResult {
  1: list<PaidCallCurrencyExchangeRate> currencyExchangeRates
  2: list<string> recommendedCountryCodes
  3: list<PaidCallAdCountry> adCountries
}

struct PhoneInfoForChannel {
  1: string mid
  2: string normalizedPhoneNumber
  3: bool allowedToSearchByPhoneNumber
  4: bool allowedToReceiveMessageFromNonFriend
  5: string region
}

struct SimpleChannelClient {
  1: string applicationType
  2: string applicationVersion
  3: string locale
}

struct Profile {
  1: string mid
  3: string userid
  10: string phone
  11: string email
  12: string regionCode
  20: string displayName
  21: string phoneticName
  22: string pictureStatus
  23: string thumbnailUrl
  24: string statusMessage
  31: bool allowSearchByUserid
  32: bool allowSearchByEmail
  33: string picturePath
  34: string musicProfile
  35: string videoProfile
}

struct UserTicketResponse {
  1: string mid
  2: string userTicket
}

struct NotiCenterEventData {
  1: string id
  2: string to
  3: string from_
  4: string toChannel
  5: string fromChannel
  6: string eventType
  7: i64 createdTime
  8: i64 operationRevision
  9: map<string, string> content
  10: map<string, string> push
}

struct PaidCallRedeemResult {
  1: string eventName
  2: i32 eventAmount
}

struct PaymentReservationResult {
  1: string orderId
  2: string confirmUrl
  3: map<string, string> extras
}

struct CoinPurchaseReservation {
  1: string productId
  2: string country
  3: string currency
  4: string price
  5: enums.PaymentType appStoreCode
  6: string language
  7: enums.PaymentPgType pgCode
  8: string redirectUrl
}

struct PaidCallUserRate {
  1: string countryCode
  2: i32 rate
  3: string rateDivision
  4: string rateName
}

struct Location {
  1: string title
  2: string address
  3: double latitude
  4: double longitude
  5: string phone
}

struct Message {
  1: string from_
  2: string to
  3: enums.MIDType toType
  4: string id
  5: i64 createdTime
  6: i64 deliveredTime
  10: string text
  11: Location location
  14: bool hasContent
  15: enums.ContentType contentType
  17: binary contentPreview
  18: map<string, string> contentMetadata
  19: i8 sessionId
  20: list<binary> chunks
  21: string relatedMessageId
  22: enums.MessageRelationType messageRelationType
  23: i32 readCount
  24: enums.ServiceCode relatedMessageServiceCode
}

