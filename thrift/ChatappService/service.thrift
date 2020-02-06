include "enums.thrift"
include "structs.thrift"
include "exceptions.thrift"

namespace py LineThrift.chatapp

service ChatappService {

  structs.GetChatappResponse getChatapp(
    1: structs.GetChatappRequest request) throws (1: exceptions.ChatappException e)

  structs.GetMyChatappsResponse getMyChatapps(
    1: structs.GetMyChatappsRequest request) throws (1: exceptions.ChatappException e)

}