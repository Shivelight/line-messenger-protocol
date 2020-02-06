include "enums.thrift"

namespace py LineThrift.buddymanagement.structs

struct SendBuddyMessageResult {
  1: string requestId
  2: enums.BuddyResultState state
  3: string messageId
  4: i32 eventNo
  11: i64 receiverCount
  12: i64 successCount
  13: i64 failCount
  14: i64 cancelCount
  15: i64 blockCount
  16: i64 unregisterCount
  21: i64 timestamp
  22: string message
}

struct BuddyDetail {
  1: string mid
  2: i64 memberCount
  3: bool onAir
  4: bool businessAccount
  5: bool addable
  6: set<enums.ContentType> acceptableContentTypes
  7: bool capableMyhome
  8: bool freePhoneCallable
  9: string phoneNumberToDial
  10: bool needPermissionApproval
  11: i32 channelId
  12: string channelProviderName
  13: i32 iconType
  14: enums.BotType botType
  15: bool showRichMenu
  16: i64 richMenuRevision
  17: enums.BuddyOnAirLabel onAirLabel
  27: i32 onAirVersion
  18: bool useTheme
  19: string themeId
  20: bool useBar
  21: i64 barRevision
  22: bool useBackground
  23: string backgroundId
  24: bool statusBarEnabled
  25: i64 statusBarRevision
  26: bool capableChat
}

struct BuddyProfile {
  1: string buddyId
  2: string mid
  3: string searchId
  4: string displayName
  5: string statusMessage
  11: i64 contactCount
}

struct Ticket {
  1: string id
  10: i64 expirationTime
  21: i32 maxUseCount
}

struct SetBuddyOnAirResult {
  1: string requestId
  2: enums.BuddyResultState state
  3: i32 eventNo
  11: i64 receiverCount
  12: i64 successCount
  13: i64 failCount
  14: i64 cancelCount
  15: i64 unregisterCount
  21: i64 timestamp
  22: string message
}

struct UpdateBuddyProfileResult {
  1: string requestId
  2: enums.BuddyResultState state
  3: i32 eventNo
  11: i64 receiverCount
  12: i64 successCount
  13: i64 failCount
  14: i64 cancelCount
  15: i64 unregisterCount
  21: i64 timestamp
  22: string message
}

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

struct BuddyMessageRequest {
  1: enums.ContentType contentType
  2: string text
  3: Location location
  4: binary content
  5: map<string, string> contentMetadata
}

