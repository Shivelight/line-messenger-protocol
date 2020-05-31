include "enumsC.thrift"

namespace py LineThrift.common.structsC
namespace go LineThrift.common.structsC

struct ChatEffectMetaContent {
  1: string url
  2: string checksum
}

struct ChatEffectMeta {
  1: i64 contentId
  2: enumsC.ChatEffectMetaCategory category
  3: string name
  4: ChatEffectMetaContent defaultContent
  5: map<enumsC.ChatEffectMetaOptionalType, ChatEffectMetaContent> optionalContents
  6: set<string> keywords
  7: i64 beginTimeMillis
  8: i64 endTimeMillis
  9: i64 createdTimeMillis
  10: i64 updatedTimeMillis
}

struct GroupExtra {
  1: string creator
  2: bool preventedJoinByTicket
  3: string invitationTicket
  4: map<string, i64> memberMids
  5: map<string, i64> inviteeMids
}
struct PeerExtra {
}
struct ChatExtra {
  1: GroupExtra groupExtra
  2: PeerExtra peerExtra
}

struct Chat {
  1: enumsC.ChatType type
  2: string chatMid
  3: i64 createdTime
  4: bool notificationDisabled
  5: i64 favoriteTimestamp
  6: string chatName
  7: string picturePath
  8: GroupExtra extra
}



struct RSAKey {
  1: string keynm
  2: string nvalue
  3: string evalue
  4: string sessionKey
}

struct AuthQrcode {
  1: string qrcode
  2: string verifier
  3: string callbackUrl
}

struct VerificationSessionData {
  1: string sessionId
  2: enumsC.VerificationMethod method
  3: string callback
  4: string normalizedPhone
  5: string countryCode
  6: string nationalSignificantNumber
  7: list<enumsC.VerificationMethod> availableVerificationMethods
  8: string callerIdMask
}

struct LoginResult {
  1: string authToken
  2: string certificate
  3: string verifier
  4: string pinCode
  5: enumsC.LoginResultType type
  6: i64 lastPrimaryBindTime
  7: string displayMessage
  8: VerificationSessionData sessionForSMSConfirm
}

struct DeviceInfo {
  1: string deviceName
  2: string systemName
  3: string systemVersion
  4: string model
  10: enumsC.CarrierCode carrierCode
  11: string carrierName
  20: enumsC.ApplicationType applicationType
}

struct E2EEPublicKey {
  1: i32 version
  2: i32 keyId
  4: binary keyData
  5: i64 createdTime
}

struct BuddyDetail {
  1: string mid
  2: i64 memberCount
  3: bool onAir
  4: bool businessAccount
  5: bool addable
  6: set<enumsC.ContentType> acceptableContentTypes
  7: bool capableMyhome
  8: bool freePhoneCallable
  9: string phoneNumberToDial
  10: bool needPermissionApproval
  11: i32 channelId
  12: string channelProviderName
  13: i32 iconType
  14: enumsC.BotType botType
  15: bool showRichMenu
  16: i64 richMenuRevision
  17: enumsC.BuddyOnAirLabel onAirLabel
  27: i32 onAirVersion
  18: bool useTheme
  19: string themeId
  20: bool useBar
  21: i64 barRevision
  22: bool useBackground
  23: string backgroundId
  24: bool statusBarEnabled
  25: i64 statusBarRevision
  26: bool capableChat
}

struct Ticket {
  1: string id
  10: i64 expirationTime
  21: i32 maxUseCount
}

struct ClientNetworkStatus {
  1: enumsC.NetworkType networkType
}

struct Location {
  1: string title
  2: string address
  3: double latitude
  4: double longitude
  5: string phone
}

struct GeolocationAccuracy {
  1: double radiusMeters
  2: double radiusConfidence
}

struct Geolocation {
  1: double longitude
  2: double latitude
  3: GeolocationAccuracy accuracy
}

struct Message {
  1: string from_
  2: string to
  3: enumsC.MIDType toType
  4: string id
  5: i64 createdTime
  6: i64 deliveredTime
  10: string text
  11: Location location
  14: bool hasContent
  15: enumsC.ContentType contentType
  17: binary contentPreview
  18: map<string, string> contentMetadata
  19: i8 sessionId
  20: list<binary> chunks
  21: string relatedMessageId
  22: enumsC.MessageRelationType messageRelationType
  23: i32 readCount
  24: enumsC.ServiceCode relatedMessageServiceCode
  25: enumsC.AppExtensionType appExtensionType
}

struct AvatarProfile {
  1: string version
  2: i64 updatedMillis
}

struct Contact {
  1: string mid
  2: i64 createdTime
  10: enumsC.ContactType type
  11: enumsC.ContactStatus status
  21: enumsC.ContactRelation relation
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
  39: enumsC.FriendRequestStatus friendRequestStatus
  40: string musicProfile
  42: string videoProfile
  43: map<string, string> statusMessageContentMetadata
  44: AvatarProfile avatarProfile
}

struct SpotItem {
  2: string name
  3: string phone
  4: enumsC.SpotCategory category
  5: string mid
  6: string countryAreaCode
  10: bool freePhoneCallable
}

struct ContactTransition {
  1: string ownerMid
  2: string targetMid
  3: enumsC.ContactStatus previousStatus
  4: enumsC.ContactStatus resultStatus
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
  3: enumsC.PayloadType type
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
  5: enumsC.PaymentType appStoreCode
}

struct CompactContact {
  1: string mid
  2: i64 createdTime
  3: i64 modifiedTime
  4: enumsC.ContactStatus status
  5: i64 settings
  6: string displayNameOverridden
}

struct ExtendedProfileBirthday {
  1: string year
  2: enumsC.PrivacyLevelType yearPrivacyLevelType
  3: bool yearEnabled
  5: string day
  6: enumsC.PrivacyLevelType dayPrivacyLevelType
  7: bool dayEnabled
}

struct ExtendedProfile {
  1: ExtendedProfileBirthday birthday
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
  1: enumsC.IdentityProvider provider
  2: string identifier
  3: string password
}

struct MetaProfile {
  1: i64 createTime
  2: string regionCode
  3: map<enumsC.RegistrationType, string> identities
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
  5: enumsC.PaymentType appStoreCode
  6: string language
  7: enumsC.PaymentPgType pgCode
  8: string redirectUrl
}

struct Operation {
  1: i64 revision
  2: i64 createdTime
  3: enumsC.OpType type
  4: i32 reqSeq
  5: string checksum
  7: enumsC.OpStatus status
  10: string param1
  11: string param2
  12: string param3
  20: Message message
}

struct SyncParamMid {
  1: string mid
  2: enumsC.Diff diff
  3: i64 revision
}

struct SyncParamContact {
  1: SyncParamMid syncParamMid
  2: enumsC.ContactStatus contactStatus
}

struct SyncRelations {
  1: bool syncAll
  2: list<SyncParamContact> syncParamContact
  3: list<SyncParamMid> syncParamMid
}

struct SyncScope {
  1: bool syncProfile
  2: bool syncSettings
  3: bool syncSticker
  4: bool syncThemeShop
  10: SyncRelations contact
  11: SyncRelations group
  12: SyncRelations room
  13: SyncRelations chat
}

struct SnsFriend {
  1: string snsUserId
  2: string snsUserName
  3: enumsC.SnsIdType snsIdType
}

