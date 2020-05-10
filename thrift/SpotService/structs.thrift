include "../Common/enumsC.thrift"
include "../Common/structsC.thrift"

namespace py LineThrift.spot.structs
namespace go LineThrift.spot.structs

struct SpotPhoneNumberResponse {
  1: list<structsC.SpotItem> spotItems
}

struct SpotNearbyItem {
  2: structsC.SpotItem spotItem
  11: structsC.Location location
}

struct SpotNearbyResponse {
  1: list<SpotNearbyItem> spotNearbyItems
}

