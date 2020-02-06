include "enums.thrift"

namespace py LineThrift.bot.structs

struct BotUseInfo {
  1: bool botUseAgreementAccepted
  2: bool botInFriends
  3: string primaryApplication
  4: string locale
}

