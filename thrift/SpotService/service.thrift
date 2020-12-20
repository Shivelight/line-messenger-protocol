include "structs.thrift"
include "../Common/enumsC.thrift"
include "../Common/structsC.thrift"
include "../Common/exceptionsC.thrift"

namespace cpp LineThrift.spot
namespace py LineThrift.spot
namespace go LineThrift.spot

service SpotService {

  structs.SpotPhoneNumberResponse lookupByPhoneNumber(
    2: string countryAreaCode,
    3: string phoneNumber) throws (1: exceptionsC.TalkException e)

  structs.SpotNearbyResponse lookupNearby(
    2: structsC.Location location,
    3: enumsC.SpotCategory category,
    4: string query,
    5: string countryAreaCode) throws (1: exceptionsC.TalkException e)

}