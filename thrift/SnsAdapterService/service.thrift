include "enums.thrift"
include "structs.thrift"
include "exceptions.thrift"

namespace py LineThrift.snsadapter

service SnsAdapterService {

  structs.SnsFriends getSnsFriends(
    2: enums.SnsIdType snsIdType,
    3: string snsAccessToken,
    4: i32 startIdx,
    5: i32 limit) throws (1: exceptions.TalkException e)

  structs.SnsProfile getSnsMyProfile(
    2: enums.SnsIdType snsIdType,
    3: string snsAccessToken) throws (1: exceptions.TalkException e)

  void postSnsInvitationMessage(
    2: enums.SnsIdType snsIdType,
    3: string snsAccessToken,
    4: string toSnsUserId) throws (1: exceptions.TalkException e)

}