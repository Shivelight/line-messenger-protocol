include "structs.thrift"
include "../Common/_enums.thrift"
include "../Common/_exceptions.thrift"

namespace py LineThrift.snsadapter
namespace go LineThrift.snsadapter

service SnsAdapterService {

  structs.SnsFriends getSnsFriends(
    2: _enums.SnsIdType snsIdType,
    3: string snsAccessToken,
    4: i32 startIdx,
    5: i32 limit) throws (1: _exceptions.TalkException e)

  structs.SnsProfile getSnsMyProfile(
    2: _enums.SnsIdType snsIdType,
    3: string snsAccessToken) throws (1: _exceptions.TalkException e)

  void postSnsInvitationMessage(
    2: _enums.SnsIdType snsIdType,
    3: string snsAccessToken,
    4: string toSnsUserId) throws (1: _exceptions.TalkException e)

}