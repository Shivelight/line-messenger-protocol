include "_enums.thrift"
include "_structs.thrift"

namespace py LineThrift.common._exceptions
namespace go LineThrift.common._exceptions

exception TalkException {
  1: _enums.ErrorCode code
  2: string reason
  3: map<string, string> parameterMap
}

exception ShouldSyncException {
  1: i64 syncOpRevision
  2: _structs.SyncScope syncScope
  3: _enums.SyncTriggerReason syncReason
  4: string message
}

