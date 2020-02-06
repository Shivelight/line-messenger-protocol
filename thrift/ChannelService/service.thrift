include "enums.thrift"
include "structs.thrift"
include "exceptions.thrift"

namespace py LineThrift.channel

service ChannelService {

  structs.ChannelToken approveChannelAndIssueChannelToken(
    1: string channelId) throws (1: exceptions.ChannelException e)

  string approveChannelAndIssueRequestToken(
    1: string channelId,
    2: string otpId) throws (1: exceptions.ChannelException e)

  structs.NotificationFetchResult fetchNotificationItems(
    2: i64 localRev) throws (1: exceptions.ChannelException e)

  structs.ApprovedChannelInfos getApprovedChannels(
    2: i64 lastSynced,
    3: string locale) throws (1: exceptions.ChannelException e)

  structs.ChannelInfo getChannelInfo(
    2: string channelId,
    3: string locale) throws (1: exceptions.ChannelException e)

  structs.ChannelNotificationSetting getChannelNotificationSetting(
    1: string channelId,
    2: string locale) throws (1: exceptions.ChannelException e)

  list<structs.ChannelNotificationSetting> getChannelNotificationSettings(
    1: string locale) throws (1: exceptions.ChannelException e)

  structs.ChannelInfos getChannels(
    2: i64 lastSynced,
    3: string locale) throws (1: exceptions.ChannelException e)

  structs.ChannelDomains getCommonDomains(
    1: i64 lastSynced) throws (1: exceptions.ChannelException e)

  structs.ChannelDomains getDomains(
    2: i64 lastSynced) throws (1: exceptions.ChannelException e)

  structs.FriendChannelMatricesResponse getFriendChannelMatrices(
    1: list<string> channelIds) throws (1: exceptions.ChannelException e)

  i32 getNotificationBadgeCount(
    2: i64 localRev) throws (1: exceptions.ChannelException e)

  list<string> getUpdatedChannelIds(
    1: list<structs.ChannelIdWithLastUpdated> channelIds) throws (1: exceptions.ChannelException e)

  structs.ChannelToken issueChannelToken(
    1: string channelId) throws (1: exceptions.ChannelException e)

  structs.OTPResult issueOTP(
    2: string channelId) throws (1: exceptions.ChannelException e)

  string issueRequestToken(
    1: string channelId,
    2: string otpId) throws (1: exceptions.ChannelException e)

  string issueRequestTokenForAutoLogin(
    2: string channelId,
    3: string otpId,
    4: string redirectUrl) throws (1: exceptions.ChannelException e)

  structs.RequestTokenResponse issueRequestTokenWithAuthScheme(
    1: string channelId,
    2: string otpId,
    3: list<string> authScheme,
    4: string returnUrl) throws (1: exceptions.ChannelException e)

  string reserveCoinUse(
    2: structs.CoinUseReservation request,
    3: string locale) throws (1: exceptions.ChannelException e)

  void revokeChannel(
    1: string channelId) throws (1: exceptions.ChannelException e)

  structs.ChannelSyncDatas syncChannelData(
    2: i64 lastSynced,
    3: string locale) throws (1: exceptions.ChannelException e)

  void updateChannelNotificationSetting(
    1: list<structs.ChannelNotificationSetting> setting) throws (1: exceptions.ChannelException e)

  bool updateChannelSettings(
    1: structs.ChannelSettings channelSettings) throws (1: exceptions.ChannelException e)

}