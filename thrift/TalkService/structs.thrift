include "enums.thrift"

namespace py LineThrift.talk.structs
namespace go LineThrift.talk.structs

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

struct ChatRoomAnnouncementContents {
  1: i32 displayFields
  2: string text
  3: string link
  4: string thumbnail
}

struct ChatRoomAnnouncement {
  1: i64 announcementSeq
  2: enums.ChatRoomAnnouncementType type
  3: ChatRoomAnnouncementContents contents
  4: string creatorMid
  5: i64 createdTime
}

struct GroupPreference {
  1: string invitationTicket
  2: i64 favoriteTimestamp
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

struct Room {
  1: string mid
  2: i64 createdTime
  10: list<Contact> contacts
  31: bool notificationDisabled
  40: list<string> memberMids
}

struct Announcement {
  1: i32 index
  10: bool forceUpdate
  11: string title
  12: string text
  13: i64 createdTime
  14: string pictureUrl
  15: string thumbnailUrl
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

struct Operation {
  1: i64 revision
  2: i64 createdTime
  3: enums.OpType type
  4: i32 reqSeq
  5: string checksum
  7: enums.OpStatus status
  10: string param1
  11: string param2
  12: string param3
  20: Message message
}

struct SyncParamMid {
  1: string mid
  2: enums.Diff diff
  3: i64 revision
}

struct SyncParamContact {
  1: SyncParamMid syncParamMid
  2: enums.ContactStatus contactStatus
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

struct Ticket {
  1: string id
  10: i64 expirationTime
  21: i32 maxUseCount
}

struct AnalyticsInfo {
  1: double gaSamplingRate
  2: string tmid
}

struct AuthQrcode {
  1: string qrcode
  2: string verifier
  3: string callbackUrl
}

struct Geolocation {
  1: double longitude
  2: double latitude
}

struct CompactContact {
  1: string mid
  2: i64 createdTime
  3: i64 modifiedTime
  4: enums.ContactStatus status
  5: i64 settings
  6: string displayNameOverridden
}

struct E2EEPublicKey {
  1: i32 version
  2: i32 keyId
  4: binary keyData
  5: i64 createdTime
}

struct FriendRequest {
  1: string eMid
  2: string mid
  3: enums.FriendRequestDirection direction
  4: enums.FriendRequestMethod method
  5: string param
  6: i64 timestamp
  7: i64 seqId
  10: string displayName
  11: string picturePath
  12: string pictureStatus
}

struct TMessageBox {
  1: string id
  2: string channelId
  5: i64 lastSeq
  6: i64 unreadCount
  7: i64 lastModifiedTime
  8: i32 status
  9: enums.MIDType midType
  10: list<Message> lastMessages
}

struct TMessageBoxWrapUp {
  1: TMessageBox messageBox
  2: string name
  3: list<Contact> contacts
  4: string pictureRevision
}

struct TMessageBoxWrapUpResponse {
  1: list<TMessageBoxWrapUp> messageBoxWrapUpList
  2: i32 totalSize
}

struct TMessageReadRangeEntry {
  1: i64 startMessageId
  2: i64 endMessageId
  3: i64 startTime
  4: i64 endTime
}

struct TMessageReadRange {
  1: string chatId
  2: map<string, list<TMessageReadRangeEntry>> ranges
}

struct MessageBoxV2MessageId {
  1: i64 deliveredTime
  2: i64 messageId
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

struct BuddyDetail {
  1: string mid
  2: i64 memberCount
  3: bool onAir
  4: bool businessAccount
  5: bool addable
  6: set<enums.ContentType> acceptableContentTypes
  7: bool capableMyhome
  8: bool freePhoneCallable
  9: string phoneNumberToDial
  10: bool needPermissionApproval
  11: i32 channelId
  12: string channelProviderName
  13: i32 iconType
  14: enums.BotType botType
  15: bool showRichMenu
  16: i64 richMenuRevision
  17: enums.BuddyOnAirLabel onAirLabel
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

struct ProximityMatchCandidateEntry {
  1: Contact contact
  11: BuddyDetail buddyDetail
}

struct ProximityMatchCandidateResult {
  1: list<ProximityMatchCandidateEntry> users
  2: list<ProximityMatchCandidateEntry> buddies
  91: bool endOfResult
}

struct RSAKey {
  1: string keynm
  2: string nvalue
  3: string evalue
  4: string sessionKey
}

struct LoginSession {
  1: string tokenKey
  3: i64 expirationTime
  11: enums.ApplicationType applicationType
  12: string systemName
  22: string accessLocation
}

struct Settings {
  10: bool notificationEnable
  11: i64 notificationMuteExpiration
  12: bool notificationNewMessage
  13: bool notificationGroupInvitation
  14: bool notificationShowMessage
  15: bool notificationIncomingCall
  16: string notificationSoundMessage
  17: string notificationSoundGroup
  18: bool notificationDisabledWithSub
  19: bool notificationPayment
  20: bool privacySyncContacts
  21: bool privacySearchByPhoneNumber
  22: bool privacySearchByUserid
  23: bool privacySearchByEmail
  24: bool privacyAllowSecondaryDeviceLogin
  25: bool privacyProfileImagePostToMyhome
  26: bool privacyReceiveMessagesFromNotFriend
  27: bool privacyAgreeUseLineCoinToPaidCall
  28: bool privacyAgreeUsePaidCall
  29: bool privacyAllowFriendRequest
  30: string contactMyTicket
  40: enums.IdentityProvider identityProvider
  41: string identityIdentifier
  42: map<enums.SnsIdType, string> snsAccounts
  43: bool phoneRegistration
  44: enums.EmailConfirmationStatus emailConfirmationStatus
  45: enums.AccountMigrationPincodeType accountMigrationPincodeType
  46: bool enforcedInputAccountMigrationPincode
  47: enums.SecurityCenterSettingsType securityCenterSettingsType
  48: bool allowUnregistrationSecondaryDevice
  50: string preferenceLocale
  60: map<enums.CustomMode, string> customModes
  61: bool e2eeEnable
  62: bool hitokotoBackupRequested
  63: bool privacyProfileMusicPostToMyhome
  65: bool privacyAllowNearby
  66: i64 agreementNearbyTime
  67: i64 agreementSquareTime
  68: bool notificationMention
  69: i64 botUseAgreementAcceptedAt
  70: i64 agreementShakeFunction
  71: i64 agreementMobileContactName
  72: bool notificationThumbnail
  73: i64 agreementSoundToText
  74: string privacyPolicyVersion
  75: i64 agreementAdByWebAccess
  76: i64 agreementPhoneNumberMatching
  77: i64 agreementCommunicationInfo
}

struct SuggestItemDictionaryRevision {
  1: i64 revision
  2: string scheme
}

struct SuggestTagDictionaryRevision {
  1: string language
  2: i64 revision
  3: string scheme
}

struct SuggestDictionaryRevisions {
  1: SuggestItemDictionaryRevision itemRevision
  2: list<SuggestTagDictionaryRevision> tagRevisions
}

struct SystemConfiguration {
  1: string endpoint
  2: string endpointSsl
  3: string updateUrl
  11: string c2dmAccount
  12: string nniServer
}

struct WapInvitation {
  1: enums.WapInvitationType type
  10: string inviteeEmail
  11: string inviterMid
  12: string roomMid
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

struct ContactTransition {
  1: string ownerMid
  2: string targetMid
  3: enums.ContactStatus previousStatus
  4: enums.ContactStatus resultStatus
}

struct E2EENegotiationResult {
  1: set<enums.ContentType> allowedTypes
  2: E2EEPublicKey publicKey
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

struct IdentityCredential {
  1: enums.IdentityProvider provider
  2: string identifier
  3: string password
}

struct RegisterWithPhoneNumberResult {
  1: string authToken
  2: bool recommendEmailRegistration
  3: string certificate
}

struct ContactReportResult {
  1: string mid
  2: bool exists
}

struct ContactReport {
  1: string mid
  2: bool exists
  3: Contact contact
}

struct EmailConfirmationSession {
  1: enums.EmailConfirmationType emailConfirmationType
  2: string verifier
  3: string targetEmail
}

struct EmailConfirmation {
  1: bool usePasswordSet
  2: string email
  3: string password
  4: bool ignoreDuplication
}

struct CommitMessageResult {
  1: Message message
  2: enums.CommitMessageResultCode code
  3: string reason
  4: i64 successCount
  5: i64 failCount
  6: i64 unregisterCount
  7: i64 blockCount
}

struct SIMInfo {
  1: string phoneNumber
  2: string countryCode
}

struct SnsFriendContactRegistration {
  1: Contact contact
  2: enums.SnsIdType snsIdType
  3: string snsUserId
}

struct SnsFriend {
  1: string snsUserId
  2: string snsUserName
  3: enums.SnsIdType snsIdType
}

struct SnsFriendModification {
  1: enums.ModificationType type
  2: SnsFriend snsFriend
}

struct ContactRegistration {
  1: Contact contact
  10: string luid
  11: enums.ContactType contactType
  12: string contactKey
}

struct ContactModification {
  1: enums.ModificationType type
  2: string luid
  11: list<string> phones
  12: list<string> emails
  13: list<string> userids
  14: string mobileContactName
  15: string phoneticName
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

struct UserAuthStatus {
  1: bool phoneNumberRegistered
  2: list<enums.SnsIdType> registeredSnsIdTypes
  3: enums.AccountMigrationCheckType accountMigrationCheckType
}

struct PhoneVerificationResult {
  1: enums.VerificationResult verificationResult
  2: enums.AccountMigrationCheckType accountMigrationCheckType
  3: bool recommendAddFriends
}

