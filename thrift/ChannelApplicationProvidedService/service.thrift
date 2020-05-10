include "../Common/enumsC.thrift"
include "../Common/structsC.thrift"
include "../Common/exceptionsC.thrift"

namespace py LineThrift.channelapplicationprovided
namespace go LineThrift.channelapplicationprovided

service ChannelApplicationProvidedService {

  i64 activeBuddySubscriberCount() throws (1: exceptionsC.TalkException e)

  void addOperationForChannel(
    1: enumsC.OpType opType,
    2: string param1,
    3: string param2,
    4: string param3) throws (1: exceptionsC.TalkException e)

  i64 displayBuddySubscriberCount() throws (1: exceptionsC.TalkException e)

  structsC.Contact findContactByUseridWithoutAbuseBlockForChannel(
    2: string userid) throws (1: exceptionsC.TalkException e)

  list<string> getAllContactIdsForChannel() throws (1: exceptionsC.TalkException e)

  list<structsC.CompactContact> getCompactContacts(
    2: i64 lastModifiedTimestamp) throws (1: exceptionsC.TalkException e)

  list<structsC.Contact> getContactsForChannel(
    2: list<string> ids) throws (1: exceptionsC.TalkException e)

  string getDisplayName(
    2: string mid) throws (1: exceptionsC.TalkException e)

  list<string> getFavoriteMidsForChannel() throws (1: exceptionsC.TalkException e)

  list<string> getFriendMids() throws (1: exceptionsC.TalkException e)

  list<string> getGroupMemberMids(
    1: string groupId) throws (1: exceptionsC.TalkException e)

  list<structsC.Group> getGroupsForChannel(
    1: list<string> groupIds) throws (1: exceptionsC.TalkException e)

  structsC.IdentityCredential getIdentityCredential() throws (1: exceptionsC.TalkException e)

  list<string> getJoinedGroupIdsForChannel() throws (1: exceptionsC.TalkException e)

  structsC.MetaProfile getMetaProfile() throws (1: exceptionsC.TalkException e)

  string getMid() throws (1: exceptionsC.TalkException e)

  structsC.SimpleChannelClient getPrimaryClientForChannel() throws (1: exceptionsC.TalkException e)

  structsC.Profile getProfileForChannel() throws (1: exceptionsC.TalkException e)

  list<structsC.SimpleChannelContact> getSimpleChannelContacts(
    1: list<string> ids) throws (1: exceptionsC.TalkException e)

  string getUserCountryForBilling(
    2: string country,
    3: string remoteIp) throws (1: exceptionsC.TalkException e)

  i64 getUserCreateTime() throws (1: exceptionsC.TalkException e)

  map<enumsC.RegistrationType, string> getUserIdentities() throws (1: exceptionsC.TalkException e)

  string getUserLanguage() throws (1: exceptionsC.TalkException e)

  list<string> getUserMidsWhoAddedMe() throws (1: exceptionsC.TalkException e)

  bool isGroupMember(
    1: string groupId) throws (1: exceptionsC.TalkException e)

  bool isInContact(
    2: string mid) throws (1: exceptionsC.TalkException e)

  string registerChannelCP(
    2: string cpId,
    3: string registerPassword) throws (1: exceptionsC.TalkException e)

  void removeNotificationStatus(
    2: enumsC.NotificationStatus notificationStatus) throws (1: exceptionsC.TalkException e)

  structsC.Message sendMessageForChannel(
    2: structsC.Message message) throws (1: exceptionsC.TalkException e)

  void sendPinCodeOperation(
    1: string verifier) throws (1: exceptionsC.TalkException e)

  void updateProfileAttributeForChannel(
    2: enumsC.ProfileAttribute profileAttribute,
    3: string value) throws (1: exceptionsC.TalkException e)

}