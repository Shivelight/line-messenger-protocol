include "enums.thrift"
include "structs.thrift"
include "../Common/_enums.thrift"
include "../Common/_structs.thrift"
include "../Common/_exceptions.thrift"

namespace py LineThrift.call
namespace go LineThrift.call

service CallService {

  structs.GroupCallRoute acquireGroupCallRoute(
    2: string chatMid,
    3: enums.MediaType mediaType,
    4: bool isInitialHost,
    5: list<string> capabilities) throws (1: _exceptions.TalkException e)

  list<structs.PaidCallCurrencyExchangeRate> acquirePaidCallCurrencyExchangeRate(
    2: string language) throws (1: _exceptions.TalkException e)

  structs.PaidCallResponse acquirePaidCallRoute(
    2: enums.PaidCallType paidCallType,
    3: string dialedNumber,
    4: string language,
    5: string networkCode,
    6: bool disableCallerId,
    7: string referer,
    8: string adSessionId) throws (1: _exceptions.TalkException e)

  _structs.ContactTransition addBuddyToContact(
    1: string buddyMid) throws (1: _exceptions.TalkException e)

  void addOperationForChannel(
    1: _enums.OpType opType,
    2: string param1,
    3: string param2,
    4: string param3) throws (1: _exceptions.TalkException e)

  _structs.Room createRoomWithBuddy(
    1: i32 reqSeq,
    2: string buddyMid,
    3: list<string> contactIds) throws (1: _exceptions.TalkException e)

  i64 displayBuddySubscriberCount() throws (1: _exceptions.TalkException e)

  map<string, i64> displayBuddySubscriberCountInBulk(
    1: list<string> mids) throws (1: _exceptions.TalkException e)

  _structs.Contact findContactByUseridWithoutAbuseBlockForChannel(
    2: string userid) throws (1: _exceptions.TalkException e)

  list<string> getAllContactIdsForChannel() throws (1: _exceptions.TalkException e)

  list<_structs.SimpleChannelContact> getAllSimpleChannelContacts(
    1: bool statusSticonFallbackDisabled) throws (1: _exceptions.TalkException e)

  list<_structs.CoinProductItem> getCallCreditProducts(
    2: _enums.PaymentType appStoreCode,
    3: _enums.PaymentPgType pgCode,
    4: string country,
    5: string language) throws (1: _exceptions.TalkException e)

  _structs.CoinHistoryResult getCallCreditPurchaseHistory(
    2: _structs.CoinHistoryCondition request) throws (1: _exceptions.TalkException e)

  list<_structs.CompactContact> getCompactContacts(
    2: i64 lastModifiedTimestamp) throws (1: _exceptions.TalkException e)

  list<_structs.Contact> getContactsForChannel(
    2: list<string> ids) throws (1: _exceptions.TalkException e)

  string getDisplayName(
    2: string mid) throws (1: _exceptions.TalkException e)

  _structs.ExtendedProfile getExtendedProfile() throws (1: _exceptions.TalkException e)

  list<string> getFavoriteGroupIdsForChannel() throws (1: _exceptions.TalkException e)

  list<string> getFavoriteMidsForChannel() throws (1: _exceptions.TalkException e)

  list<string> getFriendMids() throws (1: _exceptions.TalkException e)

  structs.GroupCall getGroupCall(
    2: string chatMid) throws (1: _exceptions.TalkException e)

  list<string> getGroupMemberMids(
    1: string groupId) throws (1: _exceptions.TalkException e)

  list<string> getGroupMemberMidsForAppPlatform(
    1: string groupId) throws (1: _exceptions.TalkException e)

  list<_structs.Group> getGroupsForChannel(
    1: list<string> groupIds) throws (1: _exceptions.TalkException e)

  _structs.IdentityCredential getIdentityCredential() throws (1: _exceptions.TalkException e)

  list<string> getJoinedGroupIdsForChannel() throws (1: _exceptions.TalkException e)

  _structs.MetaProfile getMetaProfile() throws (1: _exceptions.TalkException e)

  string getMid() throws (1: _exceptions.TalkException e)

  list<string> getOAFriendMids() throws (1: _exceptions.TalkException e)

  structs.PaidCallAdResult getPaidCallAdStatus() throws (1: _exceptions.TalkException e)

  list<structs.PaidCallBalance> getPaidCallBalanceList(
    2: string language) throws (1: _exceptions.TalkException e)

  structs.PaidCallHistoryResult getPaidCallHistory(
    2: i64 start,
    3: i32 size,
    4: string language) throws (1: _exceptions.TalkException e)

  structs.PaidCallMetadataResult getPaidCallMetadata(
    2: string language) throws (1: _exceptions.TalkException e)

  map<enums.PersonalInfo, string> getPersonalInfos(
    1: set<enums.PersonalInfo> requiredPersonalInfos) throws (1: _exceptions.TalkException e)

  structs.PhoneInfoForChannel getPhoneInfoFromPhoneNumber(
    1: string region,
    2: string phoneNumber) throws (1: _exceptions.TalkException e)

  map<string, string> getPreferredDisplayName(
    1: list<string> mids) throws (1: _exceptions.TalkException e)

  _structs.SimpleChannelClient getPrimaryClientForChannel() throws (1: _exceptions.TalkException e)

  list<_structs.SimpleChannelClient> getPrimaryClientsForChannel(
    1: list<string> userMids) throws (1: _exceptions.TalkException e)

  _structs.Profile getProfileForChannel() throws (1: _exceptions.TalkException e)

  map<string, _structs.CompactContact> getReverseCompactContacts(
    1: list<string> ids) throws (1: _exceptions.TalkException e)

  _structs.Room getRoomInformation(
    1: string roomMid) throws (1: _exceptions.TalkException e)

  list<string> getRoomMemberMidsForAppPlatform(
    1: string roomId) throws (1: _exceptions.TalkException e)

  list<_structs.SimpleChannelContact> getSimpleChannelContacts(
    1: list<string> ids,
    2: bool statusSticonFallbackDisabled) throws (1: _exceptions.TalkException e)

  string getUserCountryForBilling(
    2: string country,
    3: string remoteIp) throws (1: _exceptions.TalkException e)

  i64 getUserCreateTime() throws (1: _exceptions.TalkException e)

  map<_enums.RegistrationType, string> getUserIdentities() throws (1: _exceptions.TalkException e)

  string getUserLanguage() throws (1: _exceptions.TalkException e)

  i64 getUserLastSentMessageTimeStamp(
    1: string mid) throws (1: _exceptions.TalkException e)

  list<string> getUserMidsWhoAddedMe() throws (1: _exceptions.TalkException e)

  enums.UserStatus getUserStatus(
    1: string mid) throws (1: _exceptions.TalkException e)

  list<structs.UserTicketResponse> getUserTickets(
    1: list<string> userMids) throws (1: _exceptions.TalkException e)

  void inviteIntoGroupCall(
    2: string chatMid,
    3: list<string> memberMids,
    4: enums.MediaType mediaType) throws (1: _exceptions.TalkException e)

  bool isAllowSecondaryDeviceLogin() throws (1: _exceptions.TalkException e)

  bool isGroupMember(
    1: string groupId) throws (1: _exceptions.TalkException e)

  bool isInContact(
    2: string mid) throws (1: _exceptions.TalkException e)

  bool isRoomMember(
    1: string roomId) throws (1: _exceptions.TalkException e)

  list<_structs.SimpleChannelContact> lookupGroupMembers(
    1: string groupId,
    2: list<string> mids) throws (1: _exceptions.TalkException e)

  structs.PaidCallResponse lookupPaidCall(
    2: string dialedNumber,
    3: string language,
    4: string referer) throws (1: _exceptions.TalkException e)

  list<_structs.SimpleChannelContact> lookupRoomMembers(
    1: string roomId,
    2: list<string> mids) throws (1: _exceptions.TalkException e)

  structs.PaidCallDialing markPaidCallAd(
    2: string dialedNumber,
    3: string language,
    4: bool disableCallerId) throws (1: _exceptions.TalkException e)

  void notifyNotiCenterEvent(
    1: structs.NotiCenterEventData event) throws (1: _exceptions.TalkException e)

  structs.PaidCallRedeemResult redeemPaidCallVoucher(
    2: string serial,
    3: string language) throws (1: _exceptions.TalkException e)

  string registerChannelCP(
    2: string cpId,
    3: string registerPassword) throws (1: _exceptions.TalkException e)

  _structs.PaymentReservationResult reserveCallCreditPurchase(
    2: _structs.CoinPurchaseReservation request) throws (1: _exceptions.TalkException e)

  list<structs.PaidCallUserRate> searchPaidCallUserRate(
    2: string countryCode,
    3: string language) throws (1: _exceptions.TalkException e)

  _structs.Message sendMessageForChannel(
    2: _structs.Message message) throws (1: _exceptions.TalkException e)

  _structs.Message sendMessageWithoutRelationship(
    2: _structs.Message message) throws (1: _exceptions.TalkException e)

  void sendPinCodeOperation(
    1: string verifier) throws (1: _exceptions.TalkException e)

  _structs.Message sendSystemOAMessage(
    1: _structs.Message message) throws (1: _exceptions.TalkException e)

  void updateExtendedProfileAttribute(
    1: _enums.ExtendedProfileAttribute attr,
    2: _structs.ExtendedProfile extendedProfile) throws (1: _exceptions.TalkException e)

  void updateProfileAttributeForChannel(
    2: _enums.ProfileAttribute profileAttribute,
    3: string value) throws (1: _exceptions.TalkException e)

}