include "enums.thrift"
include "structs.thrift"
include "exceptions.thrift"

namespace cpp LineThrift.squarebot
namespace py LineThrift.squarebot
namespace go LineThrift.squarebot

service SquareBotService {
	structs.GetSquareBotResponse getSquareBot(
		1: structs.GetSquareBotRequest req) throws (1: exceptions.BotException e)
}