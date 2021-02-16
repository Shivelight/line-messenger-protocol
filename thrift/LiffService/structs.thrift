include "enums.thrift"

namespace py LineThrift.liff.structs
namespace go LineThrift.liff.structs

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

/**
 * Updated: 2020-02-17 (Android 10.1.1)
 * Updated: 2021-02-08 (Android 10.11.1)
 */
struct LiffViewResponse {
  1: LiffView view
  2: string contextToken
  3: string accessToken
  4: string featureToken
  5: list<enums.LiffViewFeature> features
  6: string channelId
  7: string idToken
  8: list<string> scopes
  9: list<enums.LiffLaunchOption> launchOptions
  10: enums.LiffPermanentLinkPattern permanentLinkPattern
}

struct LiffNoneContext {
  
}

struct LiffChatContext {
  1: string chatMid
}

struct LiffSquareChatContext {
  1: string squareChatMid
}

/**
 * Updated: 2021-02-16
 *  - Optional
 */
struct LiffContext {
  1: optional LiffNoneContext none
  2: optional LiffChatContext chat
  3: optional LiffSquareChatContext squareChat
}

/**
 * Updated: 2020-02-17 (Android 10.1.1)
 */
struct LiffAdvertisingId {
  1: string advertisingId
  2: bool tracking
}

/**
 * Updated: 2020-02-17 (Android 10.1.1)
 */
struct LiffDeviceSetting {
  1: bool videoAutoPlayAllowed
  2: LiffAdvertisingId advertisingId
}

/**
 * Updated: 2020-02-17 (Android 10.1.1)
 */
struct LiffViewRequest {
  1: string liffId
  2: LiffContext context
  3: string lang
  4: LiffDeviceSetting deviceSetting
}

/**
 * Updated: 2020-02-17 (Android 10.1.1)
 */
struct LiffErrorConsentRequired {
  1: string channelId
  2: string consentUrl
}

struct LiffErrorPayload {
  3: LiffErrorConsentRequired consentRequired
}

struct RevokeTokenRequest {
  1: string accessToken
}

