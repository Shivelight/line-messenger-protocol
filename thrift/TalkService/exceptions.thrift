include "enums.thrift"
include "structs.thrift"

namespace py LineThrift.talk.exceptions

exception TalkException {
  1: enums.ErrorCode code
  2: string reason
  3: map<string, string> parameterMap
}

exception ShouldSyncException {
  1: i64 syncOpRevision
  2: structs.SyncScope syncScope
  3: enums.SyncTriggerReason syncReason
  4: string message
}

