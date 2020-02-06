include "enums.thrift"

namespace py LineThrift.universalnotification.structs

struct NotificationTarget {
  1: string applicationType
  2: string applicationVersion
  3: string region
}

struct GlobalEvent {
  1: string key
  2: list<NotificationTarget> targets
  3: i64 createdTime
  4: i64 data
  5: i32 maxDelay
}

