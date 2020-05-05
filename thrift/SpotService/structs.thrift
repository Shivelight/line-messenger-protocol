include "enums.thrift"

namespace py LineThrift.spot.structs
namespace go LineThrift.spot.structs

struct SpotItem {
  2: string name
  3: string phone
  4: enums.SpotCategory category
  5: string mid
  6: string countryAreaCode
  10: bool freePhoneCallable
}

struct SpotPhoneNumberResponse {
  1: list<SpotItem> spotItems
}

struct Location {
  1: string title
  2: string address
  3: double latitude
  4: double longitude
  5: string phone
}

struct SpotNearbyItem {
  2: SpotItem spotItem
  11: Location location
}

struct SpotNearbyResponse {
  1: list<SpotNearbyItem> spotNearbyItems
}

