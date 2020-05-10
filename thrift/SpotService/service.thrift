include "structs.thrift"
include "../Common/_enums.thrift"
include "../Common/_structs.thrift"
include "../Common/_exceptions.thrift"

namespace py LineThrift.spot
namespace go LineThrift.spot

service SpotService {

  structs.SpotPhoneNumberResponse lookupByPhoneNumber(
    2: string countryAreaCode,
    3: string phoneNumber) throws (1: _exceptions.TalkException e)

  structs.SpotNearbyResponse lookupNearby(
    2: _structs.Location location,
    3: _enums.SpotCategory category,
    4: string query,
    5: string countryAreaCode) throws (1: _exceptions.TalkException e)

}