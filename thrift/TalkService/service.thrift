include "enums.thrift"
include "structs.thrift"
include "exceptions.thrift"

namespace py LineThrift.talk

service TalkService {

  void acceptGroupInvitation(
    1: i32 reqSeq,
    2: string groupId) throws (1: exceptions.TalkException e)

  void acceptGroupInvitationByTicket(
    1: i32 reqSeq,
    2: string GroupMid,
    3: string ticketId) throws (1: exceptions.TalkException e)

  void acceptProximityMatches(
    2: string sessionId,
    3: set<string> ids) throws (1: exceptions.TalkException e)

  list<string> acquireCallRoute(
    2: string to) throws (1: exceptions.TalkException e)

  string acquireCallTicket(
    2: string to) throws (1: exceptions.TalkException e)

  string acquireEncryptedAccessToken(
    2: enums.FeatureType featureType) throws (1: exceptions.TalkException e)

  string addSnsId(
    2: enums.SnsIdType snsIdType,
    3: string snsAccessToken) throws (1: exceptions.TalkException e)

  void blockContact(
    1: i32 reqSeq,
    2: string id) throws (1: exceptions.TalkException e)

  void blockRecommendation(
    1: i32 reqSeq,
    2: string id) throws (1: exceptions.TalkException e)

  void cancelGroupInvitation(
    1: i32 reqSeq,
    2: string groupId,
    3: list<string> contactIds) throws (1: exceptions.TalkException e)

  structs.VerificationSessionData changeVerificationMethod(
    2: string sessionId,
    3: enums.VerificationMethod method) throws (1: exceptions.TalkException e)

  void clearIdentityCredential() throws (1: exceptions.TalkException e)

  void clearMessageBox(
    2: string channelId,
    3: string messageBoxId) throws (1: exceptions.TalkException e)

  void clearRingbackTone() throws (1: exceptions.TalkException e)

  void closeProximityMatch(
    2: string sessionId) throws (1: exceptions.TalkException e)

  map<string, string> commitSendMessage(
    1: i32 seq,
    2: string messageId,
    3: list<string> receiverMids) throws (1: exceptions.TalkException e)

  map<string, string> commitSendMessages(
    1: i32 seq,
    2: list<string> messageIds,
    3: list<string> receiverMids) throws (1: exceptions.TalkException e)

  map<string, string> commitUpdateProfile(
    1: i32 seq,
    2: list<enums.ProfileAttribute> attrs,
    3: list<string> receiverMids) throws (1: exceptions.TalkException e)

  void confirmEmail(
    2: string verifier,
    3: string pinCode) throws (1: exceptions.TalkException e)

  structs.ChatRoomAnnouncement createChatRoomAnnouncement(
    1: i32 reqSeq,
    2: string chatRoomMid,
    3: enums.ChatRoomAnnouncementType type,
    4: structs.ChatRoomAnnouncementContents contents) throws (1: exceptions.TalkException e)

  structs.Group createGroup(
    1: i32 seq,
    2: string name,
    3: list<string> contactIds) throws (1: exceptions.TalkException e)

  string createQrcodeBase64Image(
    2: string url,
    3: string characterSet,
    4: i32 imageSize,
    5: i32 x,
    6: i32 y,
    7: i32 width,
    8: i32 height) throws (1: exceptions.TalkException e)

  structs.Room createRoom(
    1: i32 reqSeq,
    2: list<string> contactIds) throws (1: exceptions.TalkException e)

  structs.Room createRoomV2(
    1: i32 reqSeq,
    2: list<string> contactIds) throws (1: exceptions.TalkException e)

  string createSession() throws (1: exceptions.TalkException e)

  void destroyMessage(
    1: i32 seq,
    2: string chatId,
    3: string messageId,
    4: i8 sessionId) throws (1: exceptions.TalkException e)

  list<structs.Announcement> fetchAnnouncements(
    2: i32 lastFetchedIndex) throws (1: exceptions.TalkException e)

  list<structs.Message> fetchMessages(
    2: i64 localTs,
    3: i32 count) throws (1: exceptions.TalkException e)

  list<structs.Operation> fetchOperations(
    2: i64 localRev,
    3: i32 count) throws (1: exceptions.TalkException e)

  list<structs.Operation> fetchOps(
    2: i64 localRev,
    3: i32 count,
    4: i64 globalRev,
    5: i64 individualRev) throws (1: exceptions.TalkException e, 2: exceptions.ShouldSyncException s)

  structs.Contact findAndAddContactByMetaTag(
    1: i32 reqSeq,
    2: string userid,
    3: string reference) throws (1: exceptions.TalkException e)

  map<string, structs.Contact> findAndAddContactsByEmail(
    1: i32 reqSeq,
    2: set<string> emails) throws (1: exceptions.TalkException e)

  map<string, structs.Contact> findAndAddContactsByMid(
    1: i32 reqSeq,
    2: string mid,
    3: enums.ContactType type,
    4: string reference) throws (1: exceptions.TalkException e)

  map<string, structs.Contact> findAndAddContactsByPhone(
    1: i32 reqSeq,
    2: set<string> phones) throws (1: exceptions.TalkException e)

  map<string, structs.Contact> findAndAddContactsByUserid(
    1: i32 reqSeq,
    2: string userid) throws (1: exceptions.TalkException e)

  structs.Contact findContactByMetaTag(
    2: string userid,
    3: string reference) throws (1: exceptions.TalkException e)

  structs.Contact findContactByUserTicket(
    2: string ticketIdWithTag) throws (1: exceptions.TalkException e)

  structs.Contact findContactByUserid(
    2: string userid) throws (1: exceptions.TalkException e)

  map<string, structs.Contact> findContactsByEmail(
    2: set<string> emails) throws (1: exceptions.TalkException e)

  map<string, structs.Contact> findContactsByPhone(
    2: set<string> phones) throws (1: exceptions.TalkException e)

  structs.Group findGroupByTicket(
    1: string ticketId) throws (1: exceptions.TalkException e)

  structs.Group findGroupByTicketV2(
    1: string ticketId) throws (1: exceptions.TalkException e)

  void finishUpdateVerification(
    2: string sessionId) throws (1: exceptions.TalkException e)

  structs.Ticket generateUserTicket(
    3: i64 expirationTime,
    4: i32 maxUseCount) throws (1: exceptions.TalkException e)

  set<string> getAcceptedProximityMatches(
    2: string sessionId) throws (1: exceptions.TalkException e)

  list<string> getActiveBuddySubscriberIds() throws (1: exceptions.TalkException e)

  list<string> getAllContactIds() throws (1: exceptions.TalkException e)

  structs.AnalyticsInfo getAnalyticsInfo() throws (1: exceptions.TalkException e)

  structs.AuthQrcode getAuthQrcode(
    2: bool keepLoggedIn,
    3: string systemName) throws (1: exceptions.TalkException e)

  list<string> getBlockedContactIds() throws (1: exceptions.TalkException e)

  list<string> getBlockedContactIdsByRange(
    2: i32 start,
    3: i32 count) throws (1: exceptions.TalkException e)

  list<string> getBlockedRecommendationIds() throws (1: exceptions.TalkException e)

  list<string> getBuddyBlockerIds() throws (1: exceptions.TalkException e)

  structs.Geolocation getBuddyLocation(
    2: string mid,
    3: i32 index) throws (1: exceptions.TalkException e)

  list<structs.ChatRoomAnnouncement> getChatRoomAnnouncements(
    2: string chatRoomMid) throws (1: exceptions.TalkException e)

  map<string, list<structs.ChatRoomAnnouncement>> getChatRoomAnnouncementsBulk(
    2: list<string> chatRoomMids) throws (1: exceptions.TalkException e)

  list<structs.CompactContact> getCompactContactsModifiedSince(
    2: i64 timestamp) throws (1: exceptions.TalkException e)

  structs.Group getCompactGroup(
    2: string groupId) throws (1: exceptions.TalkException e)

  structs.Room getCompactRoom(
    2: string roomId) throws (1: exceptions.TalkException e)

  structs.Contact getContact(
    2: string id) throws (1: exceptions.TalkException e)

  list<structs.Contact> getContacts(
    2: list<string> ids) throws (1: exceptions.TalkException e)

  structs.Contact getContactWithFriendRequestStatus(
    2: string id) throws (1: exceptions.TalkException e)

  string getCountryWithRequestIp() throws (1: exceptions.TalkException e)

  structs.E2EEPublicKey getE2EEPublicKey(
    2: string mid,
    3: i32 version,
    4: i32 keyId) throws (1: exceptions.TalkException e)

  list<structs.E2EEPublicKey> getE2EEPublicKeys() throws (1: exceptions.TalkException e)

  list<structs.E2EEPublicKey> getE2EEPublicKeysEx(
    2: bool ignoreE2EEStatus) throws (1: exceptions.TalkException e)

  list<string> getFavoriteMids() throws (1: exceptions.TalkException e)

  list<structs.FriendRequest> getFriendRequests(
    1: enums.FriendRequestDirection direction,
    2: i64 lastSeenSeqId) throws (1: exceptions.TalkException e)

  structs.Group getGroup(
    2: string groupId) throws (1: exceptions.TalkException e)

  list<string> getGroupIdsInvited() throws (1: exceptions.TalkException e)

  list<string> getGroupIdsJoined() throws (1: exceptions.TalkException e)

  structs.Group getGroupWithoutMembers(
    2: string groupId) throws (1: exceptions.TalkException e)

  list<structs.Group> getGroups(
    2: list<string> groupIds) throws (1: exceptions.TalkException e)

  list<structs.Group> getGroupsV2(
    2: list<string> groupIds) throws (1: exceptions.TalkException e)

  list<string> getHiddenContactMids() throws (1: exceptions.TalkException e)

  string getIdentityIdentifier() throws (1: exceptions.TalkException e)

  i32 getLastAnnouncementIndex() throws (1: exceptions.TalkException e)

  map<string, structs.E2EEPublicKey> getLastE2EEPublicKeys(
    2: string chatMid) throws (1: exceptions.TalkException e)

  i64 getLastOpRevision() throws (1: exceptions.TalkException e)

  structs.TMessageBox getMessageBox(
    2: string channelId,
    3: string messageBoxId,
    4: i32 lastMessagesCount) throws (1: exceptions.TalkException e)

  structs.TMessageBoxWrapUp getMessageBoxCompactWrapUp(
    2: string mid) throws (1: exceptions.TalkException e)

  structs.TMessageBoxWrapUpResponse getMessageBoxCompactWrapUpList(
    2: i32 start,
    3: i32 messageBoxCount) throws (1: exceptions.TalkException e)

  structs.TMessageBoxWrapUp getMessageBoxCompactWrapUpV2(
    2: string messageBoxId) throws (1: exceptions.TalkException e)

  list<structs.TMessageBox> getMessageBoxList(
    2: string channelId,
    3: i32 lastMessagesCount) throws (1: exceptions.TalkException e)

  list<structs.TMessageBox> getMessageBoxListByStatus(
    2: string channelId,
    3: i32 lastMessagesCount,
    4: i32 status) throws (1: exceptions.TalkException e)

  structs.TMessageBoxWrapUp getMessageBoxWrapUp(
    2: string mid) throws (1: exceptions.TalkException e)

  structs.TMessageBoxWrapUpResponse getMessageBoxWrapUpList(
    2: i32 start,
    3: i32 messageBoxCount) throws (1: exceptions.TalkException e)

  list<structs.TMessageReadRange> getMessageReadRange(
    2: list<string> chatIds) throws (1: exceptions.TalkException e)

  list<structs.Message> getMessagesBySequenceNumber(
    2: string channelId,
    3: string messageBoxId,
    4: i64 startSeq,
    5: i64 endSeq) throws (1: exceptions.TalkException e)

  list<structs.Message> getNextMessages(
    2: string messageBoxId,
    3: i64 startSeq,
    4: i32 messagesCount) throws (1: exceptions.TalkException e)

  list<structs.Message> getNextMessagesV2(
    2: string messageBoxId,
    3: structs.MessageBoxV2MessageId startMessageId,
    4: i32 messagesCount) throws (1: exceptions.TalkException e)

  list<enums.NotificationType> getNotificationPolicy(
    2: enums.CarrierCode carrier) throws (1: exceptions.TalkException e)

  list<structs.Message> getPreviousMessages(
    2: string messageBoxId,
    3: i64 endSeq,
    4: i32 messagesCount) throws (1: exceptions.TalkException e)

  list<structs.Message> getPreviousMessagesV2WithReadCount(
    2: string messageBoxId,
    3: structs.MessageBoxV2MessageId endMessageId,
    4: i32 messagesCount) throws (1: exceptions.TalkException e)

  structs.Profile getProfile() throws (1: exceptions.TalkException e)

  structs.ProximityMatchCandidateResult getProximityMatchCandidateList(
    2: string sessionId) throws (1: exceptions.TalkException e)

  set<structs.Contact> getProximityMatchCandidates(
    2: string sessionId) throws (1: exceptions.TalkException e)

  structs.RSAKey getRSAKeyInfo(
    2: enums.IdentityProvider provider) throws (1: exceptions.TalkException e)

  list<structs.Operation> getReadMessageOpsInBulk(
    2: list<string> chatIds) throws (1: exceptions.TalkException e)

  list<structs.Message> getRecentMessages(
    2: string messageBoxId,
    3: i32 messagesCount) throws (1: exceptions.TalkException e)

  list<structs.Message> getRecentMessagesV2(
    2: string messageBoxId,
    3: i32 messagesCount) throws (1: exceptions.TalkException e)

  list<string> getRecommendationIds() throws (1: exceptions.TalkException e)

  structs.Room getRoom(
    2: string roomId) throws (1: exceptions.TalkException e)

  i64 getServerTime() throws (1: exceptions.TalkException e)

  list<structs.LoginSession> getSessions() throws (1: exceptions.TalkException e)

  structs.Settings getSettings() throws (1: exceptions.TalkException e)

  structs.Settings getSettingsAttributes(
    2: i32 attrBitset) throws (1: exceptions.TalkException e)

  structs.Settings getSettingsAttributes2(
    2: set<enums.SettingsAttribute2> attrBitsetEx) throws (1: exceptions.TalkException e)

  structs.SuggestDictionaryRevisions getSuggestRevisions() throws (1: exceptions.TalkException e)

  structs.SystemConfiguration getSystemConfiguration() throws (1: exceptions.TalkException e)

  structs.Ticket getUserTicket() throws (1: exceptions.TalkException e)

  structs.WapInvitation getWapInvitation(
    2: string invitationHash) throws (1: exceptions.TalkException e)

  void invalidateUserTicket() throws (1: exceptions.TalkException e)

  void inviteFriendsBySms(
    2: list<string> phoneNumberList) throws (1: exceptions.TalkException e)

  void inviteIntoGroup(
    1: i32 reqSeq,
    2: string groupId,
    3: list<string> contactIds) throws (1: exceptions.TalkException e)

  void inviteIntoRoom(
    1: i32 reqSeq,
    2: string roomId,
    3: list<string> contactIds) throws (1: exceptions.TalkException e)

  void inviteViaEmail(
    1: i32 reqSeq,
    2: string email,
    3: string name) throws (1: exceptions.TalkException e)

  bool isIdentityIdentifierAvailable(
    3: enums.IdentityProvider provider,
    2: string identifier) throws (1: exceptions.TalkException e)

  bool isUseridAvailable(
    2: string userid) throws (1: exceptions.TalkException e)

  void kickoutFromGroup(
    1: i32 reqSeq,
    2: string groupId,
    3: list<string> contactIds) throws (1: exceptions.TalkException e)

  void leaveGroup(
    1: i32 reqSeq,
    2: string groupId) throws (1: exceptions.TalkException e)

  void leaveRoom(
    1: i32 reqSeq,
    2: string roomId) throws (1: exceptions.TalkException e)

  string loginWithIdentityCredential(
    8: enums.IdentityProvider identityProvider,
    3: string identifier,
    4: string password,
    5: bool keepLoggedIn,
    6: string accessLocation,
    7: string systemName,
    9: string certificate) throws (1: exceptions.TalkException e)

  structs.LoginResult loginWithIdentityCredentialForCertificate(
    8: enums.IdentityProvider identityProvider,
    3: string identifier,
    4: string password,
    5: bool keepLoggedIn,
    6: string accessLocation,
    7: string systemName,
    9: string certificate) throws (1: exceptions.TalkException e)

  string loginWithVerifier(
    3: string verifier) throws (1: exceptions.TalkException e)

  structs.LoginResult loginWithVerifierForCertificate(
    3: string verifier) throws (1: exceptions.TalkException e)

  void logout() throws (1: exceptions.TalkException e)

  void logoutSession(
    2: string tokenKey) throws (1: exceptions.TalkException e)

  structs.ContactTransition makeUserAddMyselfAsContact(
    1: string contactOwnerMid) throws (1: exceptions.TalkException e)

  structs.E2EENegotiationResult negotiateE2EEPublicKey(
    2: string mid) throws (1: exceptions.TalkException e)

  void noop() throws (1: exceptions.TalkException e)

  void notifiedRedirect(
    2: map<string, string> paramMap) throws (1: exceptions.TalkException e)

  map<string, string> notifyBuddyOnAir(
    1: i32 seq,
    2: list<string> receiverMids) throws (1: exceptions.TalkException e)

  void notifyIndividualEvent(
    2: enums.NotificationStatus notificationStatus,
    3: list<string> receiverMids) throws (1: exceptions.TalkException e)

  void notifyInstalled(
    2: string udidHash,
    3: string applicationTypeWithExtensions) throws (1: exceptions.TalkException e)

  void notifyRegistrationComplete(
    2: string udidHash,
    3: string applicationTypeWithExtensions) throws (1: exceptions.TalkException e)

  void notifySleep(
    2: i64 lastRev,
    3: i32 badge) throws (1: exceptions.TalkException e)

  void notifyUpdated(
    2: i64 lastRev,
    3: structs.DeviceInfo deviceInfo,
    4: string udidHash,
    5: string oldUdidHash) throws (1: exceptions.TalkException e)

  string openProximityMatch(
    2: structs.Location location) throws (1: exceptions.TalkException e)

  string registerBuddyUser(
    2: string buddyId,
    3: string registrarPassword) throws (1: exceptions.TalkException e)

  void registerBuddyUserid(
    2: i32 seq,
    3: string userid) throws (1: exceptions.TalkException e)

  string registerDevice(
    2: string sessionId) throws (1: exceptions.TalkException e)

  string registerDeviceWithIdentityCredential(
    2: string sessionId,
    3: string identifier,
    4: string verifier,
    5: enums.IdentityProvider provider,
    6: string migrationPincodeSessionId) throws (1: exceptions.TalkException e)

  string registerDeviceWithoutPhoneNumber(
    2: string region,
    3: string udidHash,
    4: structs.DeviceInfo deviceInfo) throws (1: exceptions.TalkException e)

  string registerDeviceWithoutPhoneNumberWithIdentityCredential(
    2: string region,
    3: string udidHash,
    4: structs.DeviceInfo deviceInfo,
    5: enums.IdentityProvider provider,
    6: string identifier,
    7: string verifier,
    8: string mid,
    9: string migrationPincodeSessionId) throws (1: exceptions.TalkException e)

  structs.E2EEPublicKey registerE2EEPublicKey(
    1: i32 reqSeq,
    2: structs.E2EEPublicKey publicKey) throws (1: exceptions.TalkException e)

  bool registerUserid(
    1: i32 reqSeq,
    2: string userid) throws (1: exceptions.TalkException e)

  string registerWapDevice(
    2: string invitationHash,
    3: string guidHash,
    4: string email,
    5: structs.DeviceInfo deviceInfo) throws (1: exceptions.TalkException e)

  string registerWithExistingSnsIdAndIdentityCredential(
    2: structs.IdentityCredential identityCredential,
    3: string region,
    4: string udidHash,
    5: structs.DeviceInfo deviceInfo) throws (1: exceptions.TalkException e)

  structs.RegisterWithPhoneNumberResult registerWithPhoneNumber(
    2: string sessionId,
    3: string migrationPincodeSessionId) throws (1: exceptions.TalkException e)

  structs.RegisterWithPhoneNumberResult registerWithPhoneNumberAndPassword(
    2: string sessionId,
    3: string keynm,
    4: string encrypted) throws (1: exceptions.TalkException e)

  string registerWithSnsIdAndIdentityCredential(
    2: enums.SnsIdType snsIdType,
    3: string snsAccessToken,
    4: structs.IdentityCredential identityCredential,
    5: string region,
    6: string udidHash,
    7: structs.DeviceInfo deviceInfo,
    8: string migrationPincodeSessionId) throws (1: exceptions.TalkException e)

  string reissueDeviceCredential() throws (1: exceptions.TalkException e)

  string reissueGroupTicket(
    1: string groupMid) throws (1: exceptions.TalkException e)

  string reissueUserTicket(
    3: i64 expirationTime,
    4: i32 maxUseCount) throws (1: exceptions.TalkException e)

  void rejectGroupInvitation(
    1: i32 reqSeq,
    2: string groupId) throws (1: exceptions.TalkException e)

  void releaseSession() throws (1: exceptions.TalkException e)

  void removeAllMessages(
    1: i32 seq,
    2: string lastMessageId) throws (1: exceptions.TalkException e)

  void removeBuddyLocation(
    2: string mid,
    3: i32 index) throws (1: exceptions.TalkException e)

  void removeChatRoomAnnouncement(
    1: i32 reqSeq,
    2: string chatRoomMid,
    3: i64 announcementSeq) throws (1: exceptions.TalkException e)

  void removeE2EEPublicKey(
    2: structs.E2EEPublicKey publicKey) throws (1: exceptions.TalkException e)

  void removeFriendRequest(
    1: enums.FriendRequestDirection direction,
    2: string midOrEMid) throws (1: exceptions.TalkException e)

  bool removeMessage(
    2: string messageId) throws (1: exceptions.TalkException e)

  bool removeMessageFromMyHome(
    2: string messageId) throws (1: exceptions.TalkException e)

  string removeSnsId(
    2: enums.SnsIdType snsIdType) throws (1: exceptions.TalkException e)

  void report(
    2: i64 syncOpRevision,
    3: enums.SyncCategory category,
    4: string report) throws (1: exceptions.TalkException e)

  void reportClientStatistics(
    1: i32 reqSeq,
    2: enums.ReportCategory category,
    3: i32 count) throws (1: exceptions.TalkException e)

  list<structs.ContactReportResult> reportContacts(
    2: i64 syncOpRevision,
    3: enums.SyncCategory category,
    4: list<structs.ContactReport> contactReports,
    5: enums.SyncActionType actionType) throws (1: exceptions.TalkException e)

  void reportGroups(
    2: i64 syncOpRevision,
    3: list<structs.Group> groups) throws (1: exceptions.TalkException e)

  void reportProfile(
    2: i64 syncOpRevision,
    3: structs.Profile profile) throws (1: exceptions.TalkException e)

  void reportRooms(
    2: i64 syncOpRevision,
    3: list<structs.Room> rooms) throws (1: exceptions.TalkException e)

  void reportSettings(
    2: i64 syncOpRevision,
    3: structs.Settings settings) throws (1: exceptions.TalkException e)

  void reportSpam(
    2: string chatMid,
    3: list<string> memberMids,
    4: list<enums.SpammerReason> spammerReasons,
    5: list<string> senderMids,
    6: list<string> spamMessageIds,
    7: list<string> spamMessages) throws (1: exceptions.TalkException e)

  void reportSpammer(
    2: string spammerMid,
    3: list<enums.SpammerReason> spammerReasons,
    4: list<string> spamMessageIds,
    5: list<string> spamMesages) throws (1: exceptions.TalkException e)

  void requestAccountPasswordReset(
    4: enums.IdentityProvider provider,
    2: string identifier,
    5: string locale) throws (1: exceptions.TalkException e)

  void requestE2EEKeyExchange(
    1: i32 reqSeq,
    2: binary temporalPublicKey,
    3: structs.E2EEPublicKey publicKey,
    4: binary verifier) throws (1: exceptions.TalkException e)

  structs.EmailConfirmationSession requestEmailConfirmation(
    2: structs.EmailConfirmation emailConfirmation) throws (1: exceptions.TalkException e)

  void requestIdentityUnbind(
    4: enums.IdentityProvider provider,
    2: string identifier) throws (1: exceptions.TalkException e)

  void requestResendMessage(
    1: i32 reqSeq,
    2: string senderMid,
    3: string messageId) throws (1: exceptions.TalkException e)

  structs.EmailConfirmationSession resendEmailConfirmation(
    2: string verifier) throws (1: exceptions.TalkException e)

  void resendPinCode(
    2: string sessionId) throws (1: exceptions.TalkException e)

  void resendPinCodeBySMS(
    2: string sessionId) throws (1: exceptions.TalkException e)

  void respondResendMessage(
    1: i32 reqSeq,
    2: string receiverMid,
    3: string originalMessageId,
    4: structs.Message resendMessage,
    5: enums.ErrorCode errorCode) throws (1: exceptions.TalkException e)

  void sendChatChecked(
    1: i32 seq,
    2: string consumer,
    3: string lastMessageId,
    4: i8 sessionId) throws (1: exceptions.TalkException e)

  void sendChatRemoved(
    1: i32 seq,
    2: string consumer,
    3: string lastMessageId,
    4: i8 sessiondId) throws (1: exceptions.TalkException e)

  map<string, string> sendContentPreviewUpdated(
    1: i32 esq,
    2: string messageId,
    3: list<string> receiverMids) throws (1: exceptions.TalkException e)

  void sendContentReceipt(
    1: i32 seq,
    2: string consumer,
    3: string messageId) throws (1: exceptions.TalkException e)

  void sendDummyPush() throws (1: exceptions.TalkException e)

  structs.Message sendEvent(
    1: i32 seq,
    2: structs.Message message) throws (1: exceptions.TalkException e)

  structs.Message sendMessage(
    1: i32 seq,
    2: structs.Message message) throws (1: exceptions.TalkException e)

  structs.CommitMessageResult sendMessageAwaitCommit(
    1: i32 seq,
    2: structs.Message message) throws (1: exceptions.TalkException e)

  void sendMessageIgnored(
    1: i32 seq,
    2: string consumer,
    3: list<string> messageIds) throws (1: exceptions.TalkException e)

  void sendMessageReceipt(
    1: i32 seq,
    2: string consumer,
    3: list<string> messageIds) throws (1: exceptions.TalkException e)

  structs.Message sendMessageToMyHome(
    1: i32 seq,
    2: structs.Message message) throws (1: exceptions.TalkException e)

  void setBuddyLocation(
    2: string mid,
    3: i32 index,
    4: structs.Geolocation location) throws (1: exceptions.TalkException e)

  void setIdentityCredential(
    2: string identifier,
    3: string verifier,
    4: enums.IdentityProvider provider) throws (1: exceptions.TalkException e)

  void setNotificationsEnabled(
    1: i32 reqSeq,
    2: enums.MIDType type,
    3: string target,
    4: bool enablement) throws (1: exceptions.TalkException e)

  structs.VerificationSessionData startUpdateVerification(
    2: string region,
    3: enums.CarrierCode carrier,
    4: string phone,
    5: string udidHash,
    6: structs.DeviceInfo deviceInfo,
    7: string networkCode,
    8: string locale,
    9: structs.SIMInfo simInfo) throws (1: exceptions.TalkException e)

  structs.VerificationSessionData startVerification(
    2: string region,
    3: enums.CarrierCode carrier,
    4: string phone,
    5: string udidHash,
    6: structs.DeviceInfo deviceInfo,
    7: string networkCode,
    8: string mid,
    9: string locale,
    10: structs.SIMInfo simInfo,
    11: string oldUdidHash) throws (1: exceptions.TalkException e)

  void storeUpdateProfileAttribute(
    1: i32 seq,
    2: enums.ProfileAttribute profileAttribute,
    3: string value) throws (1: exceptions.TalkException e)

  list<structs.SnsFriendContactRegistration> syncContactBySnsIds(
    1: i32 reqSeq,
    2: list<structs.SnsFriendModification> modifications) throws (1: exceptions.TalkException e)

  map<string, structs.ContactRegistration> syncContacts(
    1: i32 reqSeq,
    2: list<structs.ContactModification> localContacts) throws (1: exceptions.TalkException e)

  void tryFriendRequest(
    1: string midOrEMid,
    2: enums.FriendRequestMethod method,
    3: string friendRequestParams) throws (1: exceptions.TalkException e)

  structs.Message trySendMessage(
    1: i32 seq,
    2: structs.Message message) throws (1: exceptions.TalkException e)

  void unblockContact(
    1: i32 reqSeq,
    2: string id,
    3: string reference) throws (1: exceptions.TalkException e)

  void unblockRecommendation(
    1: i32 reqSeq,
    2: string id) throws (1: exceptions.TalkException e)

  string unregisterUserAndDevice() throws (1: exceptions.TalkException e)

  void unsendMessage(
    1: i32 seq,
    2: string messageId) throws (1: exceptions.TalkException e)

  void updateApnsDeviceToken(
    2: binary apnsDeviceToken) throws (1: exceptions.TalkException e)

  void updateBuddySetting(
    2: string key,
    3: string value) throws (1: exceptions.TalkException e)

  void updateC2DMRegistrationId(
    2: string registrationId) throws (1: exceptions.TalkException e)

  void updateContactSetting(
    1: i32 reqSeq,
    2: string mid,
    3: enums.ContactSetting flag,
    4: string value) throws (1: exceptions.TalkException e)

  void updateCustomModeSettings(
    2: enums.CustomMode customMode,
    3: map<string, string> paramMap) throws (1: exceptions.TalkException e)

  void updateDeviceInfo(
    2: string deviceUid,
    3: structs.DeviceInfo deviceInfo) throws (1: exceptions.TalkException e)

  void updateGroup(
    1: i32 reqSeq,
    2: structs.Group group) throws (1: exceptions.TalkException e)

  void updateGroupPreferenceAttribute(
    1: i32 reqSeq,
    2: string groupMid,
    3: map<enums.GroupPreferenceAttribute, string> updatedAttrs) throws (1: exceptions.TalkException e)

  void updateNotificationToken(
    3: enums.NotificationType type,
    2: string token) throws (1: exceptions.TalkException e)

  void updateNotificationTokenWithBytes(
    3: enums.NotificationType type,
    2: binary token) throws (1: exceptions.TalkException e)

  void updateProfile(
    1: i32 reqSeq,
    2: structs.Profile profile) throws (1: exceptions.TalkException e)

  void updateProfileAttribute(
    1: i32 reqSeq,
    2: enums.ProfileAttribute attr,
    3: string value) throws (1: exceptions.TalkException e)

  void updateRegion(
    2: string region) throws (1: exceptions.TalkException e)

  void updateSettings(
    1: i32 reqSeq,
    2: structs.Settings settings) throws (1: exceptions.TalkException e)

  i32 updateSettings2(
    1: i32 reqSeq,
    2: structs.Settings settings) throws (1: exceptions.TalkException e)

  void updateSettingsAttribute(
    1: i32 reqSeq,
    2: enums.SettingsAttribute attr,
    3: string value) throws (1: exceptions.TalkException e)

  i32 updateSettingsAttributes(
    1: i32 reqSeq,
    2: i32 attrBitset,
    3: structs.Settings settings) throws (1: exceptions.TalkException e)

  set<enums.SettingsAttribute2> updateSettingsAttributes2(
    1: i32 reqSeq,
    3: structs.Settings settings,
    4: set<enums.SettingsAttribute2> attrBitsetEx) throws (1: exceptions.TalkException e)

  void updateExtendedProfileAttribute(
    1: i32 reqSeq,
    2: enums.ExtendedProfileAttribute attr,
    3: structs.ExtendedProfile extendedProfile) throws (1: exceptions.TalkException e)

  map<string, string> validateContactsOnBot(
    2: list<string> contacts) throws (1: exceptions.TalkException e)

  void verifyIdentityCredential(
    8: enums.IdentityProvider identityProvider,
    3: string identifier,
    4: string password) throws (1: exceptions.TalkException e)

  structs.UserAuthStatus verifyIdentityCredentialWithResult(
    2: structs.IdentityCredential identityCredential,
    3: string migrationPincodeSessionId) throws (1: exceptions.TalkException e)

  enums.VerificationResult verifyPhone(
    2: string sessionId,
    3: string pinCode,
    4: string udidHash) throws (1: exceptions.TalkException e)

  structs.PhoneVerificationResult verifyPhoneNumber(
    2: string sessionId,
    3: string pinCode,
    4: string udidHash,
    5: string migrationPincodeSessionId,
    6: string oldUdidHash) throws (1: exceptions.TalkException e)

  string verifyPhoneNumberForLogin(
    2: string verifierFromPhone,
    3: string pinCodeForPhone,
    4: string verifierFromLogin) throws (1: exceptions.TalkException e)

  string verifyQrcode(
    2: string verifier,
    3: string pinCode) throws (1: exceptions.TalkException e)

}