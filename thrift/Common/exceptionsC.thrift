include "enumsC.thrift"
include "structsC.thrift"

namespace py LineThrift.common.exceptionsC
namespace go LineThrift.common.exceptionsC

exception TalkException {
  1: enumsC.ErrorCode code
  2: string reason
  3: map<string, string> parameterMap
}

exception ShouldSyncException {
  1: i64 syncOpRevision
  2: structsC.SyncScope syncScope
  3: enumsC.SyncTriggerReason syncReason
  4: string message
}

