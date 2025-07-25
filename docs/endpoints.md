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
| Auth EAP | /ACCT/authfactor/eap/v1 | AccountAuthFactorEapConnectService (not yet implemented) | _No description._ |
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
| Beacon | /BEACON4 | BeaconService (not yet implemented) | LINE Beacon Service |
| Persona | /PS4 | PersonaService (not yet implemented) | BUDDY recommendation |
| Square | /SQS1 | [SquareService](thrift/SquareService/) | LINE Square (now called OpenChat) |
| Square BOT | /BP1 | [SquareBotService](thrift/SquareBotService/) | LINE Square BOT |
| Point | /POINT4 | PointService (not yet implemented) | LINE Point service |
| Coin | /COIN4 | CoinService (not yet implemented) | LINE Coin service |
| LIFF | /LIFF1 | [LiffService](thrift/LiffService/) | LINE Front-end Framework auth service |
| Chat APP | /CAPP1 | [ChatappService](thrift/ChatappService/) | LINE Chat App extension service |
| IOT | /IOT1 | ThingsService (not yet implemented) | LINE Internet of Thing service |
| User Provided Data | /UPD4 | [UserProvidedDataService](thrift/UserProvidedDataService/) | User data reporting service |
| New Registration | /acct/pais/v1 | [PrimaryAccountInitService](thrift/PrimaryAccountInitService/) | Primary Account Init Service |
| Secondary QR Login | /ACCT/lgn/sq/v1 | [SecondaryQrCodeServices](thrift/SecondaryQrCodeServices/) | Secondary device qr verification |
| User Setting | /US4 | UserSettingsService (not yet implemented) | _No description._ |
| LINE Spot | /ex/spot | JSON | _No description._ |
| LINE Home V2 Services | /EXT/home/sapi/v4p/hsl | LineHomeV2Services (not yet implemented) | _No description._ |

<html><small>revision: 0</small></html>

```
Endpoint Suffix/Version Description:
1 - Thrift Compact Protocol (as default)
4 - Thrift Compact Protocol
5 - Thrift More Compact Protocol, Custom Protocol (engineered thrift)
```
