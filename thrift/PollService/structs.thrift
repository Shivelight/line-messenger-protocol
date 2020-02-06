include "enums.thrift"

namespace py LineThrift.poll.structs

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

struct Operation {
  1: i64 revision
  2: i64 createdTime
  3: enums.OpType type
  4: i32 reqSeq
  5: string checksum
  7: enums.OpStatus status
  10: string param1
  11: string param2
  12: string param3
  20: Message message
}

struct SyncParamMid {
  1: string mid
  2: enums.Diff diff
  3: i64 revision
}

struct SyncParamContact {
  1: SyncParamMid syncParamMid
  2: enums.ContactStatus contactStatus
}

struct SyncRelations {
  1: bool syncAll
  2: list<SyncParamContact> syncParamContact
  3: list<SyncParamMid> syncParamMid
}

struct SyncScope {
  1: bool syncProfile
  2: bool syncSettings
  3: bool syncSticker
  4: bool syncThemeShop
  10: SyncRelations contact
  11: SyncRelations group
  12: SyncRelations room
  13: SyncRelations chat
}

