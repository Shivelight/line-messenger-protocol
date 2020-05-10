include "enums.thrift"
include "structs.thrift"
include "../Common/_exceptions.thrift"

namespace py LineThrift.message
namespace go LineThrift.message

service MessageService {

  structs.MessageOperations fetchMessageOperations(
    2: i64 localRevision,
    3: i64 lastOpTimestamp,
    4: i32 count) throws (1: _exceptions.TalkException e)

  structs.LastReadMessageIds getLastReadMessageIds(
    2: string chatId) throws (1: _exceptions.TalkException e)

  list<structs.LastReadMessageIds> multiGetLastReadMessageIds(
    2: list<string> chatIds) throws (1: _exceptions.TalkException e)

}