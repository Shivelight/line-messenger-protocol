include "../Common/_enums.thrift"
include "../Common/_structs.thrift"

namespace py LineThrift.spot.structs
namespace go LineThrift.spot.structs

struct SpotPhoneNumberResponse {
  1: list<_structs.SpotItem> spotItems
}

struct SpotNearbyItem {
  2: _structs.SpotItem spotItem
  11: _structs.Location location
}

struct SpotNearbyResponse {
  1: list<SpotNearbyItem> spotNearbyItems
}

