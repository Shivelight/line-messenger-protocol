include "enums.thrift"
include "../Common/enumsC.thrift"
include "../Common/structsC.thrift"

namespace py LineThrift.buddymanagement.structs
namespace go LineThrift.buddymanagement.structs

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

struct BuddyProfile {
  1: string buddyId
  2: string mid
  3: string searchId
  4: string displayName
  5: string statusMessage
  11: i64 contactCount
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

struct BuddyMessageRequest {
  1: enumsC.ContentType contentType
  2: string text
  3: structsC.Location location
  4: binary content
  5: map<string, string> contentMetadata
}

