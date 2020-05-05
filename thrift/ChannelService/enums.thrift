namespace py LineThrift.channel.enums
namespace go LineThrift.channel.enums

enum ChannelErrorCode {
  ILLEGAL_ARGUMENT = 0
  INTERNAL_ERROR = 1
  CONNECTION_ERROR = 2
  AUTHENTICATIONI_FAILED = 3
  NEED_PERMISSION_APPROVAL = 4
  COIN_NOT_USABLE = 5
  WEBVIEW_NOT_ALLOWED = 6
}

enum NotificationItemFetchMode {
  ALL = 0
  APPEND = 1
}

enum PublicType {
  HIDDEN = 0
  PUBLIC = 1000
}

enum ChannelConfiguration {
  MESSAGE = 0
  MESSAGE_NOTIFICATION = 1
  NOTIFICATION_CENTER = 2
}

enum ChannelPermission {
  PROFILE = 0
  FRIENDS = 1
  GROUP = 2
}

enum ChannelFeatureLicense {
  BLE_LCS_API_USABLE = 26
  PROHIBIT_MINIMIZE_CHANNEL_BROWSER = 27
  ALLOW_IOS_WEBKIT = 28
}

enum PaymentType {
  PAYMENT_APPLE = 1
  PAYMENT_GOOGLE = 2
}

