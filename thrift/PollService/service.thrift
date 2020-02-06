include "enums.thrift"
include "structs.thrift"
include "exceptions.thrift"

namespace py LineThrift.poll

service PollService {

  list<structs.Operation> fetchOperations(
    2: i64 localRev,
    3: i32 count) throws (1: exceptions.TalkException e)

  list<structs.Operation> fetchOps(
    2: i64 localRev,
    3: i32 count,
    4: i64 globalRev,
    5: i64 individualRev) throws (1: exceptions.TalkException e, 2: exceptions.ShouldSyncException s)

}