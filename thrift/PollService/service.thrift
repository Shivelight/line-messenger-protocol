include "../Common/structsC.thrift"
include "../Common/exceptionsC.thrift"

namespace cpp LineThrift.poll
namespace py LineThrift.poll
namespace go LineThrift.poll

service PollService {

  list<structsC.Operation> fetchOperations(
    2: i64 localRev,
    3: i32 count) throws (1: exceptionsC.TalkException e)

  list<structsC.Operation> fetchOps(
    2: i64 localRev,
    3: i32 count,
    4: i64 globalRev,
    5: i64 individualRev) throws (1: exceptionsC.TalkException e, 2: exceptionsC.ShouldSyncException s)

}