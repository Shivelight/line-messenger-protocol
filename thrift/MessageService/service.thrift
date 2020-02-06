include "enums.thrift"
include "structs.thrift"
include "exceptions.thrift"

namespace py LineThrift.message

service MessageService {

  structs.MessageOperations fetchMessageOperations(
    2: i64 localRevision,
    3: i64 lastOpTimestamp,
    4: i32 count) throws (1: exceptions.TalkException e)

  structs.LastReadMessageIds getLastReadMessageIds(
    2: string chatId) throws (1: exceptions.TalkException e)

  list<structs.LastReadMessageIds> multiGetLastReadMessageIds(
    2: list<string> chatIds) throws (1: exceptions.TalkException e)

}