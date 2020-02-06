include "enums.thrift"

namespace py LineThrift.agecheck.structs

struct AgeCheckDocomoResult {
  1: string authUrl
  2: enums.UserAgeType userAgeType
}

struct AgeCheckRequestResult {
  1: string authUrl
  2: string sessionId
}

