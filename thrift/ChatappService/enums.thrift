namespace py LineThrift.chatapp.enums
namespace go LineThrift.chatapp.enums

enum ChatType {
  PERSONAL = 1
  ROOM = 2
  GROUP = 3
  SQUARE_CHAT = 4
}

enum ChatappErrorCode {
  INVALID_REQUEST = 1
  UNAUTHORIZED = 2
  SERVER_ERROR = 100
}

enum MyChatappCategory {
  PRIORITY = 2
  REGULAR = 1
  MORE = 3
}

