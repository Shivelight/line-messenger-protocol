### __Endpoints 8-)__ _(android source)_

<html><small>revision: 0</small></html>

| Endpoint Name | Path | Service | Description |
|--|--|--|--|
| Long Polling | /P4 | [TalkService](thrift/TalkService/) | Fetch TalkService event [long-polling](https://en.wikipedia.org/wiki/Push_technology#Long_polling) |
| Normal Polling | /NP4 | [TalkService](thrift/TalkService/) | Fetch TalkService event not [long-polling](https://en.wikipedia.org/wiki/Push_technology#Long_polling) |
| Cancel Long Polling | /CP4 | [TalkService](thrift/TalkService/) | _No description._ |
| Notify Sleep | /F4 | [TalkService](thrift/TalkService/) | Fetch TalkService background context |
| Notify Background | /B | [TalkService](thrift/TalkService/) | Fetch TalkService background context |
| Normal | /S4 | [TalkService](thrift/TalkService/) | Endpoint main TalkService |
| Compact Message | /C5 | Text, Sticker Message | Compact Protocol for sending Sticker and Text message, both |
| Compact Plain Message | /CA5 | Text, Sticker Message | Compact Protocol for sending Sticker and Text message, use _plain_ |
| Compact E2EE Message | /ECA5 | Text, Sticker Message | Compact Protocol for sending Sticker and Text message, use [_end-to-end encryption_](#line-e2ee) |
| Registration | /api/v4/TalkService.do | [TalkService](thrift/TalkService/) | Registration service |
| Buddy | /BUDDY4 | [BuddyService](thrift/BuddyService/) | Buddy Service |
| Shop | /SHOP4 | [ShopService](thrift/ShopService/) | Shop Service |
| Shop Auth | /SHOPA | ShopAuthService (not yet implemented) | Shop [_end-to-end encryption_](#line-e2ee) service, used to encrypt sticker content |
| Unified Shop | /TSHOP4 | DeprecatedUnifiedShopService (not implemented) | Unified Shop Service |
| Sticon | /SC4 | DeprecatedUnifiedShopService (not implemented) | LINE Emoji _(sticon)_ Service |
| Channel | /CH4 | [ChannelService](thrift/ChannelService/) | Channel Service |
| SNS Adapter | /SA4 | [SnsAdapterService](thrift/SnsAdapterService/) | [SNS]() Adapter Service |
| SNS Adapter Registration | /api/v4p/sa | [SnsAdapterService](thrift/SnsAdapterService/) | Register using sns |
| Auth EAP | /ACCT/authfactor/eap/v1 | [AccountAuthFactorEapConnectService](thrift/AccountAuthFactorEapConnectService/) | SNS Connect |
| User Behavior Log | /L1 | _JSON, need verify_ | Logging behavior event | 
| Age Check | /ACS4 | [AgeCheckService](thrift/AgeCheckService/) | Age sheck service |
| Spot | /SP4 | [SpotService](thrift/SpotService/) | _No description._ |
| Call | /V4 | [CallService](thrift/CallService/) | VoIP init session endpoint | 
| External Interlock | /EIS4 | ExternalInterlockService (not yet implemented) | _No description._ |
| Typing | /TS | _Unknown_ | Typing service |
| Connection Info | /R2 | JSON, [Info?](conn_info.md) | Service client configuration |
| Pay | /PY4 | PaymentService (not yet implemented) | LINE Pay integration |
| Wallet | /WALLET4 | WalletService (not yet implemented) | LINE Wallet |
| Auth | /RS4 | [AuthService](thrift/AuthService/) | Used for logging in |
| Auth Registration | /api/v4p/rs | [AuthService](thrift/AuthService/) | Usually used for client service init session |
| Search | /search/v1 | SearchService (not yet implemented) | Search service DEPRECATED |
| Search V2 | /search/v2 | SearchService (not yet implemented) | Search service V2 |
| Search V3 | /search/v3 | _Unknown_ | Search service V3 |
| Beacon | /BEACON4 | BeaconService (not yet implemented) | LINE Beacon Service |
| Persona | /PS4 | PersonaService (not yet implemented) | BUDDY recommendation |
| Square | /SQS1 | [SquareService](thrift/SquareService/) | LINE Square (now called OpenChat) |
| Square BOT | /BP1 | [SquareBotService](thrift/SquareBotService/) | LINE Square BOT |
| Point | /POINT4 | PointService (not yet implemented) | LINE Point service |
| Coin | /COIN4 | CoinService (not yet implemented) | LINE Coin service |
| LIFF | /LIFF1 | [LiffService](thrift/LiffService/) | LINE Front-end Framework auth service |
| Chat APP | /CAPP1 | [ChatappService](thrift/ChatappService/) | LINE Chat App extension service |
| IOT | /IOT1 | [ThingsService](thrift/ThingsService/) | LINE Internet of Thing service |
| User Provided Data | /UPD4 | [UserProvidedDataService](thrift/UserProvidedDataService/) | User data reporting service |
| New Registration | /acct/pais/v1 | [PrimaryAccountInitService](thrift/PrimaryAccountInitService/) | Primary Account Init Service |
| Secondary QR Login | /ACCT/lgn/sq/v1 | [SecondaryQrCodeServices](thrift/SecondaryQrCodeServices/) | Secondary device qr verification |
| User Setting | /US4 | UserSettingsService (not yet implemented) | _No description._ |
| LINE Spot | /ex/spot | JSON | _No description._ |
| LINE Home V2 Services | /EXT/home/sapi/v4p/hsl | LineHomeV2Services (not yet implemented) | _No description._ |
| LINE Home V2 Contents Recommendation | /EXT/home/sapi/v4p/flex | _Unknown_ | _No description._ |
| Birthday Gift Association | /EXT/home/sapi/v4p/bdg | _Unknown_ | _No description._ |
| Secondary Pwless Login Permit | /ACCT/lgn/secpwless/v1 | _Unknown_ | _No description._ |
| Secondary Auth Factor Pincode | /ACCT/authfactor/second/pincode/v1 | _Unknown_ | _No description._ |
| Pwless Credential Management | /ACCT/authfactor/pwless/manage/v1 | _Unknown_ | _No description._ |
| Pwless Primary Registration | /ACCT/authfactor/pwless/v1 | _Unknown_ | _No description._ |
| GLN Notification Status | /gln/webapi/graphql | _Unknown_ | _No description._ |
| BOT External | /BOTE | _Unknown_ | _No description._ |

<html><small>revision: 0</small></html>


## Service Prefix
| Endpoint Name | Path | Service | Description |
|--|--|--|--|
| TALK | "" | talk | ```[ X-Line-Access, x-ls, X-LS ]``` |
| MYHOME | /mh | myhome | ```[ X-Line-ChannelToken, X-Line-Mid ]``` |
| MYHOME_RENEWAL | /hm | myhome_renewal | ```[ X-Line-ChannelToken, X-Line-Mid ]``` |
| TIMELINE | /tl | timeline | ```[ X-Line-ChannelToken, X-Line-Mid ]``` |
| HOMEAPI | /ma | homeapi | ```[ X-Line-ChannelToken, X-Line-Mid ]``` |
| TIMELINE_AUTH | /ta | timeline_auth | ```[ X-Line-ChannelToken, X-Line-Mid ]``` |
| ALBUM | /ext/album | album | ```[ X-Line-ChannelToken, X-Line-Mid, X-Line-Album ]``` |
| NOTE | /nt | note | ```[ X-Line-ChannelToken, X-Line-Mid, X-Line-Cafe, X-Line-Group ]``` |
| GROUP_NOTE | /gn | group_note | ```[ X-Line-ChannelToken, X-Line-Cafe, X-Line-Group ]``` |
| MUSIC | /ms | music | ```[ X-Line-Mid, X-LCT, X-MGCT ]``` |
| OBS | /obs | obs | ```[ ]``` |
| CDN_OBS | /cobs | cdn_obs | ```[ ]``` |
| CDN_STICKER | /cstk | cdn_sticker | ```[ ]``` |
| CDN_PROFILE | /cprf | cdn_profile | ```[ ]``` |
| CDN_SHOP | /cshp | cdn_shop | ```[ ]``` |
| SCRAP | /sc | scrap | ```[ ]``` |
| PUBLIC_LINE_CMS | /plc | public_line_cms | ```[ X-Line-ChannelToken, X-CMSToken, X-ATCC ]``` |
| PUBLIC_LINE_MYHOME | /plm | public_line_myhome | ```[ X-Line-ChannelToken, X-Line-Mid ]``` |
| SECURITY_CENTER | /sec | security_center | ```[ ]``` |
| CONFERENCE | /cf | conference | ```[ X-Line-ChannelToken ]``` |
| CDN_PRIVATE | /pcdn | pcdn | ```[ ]``` |
| AD_SHOWCASE | /ad | ad | ```[ ]``` |
| AD_STATS | /as | as | ```[ ]``` |
| AD_TIMELINE | /at | at | ```[ ]``` |
| VOIP_GROUP_CALL_YOUTUBE | /EXT/groupcall/youtube-api | voip_group_call_youtube | ```[]``` |
| VOIP_LOG | /vl | voip_log | ```[ ]``` |
| VOIP_FACE_PLAY | /fp | face_play | ```[ ]``` |
| OBS_API | /oa | obs_api | ```[ X-Line-Access, X-Line-ChannelToken, X-Line-Mid, X-Line-Album, x-tl-post, x-obs-host ]``` |
| TRACKING_SDK | /tr | tracking | ```[ ]``` |
| SEARCH | /sg | search | ```[ X-Line-Access, x-lt ]``` |
| B612 | /b612 | b612 | ```[ X-Line-Access, x-ls, X-LS,  X-B612-Sno ]``` |
| KEEP | /kp | keep | ```[ X-Line-ChannelToken, X-Line-Mid ]``` |
| SQUARE_NOTE | /sn | square_note | ```[ X-Line-ChannelToken, X-Line-Mid ]``` |
| LASS | /lass | lass | ```[ ]``` |
| SMARTCH | /ext/smartch/ad | smartch | ```[ ]``` |
| MY_ACTIVITY | /mx | my_activity | ```[ X-Line-ChannelToken, X-Line-Mid ]``` |
| PAY | /pgw | pay | ```[ X-Line-Access, x-lt, x-lpt ]``` |
| STORY | /st | story | ```[ X-Line-ChannelToken, X-Line-Mid ]``` |
| TRANSLATE | /ds | translate | ```[ X-Line-ChannelToken ]``` |
| SEARCH_BAR_KEYWORDS | /pss | search_bar_keywords | ```[ ]``` |
| SOCIAL_NOTIFICATION | /eg | social_notification | ```[ ]``` |
| SPOT | /ex/spot | spot | ```[ ]``` |
| AVATAR | /ex/ya | avatar | ```[ X-Line-ChannelToken, X-Line-Mid ]``` |
| GLN | /ext/gln | gln | ```[ X-LINE-AccessToken ]``` |

<html><small>revision: 0</small></html>


```
Endpoint Suffix/Version Description:
1 - Thrift Compact Protocol (as default)
4 - Thrift Compact Protocol
5 - Thrift More Compact Protocol, Custom Protocol (engineered thrift)
```
