include "enums.thrift"

namespace py LineThrift.square.structs
namespace go LineThrift.square.structs

struct SquarePreference {
  1: i64 favoriteTimestamp
  2: bool notiForNewJoinRequest
}

struct SquareMember {
  1: string squareMemberMid
  2: string squareMid
  3: string displayName
  4: string profileImageObsHash
  5: bool ableToReceiveMessage
  7: enums.SquareMembershipState membershipState
  8: enums.SquareMemberRole role
  9: i64 revision
  10: SquarePreference preference
  11: string joinMessage
}

struct SquareStatus {
  1: i32 memberCount
  2: i32 joinRequestCount
  3: i64 lastJoinRequestAt
  4: i32 openChatCount
}

struct ApproveSquareMembersResponse {
  1: list<SquareMember> approvedMembers
  2: SquareStatus status
}

struct ApproveSquareMembersRequest {
  2: string squareMid
  3: list<string> requestedMemberMids
}

struct ErrorExtraInfo {
  1: enums.PreconditionFailedExtraInfo preconditionFailedExtraInfo
}

struct Square {
  1: string mid
  2: string name
  3: string welcomeMessage
  4: string profileImageObsHash
  5: string desc
  6: bool searchable
  7: enums.SquareType type
  8: i32 categoryID
  9: string invitationURL
  10: i64 revision
  11: bool ableToUseInvitationTicket
  12: enums.SquareState state
}

struct SquareAuthority {
  1: string squareMid
  2: enums.SquareMemberRole updateSquareProfile
  3: enums.SquareMemberRole inviteNewMember
  4: enums.SquareMemberRole approveJoinRequest
  5: enums.SquareMemberRole createPost
  6: enums.SquareMemberRole createOpenSquareChat
  7: enums.SquareMemberRole deleteSquareChatOrPost
  8: enums.SquareMemberRole removeSquareMember
  9: enums.SquareMemberRole grantRole
  10: enums.SquareMemberRole enableInvitationTicket
  11: i64 revision
}

struct CreateSquareResponse {
  1: Square square
  2: SquareMember creator
  3: SquareAuthority authority
  4: SquareStatus status
}

struct CreateSquareRequest {
  1: i32 reqSeq
  2: Square square
  3: SquareMember creator
}

