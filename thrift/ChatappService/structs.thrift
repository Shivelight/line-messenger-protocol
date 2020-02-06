include "enums.thrift"

namespace py LineThrift.chatapp.structs

struct Chatapp {
  1: string chatappId
  2: string name
  3: string icon
  4: string url
  5: list<enums.ChatType> availableChatTypes
}

struct GetChatappResponse {
  1: Chatapp app
}

struct GetChatappRequest {
  1: string chatappId
  2: string language
}

struct MyChatapp {
  1: Chatapp app
  2: enums.MyChatappCategory category
  3: i64 priority
}

struct GetMyChatappsResponse {
  1: list<MyChatapp> apps
  2: string continuationToken
}

struct GetMyChatappsRequest {
  1: string language
  2: string continuationToken
}

