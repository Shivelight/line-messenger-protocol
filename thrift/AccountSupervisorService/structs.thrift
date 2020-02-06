include "enums.thrift"

namespace py LineThrift.accountsupervisor.structs

struct RSAKey {
  1: string keynm
  2: string nvalue
  3: string evalue
  4: string sessionKey
}

