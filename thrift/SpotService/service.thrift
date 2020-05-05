include "enums.thrift"
include "structs.thrift"
include "exceptions.thrift"

namespace py LineThrift.spot
namespace go LineThrift.spot

service SpotService {

  structs.SpotPhoneNumberResponse lookupByPhoneNumber(
    2: string countryAreaCode,
    3: string phoneNumber) throws (1: exceptions.TalkException e)

  structs.SpotNearbyResponse lookupNearby(
    2: structs.Location location,
    3: enums.SpotCategory category,
    4: string query,
    5: string countryAreaCode) throws (1: exceptions.TalkException e)

}