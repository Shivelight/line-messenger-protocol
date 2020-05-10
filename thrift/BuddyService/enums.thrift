namespace py LineThrift.buddy.enums
namespace go LineThrift.buddy.enums

enum BuddySearchRequestSource {
  NA = 0
  FRIEND_VIEW = 1
  OFFICIAL_ACCOUNT_VIEW = 2
}

enum BuddyOnAirLabel {
  ON_AIR = 0
  LIVE = 1
}

enum BuddyOnAirType {
  NORMAL = 0
  LIVE = 1
  VOIP = 2
  RECORD = 3
}

enum BuddyBannerLinkType {
  BUDDY_BANNER_LINK_HIDDEN = 0
  BUDDY_BANNER_LINK_MID = 1
  BUDDY_BANNER_LINK_URL = 2
}
