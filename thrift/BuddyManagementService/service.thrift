include "enums.thrift"
include "structs.thrift"
include "exceptions.thrift"

namespace py LineThrift.buddymanagement
namespace go LineThrift.buddymanagement

service BuddyManagementService {

  void addBuddyMember(
    1: string requestId,
    2: string userMid) throws (1: exceptions.TalkException e)

  void addBuddyMembers(
    1: string requestId,
    2: list<string> userMids) throws (1: exceptions.TalkException e)

  void blockBuddyMember(
    1: string requestId,
    2: string mid) throws (1: exceptions.TalkException e)

  list<structs.SendBuddyMessageResult> commitSendMessagesToAll(
    1: list<string> requestIdList) throws (1: exceptions.TalkException e)

  list<structs.SendBuddyMessageResult> commitSendMessagesToMids(
    1: list<string> requestIdList,
    2: list<string> mids) throws (1: exceptions.TalkException e)

  bool containsBuddyMember(
    1: string requestId,
    2: string userMid) throws (1: exceptions.TalkException e)

  binary downloadMessageContent(
    1: string requestId,
    2: string messageId) throws (1: exceptions.TalkException e)

  binary downloadMessageContentPreview(
    1: string requestId,
    2: string messageId) throws (1: exceptions.TalkException e)

  binary downloadProfileImage(
    1: string requestId) throws (1: exceptions.TalkException e)

  binary downloadProfileImagePreview(
    1: string requestId) throws (1: exceptions.TalkException e)

  i64 getActiveMemberCountByBuddyMid(
    2: string buddyMid) throws (1: exceptions.TalkException e)

  list<string> getActiveMemberMidsByBuddyMid(
    2: string buddyMid) throws (1: exceptions.TalkException e)

  list<string> getAllBuddyMembers() throws (1: exceptions.TalkException e)

  list<string> getBlockedBuddyMembers() throws (1: exceptions.TalkException e)

  i64 getBlockerCountByBuddyMid(
    2: string buddyMid) throws (1: exceptions.TalkException e)

  structs.BuddyDetail getBuddyDetailByMid(
    2: string buddyMid) throws (1: exceptions.TalkException e)

  structs.BuddyProfile getBuddyProfile() throws (1: exceptions.TalkException e)

  structs.Ticket getContactTicket() throws (1: exceptions.TalkException e)

  i64 getMemberCountByBuddyMid(
    2: string buddyMid) throws (1: exceptions.TalkException e)

  structs.SendBuddyMessageResult getSendBuddyMessageResult(
    1: string sendBuddyMessageRequestId) throws (1: exceptions.TalkException e)

  structs.SetBuddyOnAirResult getSetBuddyOnAirResult(
    1: string setBuddyOnAirRequestId) throws (1: exceptions.TalkException e)

  structs.UpdateBuddyProfileResult getUpdateBuddyProfileResult(
    1: string updateBuddyProfileRequestId) throws (1: exceptions.TalkException e)

  bool isBuddyOnAirByMid(
    2: string buddyMid) throws (1: exceptions.TalkException e)

  string linkAndSendBuddyContentMessageToAllAsync(
    1: string requestId,
    2: structs.Message msg,
    3: string sourceContentId) throws (1: exceptions.TalkException e)

  structs.SendBuddyMessageResult linkAndSendBuddyContentMessageToMids(
    1: string requestId,
    2: structs.Message msg,
    3: string sourceContentId,
    4: list<string> mids) throws (1: exceptions.TalkException e)

  void notifyBuddyBlocked(
    1: string buddyMid,
    2: string blockerMid) throws (1: exceptions.TalkException e)

  void notifyBuddyUnblocked(
    1: string buddyMid,
    2: string blockerMid) throws (1: exceptions.TalkException e)

  string registerBuddy(
    2: string buddyId,
    3: string searchId,
    4: string displayName,
    5: string statusMeessage,
    6: binary picture,
    7: map<string, string> settings) throws (1: exceptions.TalkException e)

  string registerBuddyAdmin(
    2: string buddyId,
    3: string searchId,
    4: string displayName,
    5: string statusMessage,
    6: binary picture) throws (1: exceptions.TalkException e)

  string reissueContactTicket(
    3: i64 expirationTime,
    4: i32 maxUseCount) throws (1: exceptions.TalkException e)

  void removeBuddyMember(
    1: string requestId,
    2: string userMid) throws (1: exceptions.TalkException e)

  void removeBuddyMembers(
    1: string requestId,
    2: list<string> userMids) throws (1: exceptions.TalkException e)

  structs.SendBuddyMessageResult sendBuddyContentMessageToAll(
    1: string requestId,
    2: structs.Message msg,
    3: binary content) throws (1: exceptions.TalkException e)

  string sendBuddyContentMessageToAllAsync(
    1: string requestId,
    2: structs.Message msg,
    3: binary content) throws (1: exceptions.TalkException e)

  structs.SendBuddyMessageResult sendBuddyContentMessageToMids(
    1: string requestId,
    2: structs.Message msg,
    3: binary content,
    4: list<string> mids) throws (1: exceptions.TalkException e)

  string sendBuddyContentMessageToMidsAsync(
    1: string requestId,
    2: structs.Message msg,
    3: binary content,
    4: list<string> mids) throws (1: exceptions.TalkException e)

  structs.SendBuddyMessageResult sendBuddyMessageToAll(
    1: string requestId,
    2: structs.Message msg) throws (1: exceptions.TalkException e)

  string sendBuddyMessageToAllAsync(
    1: string requestId,
    2: structs.Message msg) throws (1: exceptions.TalkException e)

  structs.SendBuddyMessageResult sendBuddyMessageToMids(
    1: string requestId,
    2: structs.Message msg,
    3: list<string> mids) throws (1: exceptions.TalkException e)

  string sendBuddyMessageToMidsAsync(
    1: string requestId,
    2: structs.Message msg,
    3: list<string> mids) throws (1: exceptions.TalkException e)

  void sendIndividualEventToAllAsync(
    1: string requestId,
    2: string buddyMid,
    3: enums.NotificationStatus notificationStatus) throws (1: exceptions.TalkException e)

  structs.SetBuddyOnAirResult setBuddyOnAir(
    1: string requestId,
    2: bool onAir) throws (1: exceptions.TalkException e)

  string setBuddyOnAirAsync(
    1: string requestId,
    2: bool onAir) throws (1: exceptions.TalkException e)

  structs.SendBuddyMessageResult storeMessage(
    1: string requestId,
    2: structs.BuddyMessageRequest messageRequest) throws (1: exceptions.TalkException e)

  void unblockBuddyMember(
    1: string requestId,
    2: string mid) throws (1: exceptions.TalkException e)

  void unregisterBuddy(
    1: string requestId) throws (1: exceptions.TalkException e)

  void unregisterBuddyAdmin(
    1: string requestId) throws (1: exceptions.TalkException e)

  void updateBuddyAdminProfileAttribute(
    1: string requestId,
    2: map<string, string> attributes) throws (1: exceptions.TalkException e)

  void updateBuddyAdminProfileImage(
    1: string requestId,
    2: binary picture) throws (1: exceptions.TalkException e)

  structs.UpdateBuddyProfileResult updateBuddyProfileAttributes(
    1: string requestId,
    2: map<string, string> attributes) throws (1: exceptions.TalkException e)

  string updateBuddyProfileAttributesAsync(
    1: string requestId,
    2: map<string, string> attributes) throws (1: exceptions.TalkException e)

  structs.UpdateBuddyProfileResult updateBuddyProfileImage(
    1: string requestId,
    2: binary image) throws (1: exceptions.TalkException e)

  string updateBuddyProfileImageAsync(
    1: string requestId,
    2: binary image) throws (1: exceptions.TalkException e)

  void updateBuddySearchId(
    1: string requestId,
    2: string searchId) throws (1: exceptions.TalkException e)

  void updateBuddySettings(
    2: map<string, string> settings) throws (1: exceptions.TalkException e)

  string uploadBuddyContent(
    2: enums.ContentType contentType,
    3: binary content) throws (1: exceptions.TalkException e)

}