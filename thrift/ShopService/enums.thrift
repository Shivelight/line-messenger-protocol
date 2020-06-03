namespace py LineThrift.shop.enums
namespace go LineThrift.shop.enums

enum ProductType {
  STICKER = 1
  THEME = 2
  STICON = 3
}

enum SuggestionType {
  // unknown
}

enum ProductBannerLinkType {
  BANNER_LINK_NONE = 0
  BANNER_LINK_ITEM = 1
  BANNER_LINK_URL = 2
  BANNER_LINK_CATEGORY = 3
}

enum ProductEventType {
  NO_EVENT = 0
  CARRIER_ANY = 65537
  BUDDY_ANY = 131073
  INSTALL_IOS = 196609
  INSTALL_ANDROID = 196610
  MISSION_ANY = 262145
  MUSTBUY_ANY = 327681
}

enum StickerResourceType {
  STATIC = 1
  ANIMATION = 2
  SOUND = 3
  ANIMATION_SOUND = 4
  POPUP = 5
  POPUP_SOUND = 6
}

