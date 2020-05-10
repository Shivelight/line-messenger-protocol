include "enums.thrift"
include "../Common/enumsC.thrift"
include "../Common/structsC.thrift"

namespace py LineThrift.message.structs
namespace go LineThrift.message.structs

struct MessageOperation {
  1: i64 revision
  2: i64 createdTime
  3: enums.MessageOperationType type
  4: i32 reqSeq
  5: enumsC.OpStatus status
  10: string param1
  11: string param2
  12: string param3
  20: structsC.Message message
}

struct MessageOperations {
  1: list<MessageOperation> operations
  2: bool endFlag
}

struct LastReadMessageId {
  1: string mid
  2: string lastReadMessageId
}

struct LastReadMessageIds {
  1: string chatId
  2: list<LastReadMessageId> lastReadMessageIds
}

