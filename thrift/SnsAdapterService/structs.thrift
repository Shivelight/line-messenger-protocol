include "../Common/_enums.thrift"
include "../Common/_structs.thrift"

namespace py LineThrift.snsadapter.structs
namespace go LineThrift.snsadapter.structs

struct SnsFriends {
  1: list<_structs.SnsFriend> snsFriends
  2: bool hasMore
}

struct SnsProfile {
  1: string snsUserId
  2: string snsUserName
  3: string email
  4: string thumbnailUrl
}

