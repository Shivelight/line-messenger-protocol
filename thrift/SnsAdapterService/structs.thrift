include "../Common/enumsC.thrift"
include "../Common/structsC.thrift"

namespace py LineThrift.snsadapter.structs
namespace go LineThrift.snsadapter.structs

struct SnsFriends {
  1: list<structsC.SnsFriend> snsFriends
  2: bool hasMore
}

struct SnsProfile {
  1: string snsUserId
  2: string snsUserName
  3: string email
  4: string thumbnailUrl
}

