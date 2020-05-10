include "../Common/_enums.thrift"
include "../Common/_structs.thrift"
include "../Common/_exceptions.thrift"

namespace py LineThrift.channelapplicationprovided
namespace go LineThrift.channelapplicationprovided

service ChannelApplicationProvidedService {

  i64 activeBuddySubscriberCount() throws (1: _exceptions.TalkException e)

  void addOperationForChannel(
    1: _enums.OpType opType,
    2: string param1,
    3: string param2,
    4: string param3) throws (1: _exceptions.TalkException e)

  i64 displayBuddySubscriberCount() throws (1: _exceptions.TalkException e)

  _structs.Contact findContactByUseridWithoutAbuseBlockForChannel(
    2: string userid) throws (1: _exceptions.TalkException e)

  list<string> getAllContactIdsForChannel() throws (1: _exceptions.TalkException e)

  list<_structs.CompactContact> getCompactContacts(
    2: i64 lastModifiedTimestamp) throws (1: _exceptions.TalkException e)

  list<_structs.Contact> getContactsForChannel(
    2: list<string> ids) throws (1: _exceptions.TalkException e)

  string getDisplayName(
    2: string mid) throws (1: _exceptions.TalkException e)

  list<string> getFavoriteMidsForChannel() throws (1: _exceptions.TalkException e)

  list<string> getFriendMids() throws (1: _exceptions.TalkException e)

  list<string> getGroupMemberMids(
    1: string groupId) throws (1: _exceptions.TalkException e)

  list<_structs.Group> getGroupsForChannel(
    1: list<string> groupIds) throws (1: _exceptions.TalkException e)

  _structs.IdentityCredential getIdentityCredential() throws (1: _exceptions.TalkException e)

  list<string> getJoinedGroupIdsForChannel() throws (1: _exceptions.TalkException e)

  _structs.MetaProfile getMetaProfile() throws (1: _exceptions.TalkException e)

  string getMid() throws (1: _exceptions.TalkException e)

  _structs.SimpleChannelClient getPrimaryClientForChannel() throws (1: _exceptions.TalkException e)

  _structs.Profile getProfileForChannel() throws (1: _exceptions.TalkException e)

  list<_structs.SimpleChannelContact> getSimpleChannelContacts(
    1: list<string> ids) throws (1: _exceptions.TalkException e)

  string getUserCountryForBilling(
    2: string country,
    3: string remoteIp) throws (1: _exceptions.TalkException e)

  i64 getUserCreateTime() throws (1: _exceptions.TalkException e)

  map<_enums.RegistrationType, string> getUserIdentities() throws (1: _exceptions.TalkException e)

  string getUserLanguage() throws (1: _exceptions.TalkException e)

  list<string> getUserMidsWhoAddedMe() throws (1: _exceptions.TalkException e)

  bool isGroupMember(
    1: string groupId) throws (1: _exceptions.TalkException e)

  bool isInContact(
    2: string mid) throws (1: _exceptions.TalkException e)

  string registerChannelCP(
    2: string cpId,
    3: string registerPassword) throws (1: _exceptions.TalkException e)

  void removeNotificationStatus(
    2: _enums.NotificationStatus notificationStatus) throws (1: _exceptions.TalkException e)

  _structs.Message sendMessageForChannel(
    2: _structs.Message message) throws (1: _exceptions.TalkException e)

  void sendPinCodeOperation(
    1: string verifier) throws (1: _exceptions.TalkException e)

  void updateProfileAttributeForChannel(
    2: _enums.ProfileAttribute profileAttribute,
    3: string value) throws (1: _exceptions.TalkException e)

}