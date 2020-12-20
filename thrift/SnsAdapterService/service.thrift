include "structs.thrift"
include "../Common/enumsC.thrift"
include "../Common/exceptionsC.thrift"

namespace cpp LineThrift.snsadapter
namespace py LineThrift.snsadapter
namespace go LineThrift.snsadapter

service SnsAdapterService {

  structs.SnsFriends getSnsFriends(
    2: enumsC.SnsIdType snsIdType,
    3: string snsAccessToken,
    4: i32 startIdx,
    5: i32 limit) throws (1: exceptionsC.TalkException e)

  structs.SnsProfile getSnsMyProfile(
    2: enumsC.SnsIdType snsIdType,
    3: string snsAccessToken) throws (1: exceptionsC.TalkException e)

  void postSnsInvitationMessage(
    2: enumsC.SnsIdType snsIdType,
    3: string snsAccessToken,
    4: string toSnsUserId) throws (1: exceptionsC.TalkException e)

}