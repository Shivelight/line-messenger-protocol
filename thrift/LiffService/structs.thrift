include "enums.thrift"

namespace py LineThrift.liff.structs

struct LiffView {
  1: string type
  2: string url
  6: string titleIconUrl
  3: string titleText
  4: i32 titleTextColor
  7: i32 titleSubtextColor
  8: i32 titleButtonColor
  5: i32 titleBackgroundColor
  9: i32 progressBarColor
  10: i32 progressBackgroundColor
}

struct LiffViewResponse {
  1: LiffView view
  2: string contextToken
  3: string accessToken
  4: string featureToken
  5: list<enums.LiffViewFeature> features
}

struct LiffNoneContext {
  
}

struct LiffChatContext {
  1: string chatMid
}

struct LiffSquareChatContext {
  1: string squareChatMid
}

struct LiffContext {
  1: LiffNoneContext none
  2: LiffChatContext chat
  3: LiffSquareChatContext squareChat
}

struct LiffViewRequest {
  1: string liftId
  2: LiffContext context
}

struct LiffErrorConsentRequired {
  1: string channelId
}

struct LiffErrorPayload {
  3: LiffErrorConsentRequired consentRequired
}

struct RevokeTokenRequest {
  1: string accessToken
}

