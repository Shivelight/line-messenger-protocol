include "enums.thrift"
include "../Common/enumsC.thrift"

namespace py LineThrift.channel.structs
namespace go LineThrift.channel.structs

struct ChannelToken {
  1: string token
  2: string obsToken
  3: i64 expiration
  4: string refreshToken
  5: string channelAccessToken
}

struct NotificationItem {
  1: string id
  2: string from_
  3: string to
  4: string fromChannel
  5: string toChannel
  7: i64 revision
  8: i64 createdTime
  9: map<string, string> content
}

struct NotificationFetchResult {
  1: enums.NotificationItemFetchMode fetchMode
  2: list<NotificationItem> itemList
}

struct ChannelProvider {
  1: string name
}

struct ChannelDomain {
  1: string host
  2: bool removed
}

struct ChannelInfo {
  1: string channelId
  3: string name
  4: string entryPageUrl
  5: string descriptionText
  6: ChannelProvider provider
  7: enums.PublicType publicType
  8: string iconImage
  9: list<string> permissions
  11: string iconThumbnailImage
  12: list<enums.ChannelConfiguration> channelConfigurations
  13: bool lcsAllApiUsable
  14: set<enums.ChannelPermission> allowedPermissions
  15: list<ChannelDomain> channelDomains
  16: i64 updatedTimestamp
  17: set<enums.ChannelFeatureLicense> featureLicenses
}

struct ApprovedChannelInfo {
  1: ChannelInfo channelInfo
  2: i64 approvedAt
}

struct ApprovedChannelInfos {
  1: list<ApprovedChannelInfo> approvedChannelInfos
  2: i64 revision
}

struct ChannelNotificationSetting {
  1: string channelId
  2: string name
  3: bool notificationReceivable
  4: bool messageReceivable
  5: bool showDefault
}

struct ChannelInfos {
  1: list<ChannelInfo> channelInfos
  2: i64 revision
}

struct ChannelDomains {
  1: list<ChannelDomain> channelDomains
  2: i64 revision
}

struct FriendChannelMatrix {
  1: string channelId
  2: string representMid
  3: i32 count
  4: i32 point
}

struct FriendChannelMatricesResponse {
  1: i64 expires
  2: list<FriendChannelMatrix> matrices
}

struct ChannelIdWithLastUpdated {
  1: string channelId
  2: i64 lastUpdated
}

struct OTPResult {
  1: string otpId
  2: string otp
}

struct RequestTokenResponse {
  1: string requestToken
  2: string returnUrl
}

struct CoinUseReservationItem {
  1: string itemId
  2: string itemName
  3: i32 amount
}

struct CoinUseReservation {
  1: string channelId
  2: string shopOrderId
  3: enumsC.PaymentType appStoreCode
  4: list<CoinUseReservationItem> items
  5: string country
}

struct ChannelSyncDatas {
  1: list<ChannelInfo> channelInfos
  2: list<ChannelDomain> channelDomains
  3: i64 revision
  4: i64 expires
}

struct ChannelSettings {
  1: bool unapprovedMessageReceivable
}

