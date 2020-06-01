namespace py LineThrift.squarebot.structs
namespace go LineThrift.squarebotservice

struct SquareBot {
	1: string botMid
	2: bool active
	3: string displayName
	4: string profileImageObsHash
	5: i32 iconType
	6: i64 lastModifiedAt
	7: i64 expiredIn
}

struct GetSquareBotRequest {
	1: string botMid
}
struct GetSquareBotResponse {
	1: SquareBot squareBot
}
