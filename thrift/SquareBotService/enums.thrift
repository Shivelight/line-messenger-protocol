namespace py LineThrift.squarebot.enums
namespace go LineThrift.squarebot.enums

enum BotErrorCode {
	UNKNOWN = 0
	BOT_NOT_FOUND = 1
	BOT_NOT_AVAILABLE = 2
	NOT_A_MEMBER = 3
	ILLEGAL_ARGUMENT = 400
	AUTHENTICATED_FAILED = 401
	INTERNAL_ERROR = 500
}
