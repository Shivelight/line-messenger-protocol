include "enums.thrift"
include "../Common/enumsC.thrift"
include "../Common/structsC.thrift"

namespace py LineThrift.talk.structs
namespace go LineThrift.talk.structs

struct ReissueChatTicketRequest {
  1: i32 reqSeq
  2: string groupMid
}
struct ReissueChatTicketResponse {
  1: string ticketId
}

struct AcceptChatInvitationByTicketRequest {
  1: i32 reqSeq
  2: string chatMid
  3: string ticketId
}
struct AcceptChatInvitationByTicketResponse {
}

struct RejectChatInvitationRequest {
  1: i32 reqSeq
  2: string chatMid
}
struct RejectChatInvitationResponse{
}

struct GetChatsRequest {
  1: list<string> chatMids
  2: bool withMembers
  3: bool withInvitees
}
struct GetChatsResponse {
  1: list<structsC.Chat> chats
}

struct GetAllChatMidsRequest {
  1: bool withMemberChats
  2: bool withInvitedChats
}
struct GetAllChatMidsResponse {
  1: set<string> memberChatMids
  2: set<string> invitedChatMids
}

struct AcceptChatInvitationRequest {
  1: i32 reqSeq
  2: string chatMid
}
struct AcceptChatInvitationResponse {
}

struct CreateChatRequest {
  1: i32 reqSeq
  2: enumsC.ChatType type
  3: string name
  4: set<string> targetUserMids
  5: string picturePath
}
struct CreateChatResponse {
  1: structsC.Chat chat
}

struct DeleteOtherFromChatRequest {
  1: i32 reqSeq
  2: string chatMid
  3: set<string> targetUserMids
}
struct DeleteOtherFromChatResponse {
}

struct InviteIntoChatRequest {
  1: i32 reqSeq
  2: string chatMid
  3: set<string> targetUserMids
}
struct InviteIntoChatResponse {}

struct DeleteSelfFromChatRequest {
  1: i32 reqSeq
  2: string chatMid
  3: i64 lastSeenMessageDeliveredTime
  4: string lastSeenMessageId
  5: i64 lastMessageDeliveredTime
  6: string lastMessageId
}
struct DeleteSelfFromChatResponse {
}

struct FindChatByTicketRequest {
  1: string ticketId
}
struct FindChatByTicketResponse {
  1: structsC.Chat chat
}

struct CancelChatInvitationRequest {
  1: i32 reqSeq
  2: string chatMid
  3: set<string> targetUserMids
}
struct CancelChatInvitationResponse {}

struct MessageBoxListRequest {
  1: string minChatId
  2: string maxChatId
  3: bool activeOnly
  4: i32 messageBoxCountLimit
  5: bool withUnreadCount
  6: i32 lastMessagesPerMessageBoxCount
  7: bool unreadOnly
}
struct ExtendedMessageBox {
  1: string id
  2: enumsC.MIDType midType
  4: MessageBoxV2MessageId lastDeliveredMessageId
  5: i64 lastSeenMessageId
  6: i64 unreadCount
  7: list<structsC.Message> lastMessages
  8: i64 lastRemovedMessageId
  9: i64 lastRemovedTime
}
struct MessageBoxList {
  1: list<ExtendedMessageBox> messageBoxes
  2: bool hasNext
}

struct UpdateChatRequest {
  1: i32 reqSeq
  2: structsC.Chat chat
  3: enumsC.ChatAttribute updateAttribute
}
struct UpdateChatResponse {
}

struct CallRoute {
  1: string fromToken
  2: enums.CallFlowType CallFlowType
  3: string voipAddress
  4: i32 voipUdpPort
  5: i32 voupTcpPort
  6: string fromZone
  7: string toZone
  8: bool fakeCall
  9: string ringbackTone
  10: string toMid
  11: string tunneling
  12: string commParam
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

struct Announcement {
  1: i32 index
  10: bool forceUpdate
  11: string title
  12: string text
  13: i64 createdTime
  14: string pictureUrl
  15: string thumbnailUrl
}

struct AnalyticsInfo {
  1: double gaSamplingRate
  2: string tmid
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
  9: enumsC.MIDType midType
  10: list<structsC.Message> lastMessages
}

struct TMessageBoxWrapUp {
  1: TMessageBox messageBox
  2: string name
  3: list<structsC.Contact> contacts
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

struct ProximityMatchCandidateEntry {
  1: structsC.Contact contact
  11: structsC.BuddyDetail buddyDetail
}

struct ProximityMatchCandidateResult {
  1: list<ProximityMatchCandidateEntry> users
  2: list<ProximityMatchCandidateEntry> buddies
  91: bool endOfResult
}

struct LoginSession {
  1: string tokenKey
  3: i64 expirationTime
  11: enumsC.ApplicationType applicationType
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
  40: enumsC.IdentityProvider provider
  41: string identityIdentifier
  42: map<enumsC.SnsIdType, string> snsAccounts
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
  78: enumsC.PrivacySharePersonalInfoToFriend privacySharePersonalInfoToFriends
  79: i64 agreementThingsWirelessCommunication
  80: i64 agreementGdpr
  81: enumsC.PrivacyStatusMessageHistory privacyStatusMessageHistory
  82: i64 agreementProvideLocation
  83: i64 agreementBeacon

  85: enumsC.PrivacyAllowProfileHistory privacyAllowProfileHistory
  86: i64 agreementContentsSuggest
  87: i64 agreementContentsSuggestDataCollection
  88: enumsC.PrivacyAgeResult privacyAgeResult
  89: bool privacyAgeResultReceived
  90: i64 agreementOcrImageCollection
  91: bool privacyAllowFollow
  92: bool privacyShowFollowList
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

struct E2EENegotiationResult {
  1: set<enumsC.ContentType> allowedTypes
  2: structsC.E2EEPublicKey publicKey
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
  3: structsC.Contact contact
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
  1: structsC.Message message
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
  1: structsC.Contact contact
  2: enumsC.SnsIdType snsIdType
  3: string snsUserId
}

struct SnsFriendModification {
  1: enums.ModificationType type
  2: structsC.SnsFriend snsFriend
}

struct ContactRegistration {
  1: structsC.Contact contact
  10: string luid
  11: enumsC.ContactType contactType
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

struct UserAuthStatus {
  1: bool phoneNumberRegistered
  2: list<enumsC.SnsIdType> registeredSnsIdTypes
  3: enumsC.AccountMigrationCheckType accountMigrationCheckType
}

struct PhoneVerificationResult {
  1: enums.VerificationResult verificationResult
  2: enumsC.AccountMigrationCheckType accountMigrationCheckType
  3: bool recommendAddFriends
}

