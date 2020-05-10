include "structs.thrift"
include "../Common/_exceptions.thrift"

namespace py LineThrift.bot
namespace go LineThrift.bot

service BotService {

  structs.BotUseInfo getBotUseInfo(
    2: string botMid) throws (1: _exceptions.TalkException e)

  void notifyLeaveGroup(
    1: string groupMid) throws (1: _exceptions.TalkException e)

  void notifyLeaveRoom(
    1: string roomMid) throws (1: _exceptions.TalkException e)

  void sendChatCheckedByWatermark(
    1: i32 seq,
    2: string mid,
    3: i64 watermark,
    4: i8 sessionId) throws (1: _exceptions.TalkException e)

}