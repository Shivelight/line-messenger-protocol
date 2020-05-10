include "enums.thrift"
include "../Common/_enums.thrift"
include "../Common/_structs.thrift"

namespace py LineThrift.buddy.structs
namespace go LineThrift.buddy.structs

struct BuddySearchResult {
  1: string mid
  2: string displayName
  3: string pictureStatus
  4: string picturePath
  5: string statusMessage
  6: bool businessAccount
  7: i32 iconType
  8: _enums.BotType botType
}

struct BuddyOnAirUrls {
  1: map<string, string> hls
  2: map<string, string> smoothStreaming
}

struct BuddyOnAir {
  1: string mid
  3: i64 freshnessLifetime
  4: string onAirId
  5: bool onAir
  11: string text
  12: i64 viewerCount
  13: i64 targetCount
  14: i64 livePlayTime
  15: string screenAspectRate
  31: enums.BuddyOnAirType onAirType
  32: BuddyOnAirUrls onAirUrls
  33: string aspectRatioOfSource
  41: bool useFadingOut
  42: i64 fadingOutIn
  43: string urlAfterFadingOut
  44: string labelAfterFadingOut
  51: bool useLowerBanner
  52: string lowerBannerUrl
  53: string lowerBannerLabel
}

struct BuddyBanner {
  1: enums.BuddyBannerLinkType buddyBannerLinkType
  2: string buddyBannerLink
  3: string buddyBannerImageUrl
}

struct BuddyList {
  1: string classification
  2: string displayName
  3: i32 totalBuddyCount
  4: list<_structs.Contact> popularContacts
}

