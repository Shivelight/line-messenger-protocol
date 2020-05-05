include "enums.thrift"

namespace py LineThrift.snsadapter.structs
namespace go LineThrift.snsadapter.structs

struct SnsFriend {
  1: string snsUserId
  2: string snsUserName
  3: enums.SnsIdType snsIdType
}

struct SnsFriends {
  1: list<SnsFriend> snsFriends
  2: bool hasMore
}

struct SnsProfile {
  1: string snsUserId
  2: string snsUserName
  3: string email
  4: string thumbnailUrl
}

