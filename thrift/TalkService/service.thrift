include "enums.thrift"
include "structs.thrift"
include "../Common/enumsC.thrift"
include "../Common/structsC.thrift"
include "../Common/exceptionsC.thrift"

namespace py LineThrift.talk
namespace go LineThrift.talk

service TalkService {
  // update
  // - getGroups
  // - setNotificationsEnabled
  structs.ReissueChatTicketResponse reissueChatTicket(
    1: structs.ReissueChatTicketRequest request) throws (1: exceptionsC.TalkException e)

  structs.AcceptChatInvitationByTicketResponse acceptChatInvitationByTicket(
    1: structs.AcceptChatInvitationByTicketRequest request) throws (1: exceptionsC.TalkException e)

  structs.RejectChatInvitationResponse rejectChatInvitation(
    1: structs.RejectChatInvitationRequest request) throws (1: exceptionsC.TalkException e)

  structs.GetChatResponse getChats(
    1: structs.GetChatRequest request) throws (1: exceptionsC.TalkException e)

  structs.GetAllChatMidsResponse getAllChatMids(
    1: structs.GetAllChatMidsRequest request,
    2: enumsC.SyncReason syncReason) throws (1: exceptionsC.TalkException e)

  structs.AcceptChatInvitationResponse acceptChatInvitation(
    1: structs.AcceptChatInvitationRequest request) throws (1: exceptionsC.TalkException e)

  structs.CreateChatResponse createChat(
    1: structs.CreateChatRequest request) throws (1: exceptionsC.TalkException e)

  structs.DeleteOtherFromChatResponse deleteOtherFromChat(
    1: structs.DeleteOtherFromChatRequest request) throws (1: exceptionsC.TalkException e)

  structs.InviteIntoChatResponse inviteIntoChat(
    1: structs.InviteIntoChatRequest request) throws (1: exceptionsC.TalkException e)


  structs.DeleteSelfFromChatResponse deleteSelfFromChat(
    1: structs.DeleteSelfFromChatRequest request) throws (1: exceptionsC.TalkException e)


  structs.FindChatByTicketResponse findChatByTicket(
    1: structs.FindChatByTicketRequest request) throws (1: exceptionsC.TalkException e)

  structs.CancelChatInvitationResponse cancelChatInvitation(
    1: structs.CancelChatInvitationRequest request) throws (1: exceptionsC.TalkException e)


  structs.MessageBoxList getMessageBoxes(
    2: structs.MessageBoxListRequest messageBoxListRequest
    3: enumsC.SyncReason syncReason) throws (1: exceptionsC.TalkException e)


  structs.UpdateChatResponse updateChat(
    1: structs.UpdateChatRequest request) throws (1: exceptionsC.TalkException e)


  structsC.ExtendedProfile getExtendedProfile(
    1: enumsC.SyncReason syncReason) throws (1: exceptionsC.TalkException e)


  list<structsC.ChatEffectMeta> getChatEffectMetaList(
    1: set<enumsC.ChatEffectMetaCategory> categories) throws (1: exceptionsC.TalkException e)




  //
  void acceptGroupInvitation(
    1: i32 reqSeq,
    2: string groupId) throws (1: exceptionsC.TalkException e)

  void acceptGroupInvitationByTicket(
    1: i32 reqSeq,
    2: string GroupMid,
    3: string ticketId) throws (1: exceptionsC.TalkException e)

  void acceptProximityMatches(
    2: string sessionId,
    3: set<string> ids) throws (1: exceptionsC.TalkException e)

  structs.CallRoute /*before: list<string>*/ acquireCallRoute(
    1: string to,
    2: string callType,
    3: map<string,string> fromEnvInfo) throws (1: exceptionsC.TalkException e)

  string acquireCallTicket(
    2: string to) throws (1: exceptionsC.TalkException e)

  string acquireEncryptedAccessToken(
    2: enums.FeatureType featureType) throws (1: exceptionsC.TalkException e)

  string addSnsId(
    2: enumsC.SnsIdType snsIdType,
    3: string snsAccessToken) throws (1: exceptionsC.TalkException e)

  void blockContact(
    1: i32 reqSeq,
    2: string id) throws (1: exceptionsC.TalkException e)

  void blockRecommendation(
    1: i32 reqSeq,
    2: string id) throws (1: exceptionsC.TalkException e)

  void cancelGroupInvitation(
    1: i32 reqSeq,
    2: string groupId,
    3: list<string> contactIds) throws (1: exceptionsC.TalkException e)

  structsC.VerificationSessionData changeVerificationMethod(
    2: string sessionId,
    3: enumsC.VerificationMethod method) throws (1: exceptionsC.TalkException e)

  void clearIdentityCredential() throws (1: exceptionsC.TalkException e)

  void clearMessageBox(
    2: string channelId,
    3: string messageBoxId) throws (1: exceptionsC.TalkException e)

  void clearRingbackTone() throws (1: exceptionsC.TalkException e)

  void closeProximityMatch(
    2: string sessionId) throws (1: exceptionsC.TalkException e)

  map<string, string> commitSendMessage(
    1: i32 seq,
    2: string messageId,
    3: list<string> receiverMids) throws (1: exceptionsC.TalkException e)

  map<string, string> commitSendMessages(
    1: i32 seq,
    2: list<string> messageIds,
    3: list<string> receiverMids) throws (1: exceptionsC.TalkException e)

  map<string, string> commitUpdateProfile(
    1: i32 seq,
    2: list<enumsC.ProfileAttribute> attrs,
    3: list<string> receiverMids) throws (1: exceptionsC.TalkException e)

  void confirmEmail(
    2: string verifier,
    3: string pinCode) throws (1: exceptionsC.TalkException e)

  structs.ChatRoomAnnouncement createChatRoomAnnouncement(
    1: i32 reqSeq,
    2: string chatRoomMid,
    3: enums.ChatRoomAnnouncementType type,
    4: structs.ChatRoomAnnouncementContents contents) throws (1: exceptionsC.TalkException e)

  structsC.Group createGroup(
    1: i32 seq,
    2: string name,
    3: list<string> contactIds) throws (1: exceptionsC.TalkException e)

  string createQrcodeBase64Image(
    2: string url,
    3: string characterSet,
    4: i32 imageSize,
    5: i32 x,
    6: i32 y,
    7: i32 width,
    8: i32 height) throws (1: exceptionsC.TalkException e)

  structsC.Room createRoom(
    1: i32 reqSeq,
    2: list<string> contactIds) throws (1: exceptionsC.TalkException e)

  structsC.Room createRoomV2(
    1: i32 reqSeq,
    2: list<string> contactIds) throws (1: exceptionsC.TalkException e)

  string createSession() throws (1: exceptionsC.TalkException e)

  void destroyMessage(
    1: i32 seq,
    2: string chatId,
    3: string messageId,
    4: i8 sessionId) throws (1: exceptionsC.TalkException e)

  list<structs.Announcement> fetchAnnouncements(
    2: i32 lastFetchedIndex) throws (1: exceptionsC.TalkException e)

  list<structsC.Message> fetchMessages(
    2: i64 localTs,
    3: i32 count) throws (1: exceptionsC.TalkException e)

  list<structsC.Operation> fetchOperations(
    2: i64 localRev,
    3: i32 count) throws (1: exceptionsC.TalkException e)

  list<structsC.Operation> fetchOps(
    2: i64 localRev,
    3: i32 count,
    4: i64 globalRev,
    5: i64 individualRev) throws (1: exceptionsC.TalkException e, 2: exceptionsC.ShouldSyncException s)

  structsC.Contact findAndAddContactByMetaTag(
    1: i32 reqSeq,
    2: string userid,
    3: string reference) throws (1: exceptionsC.TalkException e)

  map<string, structsC.Contact> findAndAddContactsByEmail(
    1: i32 reqSeq,
    2: set<string> emails) throws (1: exceptionsC.TalkException e)

  map<string, structsC.Contact> findAndAddContactsByMid(
    1: i32 reqSeq,
    2: string mid,
    3: enumsC.ContactType type,
    4: string reference) throws (1: exceptionsC.TalkException e)

  map<string, structsC.Contact> findAndAddContactsByPhone(
    1: i32 reqSeq,
    2: set<string> phones) throws (1: exceptionsC.TalkException e)

  map<string, structsC.Contact> findAndAddContactsByUserid(
    1: i32 reqSeq,
    2: string userid) throws (1: exceptionsC.TalkException e)

  structsC.Contact findContactByMetaTag(
    2: string userid,
    3: string reference) throws (1: exceptionsC.TalkException e)

  structsC.Contact findContactByUserTicket(
    2: string ticketIdWithTag) throws (1: exceptionsC.TalkException e)

  structsC.Contact findContactByUserid(
    2: string userid) throws (1: exceptionsC.TalkException e)

  map<string, structsC.Contact> findContactsByEmail(
    2: set<string> emails) throws (1: exceptionsC.TalkException e)

  map<string, structsC.Contact> findContactsByPhone(
    2: set<string> phones) throws (1: exceptionsC.TalkException e)

  structsC.Group findGroupByTicket(
    1: string ticketId) throws (1: exceptionsC.TalkException e)

  structsC.Group findGroupByTicketV2(
    1: string ticketId) throws (1: exceptionsC.TalkException e)

  void finishUpdateVerification(
    2: string sessionId) throws (1: exceptionsC.TalkException e)

  structsC.Ticket generateUserTicket(
    3: i64 expirationTime,
    4: i32 maxUseCount) throws (1: exceptionsC.TalkException e)

  set<string> getAcceptedProximityMatches(
    2: string sessionId) throws (1: exceptionsC.TalkException e)

  list<string> getActiveBuddySubscriberIds() throws (1: exceptionsC.TalkException e)

  list<string> getAllContactIds() throws (1: exceptionsC.TalkException e)

  structs.AnalyticsInfo getAnalyticsInfo() throws (1: exceptionsC.TalkException e)

  structsC.AuthQrcode getAuthQrcode(
    2: bool keepLoggedIn,
    3: string systemName) throws (1: exceptionsC.TalkException e)

  list<string> getBlockedContactIds() throws (1: exceptionsC.TalkException e)

  list<string> getBlockedContactIdsByRange(
    2: i32 start,
    3: i32 count) throws (1: exceptionsC.TalkException e)

  list<string> getBlockedRecommendationIds() throws (1: exceptionsC.TalkException e)

  list<string> getBuddyBlockerIds() throws (1: exceptionsC.TalkException e)

  structsC.Geolocation getBuddyLocation(
    2: string mid,
    3: i32 index) throws (1: exceptionsC.TalkException e)

  list<structs.ChatRoomAnnouncement> getChatRoomAnnouncements(
    2: string chatRoomMid) throws (1: exceptionsC.TalkException e)

  map<string, list<structs.ChatRoomAnnouncement>> getChatRoomAnnouncementsBulk(
    2: list<string> chatRoomMids
    3: enumsC.SyncReason syncReason) throws (1: exceptionsC.TalkException e)

  list<structsC.CompactContact> getCompactContactsModifiedSince(
    2: i64 timestamp) throws (1: exceptionsC.TalkException e)

  structsC.Group getCompactGroup(
    2: string groupId) throws (1: exceptionsC.TalkException e)

  structsC.Room getCompactRoom(
    2: string roomId) throws (1: exceptionsC.TalkException e)

  structsC.Contact getContact(
    2: string id) throws (1: exceptionsC.TalkException e)

  list<structsC.Contact> getContacts(
    2: list<string> ids) throws (1: exceptionsC.TalkException e)

  structsC.Contact getContactWithFriendRequestStatus(
    2: string id) throws (1: exceptionsC.TalkException e)

  string getCountryWithRequestIp() throws (1: exceptionsC.TalkException e)

  structsC.E2EEPublicKey getE2EEPublicKey(
    2: string mid,
    3: i32 version,
    4: i32 keyId) throws (1: exceptionsC.TalkException e)

  list<structsC.E2EEPublicKey> getE2EEPublicKeys() throws (1: exceptionsC.TalkException e)

  list<structsC.E2EEPublicKey> getE2EEPublicKeysEx(
    2: bool ignoreE2EEStatus) throws (1: exceptionsC.TalkException e)

  list<string> getFavoriteMids() throws (1: exceptionsC.TalkException e)

  list<structs.FriendRequest> getFriendRequests(
    1: enums.FriendRequestDirection direction,
    2: i64 lastSeenSeqId) throws (1: exceptionsC.TalkException e)

  structsC.Group getGroup(
    2: string groupId) throws (1: exceptionsC.TalkException e)

  list<string> getGroupIdsInvited() throws (1: exceptionsC.TalkException e)

  list<string> getGroupIdsJoined() throws (1: exceptionsC.TalkException e)

  structsC.Group getGroupWithoutMembers(
    2: string groupId) throws (1: exceptionsC.TalkException e)

  list<structsC.Group> getGroups(
    2: list<string> groupIds) throws (1: exceptionsC.TalkException e)

  list<structsC.Group> getGroupsV2(
    2: list<string> groupIds) throws (1: exceptionsC.TalkException e)

  list<string> getHiddenContactMids() throws (1: exceptionsC.TalkException e)

  string getIdentityIdentifier() throws (1: exceptionsC.TalkException e)

  i32 getLastAnnouncementIndex() throws (1: exceptionsC.TalkException e)

  map<string, structsC.E2EEPublicKey> getLastE2EEPublicKeys(
    2: string chatMid) throws (1: exceptionsC.TalkException e)

  i64 getLastOpRevision() throws (1: exceptionsC.TalkException e)

  structs.TMessageBox getMessageBox(
    2: string channelId,
    3: string messageBoxId,
    4: i32 lastMessagesCount) throws (1: exceptionsC.TalkException e)

  structs.TMessageBoxWrapUp getMessageBoxCompactWrapUp(
    2: string mid) throws (1: exceptionsC.TalkException e)

  structs.TMessageBoxWrapUpResponse getMessageBoxCompactWrapUpList(
    2: i32 start,
    3: i32 messageBoxCount) throws (1: exceptionsC.TalkException e)

  structs.TMessageBoxWrapUp getMessageBoxCompactWrapUpV2(
    2: string messageBoxId) throws (1: exceptionsC.TalkException e)

  list<structs.TMessageBox> getMessageBoxList(
    2: string channelId,
    3: i32 lastMessagesCount) throws (1: exceptionsC.TalkException e)

  list<structs.TMessageBox> getMessageBoxListByStatus(
    2: string channelId,
    3: i32 lastMessagesCount,
    4: i32 status) throws (1: exceptionsC.TalkException e)

  structs.TMessageBoxWrapUp getMessageBoxWrapUp(
    2: string mid) throws (1: exceptionsC.TalkException e)

  structs.TMessageBoxWrapUpResponse getMessageBoxWrapUpList(
    2: i32 start,
    3: i32 messageBoxCount) throws (1: exceptionsC.TalkException e)

  list<structs.TMessageReadRange> getMessageReadRange(
    2: list<string> chatIds) throws (1: exceptionsC.TalkException e)

  list<structsC.Message> getMessagesBySequenceNumber(
    2: string channelId,
    3: string messageBoxId,
    4: i64 startSeq,
    5: i64 endSeq) throws (1: exceptionsC.TalkException e)

  list<structsC.Message> getNextMessages(
    2: string messageBoxId,
    3: i64 startSeq,
    4: i32 messagesCount) throws (1: exceptionsC.TalkException e)

  list<structsC.Message> getNextMessagesV2(
    2: string messageBoxId,
    3: structs.MessageBoxV2MessageId startMessageId,
    4: i32 messagesCount) throws (1: exceptionsC.TalkException e)

  list<enums.NotificationType> getNotificationPolicy(
    2: enumsC.CarrierCode carrier) throws (1: exceptionsC.TalkException e)

  list<structsC.Message> getPreviousMessages(
    2: string messageBoxId,
    3: i64 endSeq,
    4: i32 messagesCount) throws (1: exceptionsC.TalkException e)

  list<structsC.Message> getPreviousMessagesV2WithReadCount(
    2: string messageBoxId,
    3: structs.MessageBoxV2MessageId endMessageId,
    4: i32 messagesCount) throws (1: exceptionsC.TalkException e)

  structsC.Profile getProfile() throws (1: exceptionsC.TalkException e)

  structs.ProximityMatchCandidateResult getProximityMatchCandidateList(
    2: string sessionId) throws (1: exceptionsC.TalkException e)

  set<structsC.Contact> getProximityMatchCandidates(
    2: string sessionId) throws (1: exceptionsC.TalkException e)

  structsC.RSAKey getRSAKeyInfo(
    2: enumsC.IdentityProvider provider) throws (1: exceptionsC.TalkException e)

  list<structsC.Operation> getReadMessageOpsInBulk(
    2: list<string> chatIds) throws (1: exceptionsC.TalkException e)

  list<structsC.Message> getRecentMessages(
    2: string messageBoxId,
    3: i32 messagesCount) throws (1: exceptionsC.TalkException e)

  list<structsC.Message> getRecentMessagesV2(
    2: string messageBoxId,
    3: i32 messagesCount) throws (1: exceptionsC.TalkException e)

  list<string> getRecommendationIds() throws (1: exceptionsC.TalkException e)

  structsC.Room getRoom(
    2: string roomId) throws (1: exceptionsC.TalkException e)

  i64 getServerTime() throws (1: exceptionsC.TalkException e)

  list<structs.LoginSession> getSessions() throws (1: exceptionsC.TalkException e)

  structs.Settings getSettings(
    1: enumsC.SyncReason syncReason) throws (1: exceptionsC.TalkException e)

  structs.Settings getSettingsAttributes(
    2: i32 attrBitset) throws (1: exceptionsC.TalkException e)

  structs.Settings getSettingsAttributes2(
    2: set<enums.SettingsAttribute2> attrBitsetEx) throws (1: exceptionsC.TalkException e)

  structs.SuggestDictionaryRevisions getSuggestRevisions() throws (1: exceptionsC.TalkException e)

  structs.SystemConfiguration getSystemConfiguration() throws (1: exceptionsC.TalkException e)

  structsC.Ticket getUserTicket() throws (1: exceptionsC.TalkException e)

  structs.WapInvitation getWapInvitation(
    2: string invitationHash) throws (1: exceptionsC.TalkException e)

  void invalidateUserTicket() throws (1: exceptionsC.TalkException e)

  void inviteFriendsBySms(
    2: list<string> phoneNumberList) throws (1: exceptionsC.TalkException e)

  void inviteIntoGroup(
    1: i32 reqSeq,
    2: string groupId,
    3: list<string> contactIds) throws (1: exceptionsC.TalkException e)

  void inviteIntoRoom(
    1: i32 reqSeq,
    2: string roomId,
    3: list<string> contactIds) throws (1: exceptionsC.TalkException e)

  void inviteViaEmail(
    1: i32 reqSeq,
    2: string email,
    3: string name) throws (1: exceptionsC.TalkException e)

  bool isIdentityIdentifierAvailable(
    3: enumsC.IdentityProvider provider,
    2: string identifier) throws (1: exceptionsC.TalkException e)

  bool isUseridAvailable(
    2: string userid) throws (1: exceptionsC.TalkException e)

  void kickoutFromGroup(
    1: i32 reqSeq,
    2: string groupId,
    3: list<string> contactIds) throws (1: exceptionsC.TalkException e)

  void leaveGroup(
    1: i32 reqSeq,
    2: string groupId) throws (1: exceptionsC.TalkException e)

  void leaveRoom(
    1: i32 reqSeq,
    2: string roomId) throws (1: exceptionsC.TalkException e)

  string loginWithIdentityCredential(
    8: enumsC.IdentityProvider provider,
    3: string identifier,
    4: string password,
    5: bool keepLoggedIn,
    6: string accessLocation,
    7: string systemName,
    9: string certificate) throws (1: exceptionsC.TalkException e)

  structsC.LoginResult loginWithIdentityCredentialForCertificate(
    8: enumsC.IdentityProvider provider,
    3: string identifier,
    4: string password,
    5: bool keepLoggedIn,
    6: string accessLocation,
    7: string systemName,
    9: string certificate) throws (1: exceptionsC.TalkException e)

  string loginWithVerifier(
    3: string verifier) throws (1: exceptionsC.TalkException e)

  structsC.LoginResult loginWithVerifierForCertificate(
    3: string verifier) throws (1: exceptionsC.TalkException e)

  void logout() throws (1: exceptionsC.TalkException e)

  void logoutSession(
    2: string tokenKey) throws (1: exceptionsC.TalkException e)

  structsC.ContactTransition makeUserAddMyselfAsContact(
    1: string contactOwnerMid) throws (1: exceptionsC.TalkException e)

  structs.E2EENegotiationResult negotiateE2EEPublicKey(
    2: string mid) throws (1: exceptionsC.TalkException e)

  void noop() throws (1: exceptionsC.TalkException e)

  void notifiedRedirect(
    2: map<string, string> paramMap) throws (1: exceptionsC.TalkException e)

  map<string, string> notifyBuddyOnAir(
    1: i32 seq,
    2: list<string> receiverMids) throws (1: exceptionsC.TalkException e)

  void notifyIndividualEvent(
    2: enumsC.NotificationStatus notificationStatus,
    3: list<string> receiverMids) throws (1: exceptionsC.TalkException e)

  void notifyInstalled(
    2: string udidHash,
    3: string applicationTypeWithExtensions) throws (1: exceptionsC.TalkException e)

  void notifyRegistrationComplete(
    2: string udidHash,
    3: string applicationTypeWithExtensions) throws (1: exceptionsC.TalkException e)

  void notifySleep(
    2: i64 lastRev,
    3: i32 badge) throws (1: exceptionsC.TalkException e)

  void notifyUpdated(
    2: i64 lastRev,
    3: structsC.DeviceInfo deviceInfo,
    4: string udidHash,
    5: string oldUdidHash) throws (1: exceptionsC.TalkException e)

  string openProximityMatch(
    2: structsC.Location location) throws (1: exceptionsC.TalkException e)

  string registerBuddyUser(
    2: string buddyId,
    3: string registrarPassword) throws (1: exceptionsC.TalkException e)

  void registerBuddyUserid(
    2: i32 seq,
    3: string userid) throws (1: exceptionsC.TalkException e)

  string registerDevice(
    2: string sessionId) throws (1: exceptionsC.TalkException e)

  string registerDeviceWithIdentityCredential(
    2: string sessionId,
    3: string identifier,
    4: string verifier,
    5: enumsC.IdentityProvider provider,
    6: string migrationPincodeSessionId) throws (1: exceptionsC.TalkException e)

  string registerDeviceWithoutPhoneNumber(
    2: string region,
    3: string udidHash,
    4: structsC.DeviceInfo deviceInfo) throws (1: exceptionsC.TalkException e)

  string registerDeviceWithoutPhoneNumberWithIdentityCredential(
    2: string region,
    3: string udidHash,
    4: structsC.DeviceInfo deviceInfo,
    5: enumsC.IdentityProvider provider,
    6: string identifier,
    7: string verifier,
    8: string mid,
    9: string migrationPincodeSessionId) throws (1: exceptionsC.TalkException e)

  structsC.E2EEPublicKey registerE2EEPublicKey(
    1: i32 reqSeq,
    2: structsC.E2EEPublicKey publicKey) throws (1: exceptionsC.TalkException e)

  bool registerUserid(
    1: i32 reqSeq,
    2: string userid) throws (1: exceptionsC.TalkException e)

  string registerWapDevice(
    2: string invitationHash,
    3: string guidHash,
    4: string email,
    5: structsC.DeviceInfo deviceInfo) throws (1: exceptionsC.TalkException e)

  string registerWithExistingSnsIdAndIdentityCredential(
    2: structsC.IdentityCredential identityCredential,
    3: string region,
    4: string udidHash,
    5: structsC.DeviceInfo deviceInfo) throws (1: exceptionsC.TalkException e)

  structs.RegisterWithPhoneNumberResult registerWithPhoneNumber(
    2: string sessionId,
    3: string migrationPincodeSessionId) throws (1: exceptionsC.TalkException e)

  structs.RegisterWithPhoneNumberResult registerWithPhoneNumberAndPassword(
    2: string sessionId,
    3: string keynm,
    4: string encrypted) throws (1: exceptionsC.TalkException e)

  string registerWithSnsIdAndIdentityCredential(
    2: enumsC.SnsIdType snsIdType,
    3: string snsAccessToken,
    4: structsC.IdentityCredential identityCredential,
    5: string region,
    6: string udidHash,
    7: structsC.DeviceInfo deviceInfo,
    8: string migrationPincodeSessionId) throws (1: exceptionsC.TalkException e)

  string reissueDeviceCredential() throws (1: exceptionsC.TalkException e)

  string reissueGroupTicket(
    1: string groupMid) throws (1: exceptionsC.TalkException e)

  string reissueUserTicket(
    3: i64 expirationTime,
    4: i32 maxUseCount) throws (1: exceptionsC.TalkException e)

  void rejectGroupInvitation(
    1: i32 reqSeq,
    2: string groupId) throws (1: exceptionsC.TalkException e)

  void releaseSession() throws (1: exceptionsC.TalkException e)

  void removeAllMessages(
    1: i32 seq,
    2: string lastMessageId) throws (1: exceptionsC.TalkException e)

  void removeBuddyLocation(
    2: string mid,
    3: i32 index) throws (1: exceptionsC.TalkException e)

  void removeChatRoomAnnouncement(
    1: i32 reqSeq,
    2: string chatRoomMid,
    3: i64 announcementSeq) throws (1: exceptionsC.TalkException e)

  void removeE2EEPublicKey(
    2: structsC.E2EEPublicKey publicKey) throws (1: exceptionsC.TalkException e)

  void removeFriendRequest(
    1: enums.FriendRequestDirection direction,
    2: string midOrEMid) throws (1: exceptionsC.TalkException e)

  bool removeMessage(
    2: string messageId) throws (1: exceptionsC.TalkException e)

  bool removeMessageFromMyHome(
    2: string messageId) throws (1: exceptionsC.TalkException e)

  string removeSnsId(
    2: enumsC.SnsIdType snsIdType) throws (1: exceptionsC.TalkException e)

  void report(
    2: i64 syncOpRevision,
    3: enums.SyncCategory category,
    4: string report) throws (1: exceptionsC.TalkException e)

  void reportClientStatistics(
    1: i32 reqSeq,
    2: enums.ReportCategory category,
    3: i32 count) throws (1: exceptionsC.TalkException e)

  list<structs.ContactReportResult> reportContacts(
    2: i64 syncOpRevision,
    3: enums.SyncCategory category,
    4: list<structs.ContactReport> contactReports,
    5: enums.SyncActionType actionType) throws (1: exceptionsC.TalkException e)

  void reportGroups(
    2: i64 syncOpRevision,
    3: list<structsC.Group> groups) throws (1: exceptionsC.TalkException e)

  void reportProfile(
    2: i64 syncOpRevision,
    3: structsC.Profile profile) throws (1: exceptionsC.TalkException e)

  void reportRooms(
    2: i64 syncOpRevision,
    3: list<structsC.Room> rooms) throws (1: exceptionsC.TalkException e)

  void reportSettings(
    2: i64 syncOpRevision,
    3: structs.Settings settings) throws (1: exceptionsC.TalkException e)

  void reportSpam(
    2: string chatMid,
    3: list<string> memberMids,
    4: list<enums.SpammerReason> spammerReasons,
    5: list<string> senderMids,
    6: list<string> spamMessageIds,
    7: list<string> spamMessages) throws (1: exceptionsC.TalkException e)

  void reportSpammer(
    2: string spammerMid,
    3: list<enums.SpammerReason> spammerReasons,
    4: list<string> spamMessageIds,
    5: list<string> spamMesages) throws (1: exceptionsC.TalkException e)

  void requestAccountPasswordReset(
    4: enumsC.IdentityProvider provider,
    2: string identifier,
    5: string locale) throws (1: exceptionsC.TalkException e)

  void requestE2EEKeyExchange(
    1: i32 reqSeq,
    2: binary temporalPublicKey,
    3: structsC.E2EEPublicKey publicKey,
    4: binary verifier) throws (1: exceptionsC.TalkException e)

  structs.EmailConfirmationSession requestEmailConfirmation(
    2: structs.EmailConfirmation emailConfirmation) throws (1: exceptionsC.TalkException e)

  void requestIdentityUnbind(
    4: enumsC.IdentityProvider provider,
    2: string identifier) throws (1: exceptionsC.TalkException e)

  void requestResendMessage(
    1: i32 reqSeq,
    2: string senderMid,
    3: string messageId) throws (1: exceptionsC.TalkException e)

  structs.EmailConfirmationSession resendEmailConfirmation(
    2: string verifier) throws (1: exceptionsC.TalkException e)

  void resendPinCode(
    2: string sessionId) throws (1: exceptionsC.TalkException e)

  void resendPinCodeBySMS(
    2: string sessionId) throws (1: exceptionsC.TalkException e)

  void respondResendMessage(
    1: i32 reqSeq,
    2: string receiverMid,
    3: string originalMessageId,
    4: structsC.Message resendMessage,
    5: enumsC.ErrorCode errorCode) throws (1: exceptionsC.TalkException e)

  void sendChatChecked(
    1: i32 seq,
    2: string consumer,
    3: string lastMessageId,
    4: i8 sessionId) throws (1: exceptionsC.TalkException e)

  void sendChatRemoved(
    1: i32 seq,
    2: string consumer,
    3: string lastMessageId,
    4: i8 sessiondId) throws (1: exceptionsC.TalkException e)

  map<string, string> sendContentPreviewUpdated(
    1: i32 esq,
    2: string messageId,
    3: list<string> receiverMids) throws (1: exceptionsC.TalkException e)

  void sendContentReceipt(
    1: i32 seq,
    2: string consumer,
    3: string messageId) throws (1: exceptionsC.TalkException e)

  void sendDummyPush() throws (1: exceptionsC.TalkException e)

  structsC.Message sendEvent(
    1: i32 seq,
    2: structsC.Message message) throws (1: exceptionsC.TalkException e)

  structsC.Message sendMessage(
    1: i32 seq,
    2: structsC.Message message) throws (1: exceptionsC.TalkException e)

  structs.CommitMessageResult sendMessageAwaitCommit(
    1: i32 seq,
    2: structsC.Message message) throws (1: exceptionsC.TalkException e)

  void sendMessageIgnored(
    1: i32 seq,
    2: string consumer,
    3: list<string> messageIds) throws (1: exceptionsC.TalkException e)

  void sendMessageReceipt(
    1: i32 seq,
    2: string consumer,
    3: list<string> messageIds) throws (1: exceptionsC.TalkException e)

  structsC.Message sendMessageToMyHome(
    1: i32 seq,
    2: structsC.Message message) throws (1: exceptionsC.TalkException e)

  void setBuddyLocation(
    2: string mid,
    3: i32 index,
    4: structsC.Geolocation location) throws (1: exceptionsC.TalkException e)

  void setIdentityCredential(
    2: string identifier,
    3: string verifier,
    4: enumsC.IdentityProvider provider) throws (1: exceptionsC.TalkException e)

  void setNotificationsEnabled(
    1: i32 reqSeq,
    2: enumsC.MIDType type,
    3: string target,
    4: bool enablement) throws (1: exceptionsC.TalkException e)

  structsC.VerificationSessionData startUpdateVerification(
    2: string region,
    3: enumsC.CarrierCode carrier,
    4: string phone,
    5: string udidHash,
    6: structsC.DeviceInfo deviceInfo,
    7: string networkCode,
    8: string locale,
    9: structs.SIMInfo simInfo) throws (1: exceptionsC.TalkException e)

  structsC.VerificationSessionData startVerification(
    2: string region,
    3: enumsC.CarrierCode carrier,
    4: string phone,
    5: string udidHash,
    6: structsC.DeviceInfo deviceInfo,
    7: string networkCode,
    8: string mid,
    9: string locale,
    10: structs.SIMInfo simInfo,
    11: string oldUdidHash) throws (1: exceptionsC.TalkException e)

  void storeUpdateProfileAttribute(
    1: i32 seq,
    2: enumsC.ProfileAttribute profileAttribute,
    3: string value) throws (1: exceptionsC.TalkException e)

  list<structs.SnsFriendContactRegistration> syncContactBySnsIds(
    1: i32 reqSeq,
    2: list<structs.SnsFriendModification> modifications) throws (1: exceptionsC.TalkException e)

  map<string, structs.ContactRegistration> syncContacts(
    1: i32 reqSeq,
    2: list<structs.ContactModification> localContacts) throws (1: exceptionsC.TalkException e)

  void tryFriendRequest(
    1: string midOrEMid,
    2: enums.FriendRequestMethod method,
    3: string friendRequestParams) throws (1: exceptionsC.TalkException e)

  structsC.Message trySendMessage(
    1: i32 seq,
    2: structsC.Message message) throws (1: exceptionsC.TalkException e)

  void unblockContact(
    1: i32 reqSeq,
    2: string id,
    3: string reference) throws (1: exceptionsC.TalkException e)

  void unblockRecommendation(
    1: i32 reqSeq,
    2: string id) throws (1: exceptionsC.TalkException e)

  string unregisterUserAndDevice() throws (1: exceptionsC.TalkException e)

  void unsendMessage(
    1: i32 seq,
    2: string messageId) throws (1: exceptionsC.TalkException e)

  void updateApnsDeviceToken(
    2: binary apnsDeviceToken) throws (1: exceptionsC.TalkException e)

  void updateBuddySetting(
    2: string key,
    3: string value) throws (1: exceptionsC.TalkException e)

  void updateC2DMRegistrationId(
    2: string registrationId) throws (1: exceptionsC.TalkException e)

  void updateContactSetting(
    1: i32 reqSeq,
    2: string mid,
    3: enums.ContactSetting flag,
    4: string value) throws (1: exceptionsC.TalkException e)

  void updateCustomModeSettings(
    2: enums.CustomMode customMode,
    3: map<string, string> paramMap) throws (1: exceptionsC.TalkException e)

  void updateDeviceInfo(
    2: string deviceUid,
    3: structsC.DeviceInfo deviceInfo) throws (1: exceptionsC.TalkException e)

  void updateGroup(
    1: i32 reqSeq,
    2: structsC.Group group) throws (1: exceptionsC.TalkException e)

  void updateGroupPreferenceAttribute(
    1: i32 reqSeq,
    2: string groupMid,
    3: map<enums.GroupPreferenceAttribute, string> updatedAttrs) throws (1: exceptionsC.TalkException e)

  void updateNotificationToken(
    3: enums.NotificationType type,
    2: string token) throws (1: exceptionsC.TalkException e)

  void updateNotificationTokenWithBytes(
    3: enums.NotificationType type,
    2: binary token) throws (1: exceptionsC.TalkException e)

  void updateProfile(
    1: i32 reqSeq,
    2: structsC.Profile profile) throws (1: exceptionsC.TalkException e)

  void updateProfileAttribute(
    1: i32 reqSeq,
    2: enumsC.ProfileAttribute attr,
    3: string value) throws (1: exceptionsC.TalkException e)

  void updateRegion(
    2: string region) throws (1: exceptionsC.TalkException e)

  void updateSettings(
    1: i32 reqSeq,
    2: structs.Settings settings) throws (1: exceptionsC.TalkException e)

  i32 updateSettings2(
    1: i32 reqSeq,
    2: structs.Settings settings) throws (1: exceptionsC.TalkException e)

  void updateSettingsAttribute(
    1: i32 reqSeq,
    2: enums.SettingsAttribute attr,
    3: string value) throws (1: exceptionsC.TalkException e)

  i32 updateSettingsAttributes(
    1: i32 reqSeq,
    2: i32 attrBitset,
    3: structs.Settings settings) throws (1: exceptionsC.TalkException e)

  set<enums.SettingsAttribute2> updateSettingsAttributes2(
    1: i32 reqSeq,
    3: structs.Settings settings,
    4: set<enums.SettingsAttribute2> attrBitsetEx) throws (1: exceptionsC.TalkException e)

  void updateExtendedProfileAttribute(
    1: i32 reqSeq,
    2: enumsC.ExtendedProfileAttribute attr,
    3: structsC.ExtendedProfile extendedProfile) throws (1: exceptionsC.TalkException e)

  map<string, string> validateContactsOnBot(
    2: list<string> contacts) throws (1: exceptionsC.TalkException e)

  void verifyIdentityCredential(
    8: enumsC.IdentityProvider provider,
    3: string identifier,
    4: string password) throws (1: exceptionsC.TalkException e)

  structs.UserAuthStatus verifyIdentityCredentialWithResult(
    2: structsC.IdentityCredential identityCredential,
    3: string migrationPincodeSessionId) throws (1: exceptionsC.TalkException e)

  enums.VerificationResult verifyPhone(
    2: string sessionId,
    3: string pinCode,
    4: string udidHash) throws (1: exceptionsC.TalkException e)

  structs.PhoneVerificationResult verifyPhoneNumber(
    2: string sessionId,
    3: string pinCode,
    4: string udidHash,
    5: string migrationPincodeSessionId,
    6: string oldUdidHash) throws (1: exceptionsC.TalkException e)

  string verifyPhoneNumberForLogin(
    2: string verifierFromPhone,
    3: string pinCodeForPhone,
    4: string verifierFromLogin) throws (1: exceptionsC.TalkException e)

  string verifyQrcode(
    2: string verifier,
    3: string pinCode) throws (1: exceptionsC.TalkException e)

}