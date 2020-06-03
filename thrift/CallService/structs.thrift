include "enums.thrift"
include "../Common/structsC.thrift"

namespace py LineThrift.call.structs
namespace go LineThrift.call.structs

struct CallHost {
  1: string host
  2: i32 port
  3: string zone
}

struct GroupCallRoute {
  1: string token
  2: CallHost cscf
  3: CallHost mix
  4: string hostMid
  5: list<string> capabilities
  6: enums.Protocol protocol
  7: string voipAddress
  8: i32 voipUdpPort
  9: i32 voipTcpPort
  10: string fromZone
  11: string commParam
  12: string polarisAddress
  13: i32 polarisUdpPort
  14: string polarisZone
  15: string orionAddress
}

struct PaidCallCurrencyExchangeRate {
  1: string currencyCode
  2: string currencyName
  3: string currencySign
  4: bool preferred
  5: string coinRate
  6: string creditRate
}

struct PaidCallDialing {
  1: enums.PaidCallType type
  2: string dialedNumber
  3: string serviceDomain
  4: enums.PaidCallProductType productType
  5: string productName
  6: bool multipleProduct
  7: enums.PaidCallerIdStatus callerIdStatus
  10: i32 balance
  11: string unit
  12: i32 rate
  13: string displayCode
  14: string calledNumber
  15: string calleeNationalNumber
  16: string calleeCallingCode
  17: string rateDivision
  20: i32 adMaxMin
  21: i32 adRemains
  22: string adSessionId
}

struct PaidCallResponse {
  1: CallHost host
  2: PaidCallDialing dialing
  3: string token
  4: list<structsC.SpotItem> spotItems
}

struct GroupCall {
  1: bool online
  2: string chatMid
  3: string hostMids
  4: list<string> memberMids
  5: i64 started
  6: enums.MediaType mediaType
  7: enums.Protocol protocol
}

struct PaidCallAdResult {
  1: i32 adRemains
}

struct PaidCallBalance {
  1: enums.PaidCallProductType productType
  2: string productName
  3: string unit
  4: i32 limitedPaidBalance
  5: i32 limitedFreeBalance
  6: i32 unlimitedPaidBalance
  7: i32 unlimitedFreeBalance
  8: i64 startTime
  9: i64 endTime
  10: bool autopayEnabled
}

struct PaidCallHistory {
  1: i64 seq
  2: enums.PaidCallType type
  3: string dialedNumber
  4: string calledNumber
  5: string toMid
  6: string toName
  7: i64 setupTime
  8: i64 startTime
  9: i64 endTime
  10: i64 duration
  11: i32 terminate
  12: enums.PaidCallProductType productType
  13: i32 charge
  14: string unit
  15: string result
}

struct PaidCallHistoryResult {
  1: list<PaidCallHistory> historys
  2: bool hasNext
}

struct PaidCallAdCountry {
  1: string countryCode
  2: string rateDivision
}

struct PaidCallMetadataResult {
  1: list<PaidCallCurrencyExchangeRate> currencyExchangeRates
  2: list<string> recommendedCountryCodes
  3: list<PaidCallAdCountry> adCountries
}

struct PhoneInfoForChannel {
  1: string mid
  2: string normalizedPhoneNumber
  3: bool allowedToSearchByPhoneNumber
  4: bool allowedToReceiveMessageFromNonFriend
  5: string region
}

struct UserTicketResponse {
  1: string mid
  2: string userTicket
}

struct NotiCenterEventData {
  1: string id
  2: string to
  3: string from_
  4: string toChannel
  5: string fromChannel
  6: string eventType
  7: i64 createdTime
  8: i64 operationRevision
  9: map<string, string> content
  10: map<string, string> push
}

struct PaidCallRedeemResult {
  1: string eventName
  2: i32 eventAmount
}

struct PaidCallUserRate {
  1: string countryCode
  2: i32 rate
  3: string rateDivision
  4: string rateName
}

