namespace py LineThrift.message.enums
namespace go LineThrift.message.enums

enum MessageOperationType {
  SEND_MESSAGE = 1
  RECEIVE_MESSAGE = 2
  READ_MESSAGE = 3
  NOTIFIED_READ_MESSAGE = 4
  NOTIFIED_JOIN_CHAT = 5
  FAILED_SEND_MESSAGE = 6
  SEND_CONTENT = 7
  SEND_CONTENT_RECEIPT = 8
  SEND_CHAT_REMOVED = 9
  REMOVE_ALL_MESSAGES = 10
}
