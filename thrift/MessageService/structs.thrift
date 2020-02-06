include "enums.thrift"

namespace py LineThrift.message.structs

struct Location {
  1: string title
  2: string address
  3: double latitude
  4: double longitude
  5: string phone
}

struct Message {
  1: string from_
  2: string to
  3: enums.MIDType toType
  4: string id
  5: i64 createdTime
  6: i64 deliveredTime
  10: string text
  11: Location location
  14: bool hasContent
  15: enums.ContentType contentType
  17: binary contentPreview
  18: map<string, string> contentMetadata
  19: i8 sessionId
  20: list<binary> chunks
  21: string relatedMessageId
  22: enums.MessageRelationType messageRelationType
  23: i32 readCount
  24: enums.ServiceCode relatedMessageServiceCode
}

struct MessageOperation {
  1: i64 revision
  2: i64 createdTime
  3: enums.MessageOperationType type
  4: i32 reqSeq
  5: enums.OpStatus status
  10: string param1
  11: string param2
  12: string param3
  20: Message message
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

