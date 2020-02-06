include "enums.thrift"

namespace py LineThrift.buddy.structs

struct BuddySearchResult {
  1: string mid
  2: string displayName
  3: string pictureStatus
  4: string picturePath
  5: string statusMessage
  6: bool businessAccount
  7: i32 iconType
  8: enums.BotType botType
}

struct Contact {
  1: string mid
  2: i64 createdTime
  10: enums.ContactType type
  11: enums.ContactStatus status
  21: enums.ContactRelation relation
  22: string displayName
  23: string phoneticName
  24: string pictureStatus
  25: string thumbnailUrl
  26: string statusMessage
  27: string displayNameOverridden
  28: i64 favoriteTime
  31: bool capableVoiceCall
  32: bool capableVideoCall
  33: bool capableMyhome
  34: bool capableBuddy
  35: i32 attributes
  36: i64 settings
  37: string picturePath
  38: string recommendParams
  39: enums.FriendRequestStatus friendRequestStatus
  40: string musicProfile
  42: string videoProfile
}

struct BuddyDetail {
  1: string mid
  2: i64 memberCount
  3: bool onAir
  4: bool businessAccount
  5: bool addable
  6: set<enums.ContentType> acceptableContentTypes
  7: bool capableMyhome
  8: bool freePhoneCallable
  9: string phoneNumberToDial
  10: bool needPermissionApproval
  11: i32 channelId
  12: string channelProviderName
  13: i32 iconType
  14: enums.BotType botType
  15: bool showRichMenu
  16: i64 richMenuRevision
  17: enums.BuddyOnAirLabel onAirLabel
  27: i32 onAirVersion
  18: bool useTheme
  19: string themeId
  20: bool useBar
  21: i64 barRevision
  22: bool useBackground
  23: string backgroundId
  24: bool statusBarEnabled
  25: i64 statusBarRevision
  26: bool capableChat
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
  4: list<Contact> popularContacts
}