struct SquareChat {
  1: string squareChatMid
  2: string squareMid
  3: enums.SquareChatType type
  4: string name
  5: string chatImageObsHash
  6: i64 squareChatRevision
  7: i32 maxMemberCount
  8: enums.SquareChatState state
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

struct SquareMessage {
  1: Message message
  3: enums.MIDType fromType
  4: i64 squareMessageRevision
}

struct SquareChatStatusWithoutMessage {
  1: i32 memberCount
  2: i32 unreadMessageCount
}

struct SquareChatStatus {
  3: SquareMessage lastMessage
  4: string senderDisplayName
  5: SquareChatStatusWithoutMessage otherStatus
}

struct SquareChatMember {
  1: string squareMemberMid
  2: string squareChatMid
  3: i64 revision
  4: enums.SquareChatMembershipState membershipState
  5: bool notificationForMessage
}

struct CreateSquareChatResponse {
  1: SquareChat squareChat
  2: SquareChatStatus squareChatStatus
  3: SquareChatMember squareChatMember
}

struct CreateSquareChatRequest {
  1: i32 reqSeq
  2: SquareChat squareChat
  3: list<string> squareMemberMids
}

struct TextMessageAnnouncementContents {
  1: string messageId
  2: string text
  3: string senderSquareMemberMid
  4: i64 createdAt
}

struct SquareChatAnnouncementContents {
  1: TextMessageAnnouncementContents textMessageAnnouncementContents
}

struct SquareChatAnnouncement {
  1: i64 announcementSeq
  2: enums.SquareChatAnnouncementType type
  3: SquareChatAnnouncementContents contents
}

struct CreateSquareChatAnnouncementResponse {
  1: SquareChatAnnouncement announcement
}

struct CreateSquareChatAnnouncementRequest {
  1: i32 reqSeq
  2: string squareChatMid
  3: SquareChatAnnouncement squareChatAnnouncement
}

struct DeleteSquareResponse {
  
}

struct DeleteSquareRequest {
  2: string mid
  3: i64 revision
}

struct DeleteSquareChatResponse {
  
}

struct DeleteSquareChatRequest {
  2: string squareChatMid
  3: i64 revision
}

struct DeleteSquareChatAnnouncementResponse {
  
}

struct DeleteSquareChatAnnouncementRequest {
  2: string squareChatMid
  3: i64 announcementSeq
}

struct DestroyMessageResponse {
  
}

struct DestroyMessageRequest {
  2: string squareChatMid
  4: string messageId
}

struct DestroyMessagesResponse {
  
}

struct DestroyMessagesRequest {
  2: string squareChatMid
  4: set<string> messageIds
}

struct SubscriptionState {
  1: i64 subscriptionId
  2: i64 ttlMillis
}

struct SquareEventReceiveMessage {
  1: string squareChatMid
  2: SquareMessage squareMessage
}

struct SquareEventSendMessage {
  1: string squareChatMid
  2: SquareMessage squareMessage
  3: i32 reqSeq
}

struct SquareEventNotifiedJoinSquareChat {
  1: string squareChatMid
  2: SquareMember joinedMember
}

struct SquareMemberRelation {
  1: enums.SquareMemberRelationState state
  2: i64 revision
}

struct SquareEventNotifiedInviteIntoSquareChat {
  1: string squareChatMid
  2: list<SquareMember> invitees
  3: SquareMember invitor
  4: SquareMemberRelation invitorRelation
}

struct SquareEventNotifiedLeaveSquareChat {
  1: string squareChatMid
  2: string squareMemberMid
  3: bool sayGoodbye
  4: SquareMember squareMember
}

struct SquareEventNotifiedDestroyMessage {
  1: string squareChatMid
  3: string messageId
}

struct SquareEventNotifiedMarkAsRead {
  1: string squareChatMid
  2: string sMemberMid
  4: string messageId
}

struct SquareEventNotifiedUpdateSquareMemberProfile {
  1: string squareChatMid
  2: SquareMember squareMember
}

struct SquareEventNotifiedKickoutFromSquare {
  1: string squareChatMid
  2: list<SquareMember> kickees
}

struct SquareEventNotifiedShutdownSquare {
  1: string squareChatMid
  2: Square square
}

struct SquareEventNotifiedDeleteSquareChat {
  1: SquareChat squareChat
}

struct SquareEventNotifiedUpdateSquareChatProfileName {
  1: string squareChatMid
  2: SquareMember editor
  3: string updatedChatName
}

struct SquareEventNotifiedUpdateSquareChatProfileImage {
  1: string squareChatMid
  2: SquareMember editor
}

struct SquareEventNotifiedUpdateSquareStatus {
  1: string squareMid
  2: SquareStatus squareStatus
}

struct SquareEventNotifiedUpdateSquareChatStatus {
  1: string squareChatMid
  2: SquareChatStatusWithoutMessage statusWithoutMessage
}

struct SquareFeature {
  1: enums.SquareFeatureControlState controlState
  2: enums.BooleanState booleanValue
}

struct SquareFeatureSet {
  1: string squareMid
  2: i64 revision
  11: SquareFeature creatingSecretSquareChat
  12: SquareFeature invitingIntoOpenSquareChat
}

struct SquareEventNotifiedCreateSquareMember {
  1: Square square
  2: SquareAuthority squareAuthority
  3: SquareStatus squareStatus
  4: SquareMember squareMember
  5: SquareFeatureSet squareFeatureSet
}

struct SquareEventNotifiedCreateSquareChatMember {
  1: string squareChatMid
  2: string squareMemberMid
  3: SquareChatMember squareChatMember
}

struct SquareEventNotifiedUpdateSquareMemberRelation {
  1: string squareMid
  2: string myMemberMid
  3: string targetSquareMemberMid
  4: SquareMemberRelation squareMemberRelation
}

struct SquareEventNotifiedUpdateSquare {
  1: string squareMid
  2: Square square
}

struct SquareEventNotifiedUpdateSquareMember {
  1: string squareMid
  2: string squareMemberMid
  3: SquareMember squareMember
}

struct SquareEventNotifiedUpdateSquareChat {
  1: string squareMid
  2: string squareChatMid
  3: SquareChat squareChat
}

struct SquareEventNotificationJoinRequest {
  1: string squareMid
  2: string squareName
  3: string requestMemberName
  4: string profileImageObsHash
}

struct SquareEventNotificationMemberUpdate {
  1: string squareMid
  2: string squareName
  3: string profileImageObsHash
}

struct SquareEventNotificationSquareDelete {
  1: string squareMid
  2: string squareName
  3: string profileImageObsHash
}

struct SquareEventNotificationSquareChatDelete {
  1: string squareChatMid
  2: string squareChatName
  3: string profileImageObsHash
}

struct SquareEventNotificationMessage {
  1: string squareChatMid
  2: SquareMessage squareMessage
  3: string senderDisplayName
  4: i32 unreadCount
  5: bool requiredToFetchChatEvents
}

struct SquareEventNotifiedUpdateSquareChatMember {
  1: string squareChatMid
  2: string squareMemberMid
  3: SquareChatMember squareChatMember
}

struct SquareEventNotifiedUpdateSquareAuthority {
  1: string squareMid
  2: SquareAuthority squareAuthority
}

struct SquareEventNotifiedUpdateSquareFeatureSet {
  1: SquareFeatureSet squareFeatureSet
}

struct SquareEventPayload {
  1: SquareEventReceiveMessage receiveMessage
  2: SquareEventSendMessage sendMessage
  3: SquareEventNotifiedJoinSquareChat notifiedJoinSquareChat
  4: SquareEventNotifiedInviteIntoSquareChat notifiedInviteIntoSquareChat
  5: SquareEventNotifiedLeaveSquareChat notifiedLeaveSquareChat
  6: SquareEventNotifiedDestroyMessage notifiedDestroyMessage
  7: SquareEventNotifiedMarkAsRead notifiedMarkAsRead
  8: SquareEventNotifiedUpdateSquareMemberProfile notifiedUpdateSquareMemberProfile
  20: SquareEventNotifiedKickoutFromSquare notifiedKickoutFromSquare
  19: SquareEventNotifiedShutdownSquare notifiedShutdownSquare
  21: SquareEventNotifiedDeleteSquareChat notifiedDeleteSquareChat
  31: SquareEventNotifiedUpdateSquareChatProfileName notifiedUpdateSquareChatProfileName
  32: SquareEventNotifiedUpdateSquareChatProfileImage notifiedUpdateSquareChatProfileImage
  14: SquareEventNotifiedUpdateSquareStatus notifiedUpdateSquareStatus
  15: SquareEventNotifiedUpdateSquareChatStatus notifiedUpdateSquareChatStatus
  16: SquareEventNotifiedCreateSquareMember notifiedCreateSquareMember
  17: SquareEventNotifiedCreateSquareChatMember notifiedCreateSquareChatMember
  18: SquareEventNotifiedUpdateSquareMemberRelation notifiedUpdateSquareMemberRelation
  9: SquareEventNotifiedUpdateSquare notifiedUpdateSquare
  10: SquareEventNotifiedUpdateSquareMember notifiedUpdateSquareMember
  11: SquareEventNotifiedUpdateSquareChat notifiedUpdateSquareChat
  22: SquareEventNotificationJoinRequest notificationJoinRequest
  23: SquareEventNotificationMemberUpdate notificationJoined
  24: SquareEventNotificationMemberUpdate notificationPromoteCoadmin
  25: SquareEventNotificationMemberUpdate notificationPromoteAdmin
  26: SquareEventNotificationMemberUpdate notificationDemoteMember
  27: SquareEventNotificationMemberUpdate notificationKickedOut
  28: SquareEventNotificationSquareDelete notificationSquareDelete
  29: SquareEventNotificationSquareChatDelete notificationSquareChatDelete
  30: SquareEventNotificationMessage notificationMessage
  12: SquareEventNotifiedUpdateSquareChatMember notifiedUpdateSquareChatMember
  13: SquareEventNotifiedUpdateSquareAuthority notifiedUpdateSquareAuthority
  33: SquareEventNotifiedUpdateSquareFeatureSet notifiedUpdateSquareFeatureSet
}

struct SquareEvent {
  2: i64 createdTime
  3: enums.SquareEventType type
  4: SquareEventPayload payload
  5: string syncToken
  6: enums.SquareEventStatus eventStatus
}

struct FetchMyEventsResponse {
  1: SubscriptionState subscription
  2: list<SquareEvent> events
  3: string syncToken
  4: string continuationToken
}

struct FetchMyEventsRequest {
  1: i64 subscriptionId
  2: string syncToken
  3: i32 limit
  4: string continuationToken
}

struct FetchSquareChatEventsResponse {
  1: SubscriptionState subscription
  2: list<SquareEvent> events
  3: string syncToken
  4: string continuationToken
}

struct FetchSquareChatEventsRequest {
  1: i64 subscriptionId
  2: string squareChatMid
  3: string syncToken
  4: i32 limit
  5: enums.FetchDirection direction
}

struct FindSquareByInvitationTicketResponse {
  1: Square square
  2: SquareMember myMembership
  3: SquareAuthority squareAuthority
  4: SquareStatus squareStatus
}

struct FindSquareByInvitationTicketRequest {
  2: string invitationTicket
}

struct Category {
  1: i32 id
  2: string name
}

struct GetSquareCategoriesResponse {
  1: list<Category> categoryList
}

struct GetSquareCategoriesRequest {
  
}

struct GetInvitationTicketUrlResponse {
  1: string invitationURL
}

struct GetInvitationTicketUrlRequest {
  2: string mid
}

struct GetJoinableSquareChatsResponse {
  1: list<SquareChat> squareChats
  2: string continuationToken
  3: i32 totalSquareChatCount
  4: map<string, SquareChatStatus> squareChatStatuses
}

struct GetJoinableSquareChatsRequest {
  1: string squareMid
  10: string continuationToken
  11: i32 limit
}

struct GetJoinedSquareChatsResponse {
  1: list<SquareChat> chats
  2: map<string, SquareChatMember> chatMembers
  3: map<string, SquareChatStatus> statuses
  4: string continuationToken
}

struct GetJoinedSquareChatsRequest {
  2: string continuationToken
  3: i32 limit
}

struct NoteStatus {
  1: i32 noteCount
  2: i64 latestCreatedAt
}

struct GetJoinedSquaresResponse {
  1: list<Square> squares
  2: map<string, SquareMember> members
  3: map<string, SquareAuthority> authorities
  4: map<string, SquareStatus> statuses
  5: string continuationToken
  6: map<string, NoteStatus> noteStatuses
}

struct GetJoinedSquaresRequest {
  2: string continuationToken
  3: i32 limit
}

struct GetNoteStatusResponse {
  1: string squareMid
  2: NoteStatus status
}

struct GetNoteStatusRequest {
  2: string squareMid
}

struct GetSquareResponse {
  1: Square square
  2: SquareMember myMembership
  3: SquareAuthority squareAuthority
  4: SquareStatus squareStatus
  5: SquareFeatureSet squareFeatureSet
  6: NoteStatus noteStatus
}

struct GetSquareRequest {
  2: string mid
}

struct GetSquareAuthorityResponse {
  1: SquareAuthority authority
}

struct GetSquareAuthorityRequest {
  1: string squareMid
}

struct GetSquareChatResponse {
  1: SquareChat squareChat
  2: SquareChatMember squareChatMember
  3: SquareChatStatus squareChatStatus
}

struct GetSquareChatRequest {
  1: string squareChatMid
}

struct GetSquareChatAnnouncementsResponse {
  1: list<SquareChatAnnouncement> announcements
}

struct GetSquareChatAnnouncementsRequest {
  2: string squareChatMid
}

struct GetSquareChatMembersResponse {
  1: SquareMember squareChatMembers
  2: string continuationToken
}

struct GetSquareChatMembersRequest {
  1: string squareChatMid
  2: string continuationToken
  3: i32 limit
}

struct GetSquareChatStatusResponse {
  1: SquareChatStatus chatStatus
}

struct GetSquareChatStatusRequest {
  2: string squareChatMid
}

struct GetSquareFeatureSetResponse {
  1: SquareFeatureSet squareFeatureSet
}

struct GetSquareFeatureSetRequest {
  2: string squareMid
}

struct GetSquareMemberResponse {
  1: SquareMember squareMember
  2: SquareMemberRelation relation
  3: string oneOnOneChatMid
}

struct GetSquareMemberRequest {
  1: string squareMemberMid
}

struct GetSquareMembersResponse {
  1: SquareMember members
}

struct GetSquareMembersRequest {
  2: set<string> mids
}

struct GetSquareMemberRelationResponse {
  1: string squareMid
  2: string targetSquareMemberMid
  3: SquareMemberRelation relation
}

struct GetSquareMemberRelationRequest {
  2: string squareMid
  3: string targetSquareMemberMid
}

struct GetSquareMemberRelationsResponse {
  1: list<SquareMember> squareMembers
  2: map<string, SquareMemberRelation> relations
  3: string continuationToken
}

struct GetSquareMemberRelationsRequest {
  2: enums.SquareMemberRelationState state
  3: string continuationToken
  4: i32 limit
}

struct GetSquareStatusResponse {
  1: SquareStatus squareStatus
}

struct GetSquareStatusRequest {
  2: string squareMid
}

struct InviteToSquareResponse {
  
}

struct InviteToSquareRequest {
  2: string squareMid
  3: list<string> invitees
  4: string squareChatMid
}

struct InviteToSquareChatResponse {
  1: list<string> inviteeMids
}

struct InviteToSquareChatRequest {
  1: list<string> inviteeMids
  2: string squareChatMid
}

struct JoinSquareResponse {
  1: Square square
  2: SquareAuthority squareAuthority
  3: SquareStatus squareStatus
  4: SquareMember squareMember
  5: SquareFeatureSet squareFeatureSet
  6: NoteStatus noteStatus
}

struct JoinSquareRequest {
  2: string squareMid
  3: SquareMember member
}

struct JoinSquareChatResponse {
  1: SquareChat squareChat
  2: SquareChatStatus squareChatStatus
  3: SquareChatMember squareChatMember
}

struct JoinSquareChatRequest {
  1: string squareChatMid
}

struct LeaveSquareResponse {
  
}

struct LeaveSquareRequest {
  2: string squareMid
}

struct LeaveSquareChatResponse {
  
}

struct LeaveSquareChatRequest {
  2: string squareChatMid
  3: bool sayGoodbye
  4: i64 squareChatMemberRevision
}

struct MarkAsReadResponse {
  
}

struct MarkAsReadRequest {
  2: string squareChatMid
  4: string messageId
}

struct RefreshSubscriptionsResponse {
  1: i64 ttlMillis
  2: map<i64, SubscriptionState> subscriptionStates
}

struct RefreshSubscriptionsRequest {
  2: list<i64> subscriptions
}

struct RejectSquareMembersResponse {
  1: list<SquareMember> rejectedMembers
  2: SquareStatus status
}

struct RejectSquareMembersRequest {
  2: string squareMid
  3: list<string> requestedMemberMids
}

struct RemoveSubscriptionsResponse {
  
}

struct RemoveSubscriptionsRequest {
  2: list<i64> unsubscriptions
}

struct ReportSquareResponse {
  
}

struct ReportSquareRequest {
  2: string squareMid
  3: enums.ReportType reportType
  4: string otherReason
}

struct ReportSquareChatResponse {
  
}

struct ReportSquareChatRequest {
  2: string squareMid
  3: string squareChatMid
  5: enums.ReportType reportType
  6: string otherReason
}

struct ReportSquareMemberResponse {
  
}

struct ReportSquareMemberRequest {
  2: string squareMemberMid
  3: enums.ReportType reportType
  4: string otherReason
  5: string squareChatMid
}

struct ReportSquareMessageResponse {
  
}

struct ReportSquareMessageRequest {
  2: string squareMid
  3: string squareChatMid
  4: string squareMessageId
  5: enums.ReportType reportType
  6: string otherReason
}

struct SearchSquareMembersResponse {
  1: list<SquareMember> members
  2: i64 revision
  3: string continuationToken
  4: i32 totalCount
}

struct SquareMemberSearchOption {
  1: enums.SquareMembershipState membershipState
  2: set<enums.SquareMemberRole> memberRoles
  3: string displayName
  4: enums.BooleanState ableToReceiveMessage
  5: enums.BooleanState ableToReceiveFriendRequest
  6: string chatMidToExcludeMembers
  7: bool includingMe
}

struct SearchSquareMembersRequest {
  2: string squareMid
  3: SquareMemberSearchOption searchOption
  4: string continuationToken
  5: i32 limit
}

struct SearchSquaresResponse {
  1: list<Square> squares
  2: map<string, SquareStatus> squareStatuses
  3: map<string, SquareMember> myMemberships
  4: string continuationToken
  5: map<string, NoteStatus> noteStatuses
}

struct SearchSquaresRequest {
  2: string query
  3: string continuationToken
  4: i32 limit
}

struct SendMessageResponse {
  1: SquareMessage createdSquareMessage
}

struct SendMessageRequest {
  1: i32 reqSeq
  2: string squareChatMid
  3: SquareMessage squareMessage
}

struct UpdateSquareResponse {
  1: set<enums.SquareAttribute> updatedAttrs
  2: Square square
}

struct UpdateSquareRequest {
  2: set<enums.SquareAttribute> updatedAttrs
  3: Square square
}

struct UpdateSquareAuthorityResponse {
  1: set<enums.SquareAuthorityAttribute> updatdAttributes
  2: SquareAuthority authority
}

struct UpdateSquareAuthorityRequest {
  2: set<enums.SquareAuthorityAttribute> updateAttributes
  3: SquareAuthority authority
}

struct UpdateSquareChatResponse {
  1: set<enums.SquareChatAttribute> updatedAttrs
  2: SquareChat squareChat
}

struct UpdateSquareChatRequest {
  2: set<enums.SquareChatAttribute> updatedAttrs
  3: SquareChat squareChat
}

struct UpdateSquareChatMemberResponse {
  1: SquareChatMember updatedChatMember
}

struct UpdateSquareChatMemberRequest {
  2: set<enums.SquareChatMemberAttribute> updatedAttrs
  3: SquareChatMember chatMember
}

struct UpdateSquareFeatureSetResponse {
  1: set<enums.SquareFeatureSetAttribute> updateAttributes
  2: SquareFeatureSet squareFeatureSet
}

struct UpdateSquareFeatureSetRequest {
  2: set<enums.SquareFeatureSetAttribute> updateAttributes
  3: SquareFeatureSet squareFeatureSet
}

struct UpdateSquareMemberResponse {
  1: set<enums.SquareMemberAttribute> updatedAttrs
  2: SquareMember squareMember
  3: set<enums.SquarePreferenceAttribute> updatedPreferenceAttrs
}

struct UpdateSquareMemberRequest {
  2: set<enums.SquareMemberAttribute> updatedAttrs
  3: set<enums.SquarePreferenceAttribute> updatedPreferenceAttrs
  4: SquareMember squareMember
}

struct UpdateSquareMemberRelationResponse {
  1: string squareMid
  2: string targetSquareMemberMid
  3: set<enums.SquareMemberRelationAttribute> updatedAttrs
  4: SquareMemberRelation relation
}

struct UpdateSquareMemberRelationRequest {
  2: string squareMid
  3: string targetSquareMemberMid
  4: set<enums.SquareMemberRelationAttribute> updatedAttrs
  5: SquareMemberRelation relation
}

struct UpdateSquareMembersResponse {
  1: set<enums.SquareMemberAttribute> updatedAttrs
  2: SquareMember editor
  3: map<string, SquareMember> members
}

struct UpdateSquareMembersRequest {
  2: set<enums.SquareMemberAttribute> updatedAttrs
  3: list<SquareMember> members
}

