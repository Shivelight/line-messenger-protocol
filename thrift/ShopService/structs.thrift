include "enums.thrift"
include "../Common/enumsC.thrift"

namespace py LineThrift.shop.structs
namespace go LineThrift.shop.structs


struct ProductSummaryForAutoSuggest {
  1: string id
  2: i64 version
  3: string name
  4: enums.StickerResourceType stickerResourceType
  5: i64 suggestVersion
}

struct AutoSuggestionShowcaseRequest {
  1: enums.ProductType productType
  2: enums.SuggestionType suggestionType
}
struct AutoSuggestionShowcaseResponse {
  1: list<ProductSummaryForAutoSuggest> productList
  2: i64 totalSize
}


struct PaymentReservation {
  1: string receiverMid
  2: string productId
  3: string language
  4: string location
  5: string currency
  6: string price
  7: enumsC.PaymentType appStoreCode
  8: string messageText
  9: i32 messageTemplate
  10: i64 packageId
}

struct ProductCategory {
  1: i64 productCategoryId
  2: string title
  3: i32 productCount
  4: bool newFlag
}

struct Product {
  1: string productId
  2: i64 packageId
  3: i32 version
  4: string authorName
  5: bool onSale
  6: i32 validDays
  7: i32 saleType
  8: string copyright
  9: string title
  10: string descriptionText
  11: i64 shopOrderId
  12: string fromMid
  13: string toMid
  14: i64 validUntil
  15: i32 priceTier
  16: string price
  17: string currency
  18: string currencySymbol
  19: enumsC.PaymentType paymentType
  20: i64 createDate
  21: bool ownFlag
  22: enums.ProductEventType eventType
  23: string urlSchema
  24: string downloadUrl
  25: string buddyMid
  26: i64 publishSince
  27: bool newFlag
  28: bool missionFlag
  29: list<ProductCategory> categories
  30: string missionButtonText
  31: string missionShortDescription
  32: string authorId
  41: bool grantedByDefault
  42: i32 displayOrder
  43: bool availableForPresent
  44: bool availableForMyself
  51: bool hasAnimation
  52: bool hasSound
  53: bool recommendationsEnabled
  54: enums.StickerResourceType stickerResourceType
}

struct ProductList {
  1: bool hasNext
  4: i64 bannerSequence
  5: enums.ProductBannerLinkType bannerTargetType
  6: string bannerTargetPath
  7: list<Product> productList
  8: string bannerLang
}

struct StickerIdRange {
  1: i64 start
  2: i32 size
}

struct ProductSimple {
  1: string productId
  2: i64 packageId
  3: i32 version
  4: bool onSale
  5: i64 validUntil
  10: list<StickerIdRange> stickerIdRanges
  41: bool grantedByDefault
  42: i32 displayOrder
}

struct ProductSimpleList {
  1: bool hasNext
  2: i32 reinvokeHour
  3: i64 lastVersionSeq
  4: list<ProductSimple> productList
  5: i64 recentNewReleaseDate
  6: i64 recentEventReleaseDate
}

