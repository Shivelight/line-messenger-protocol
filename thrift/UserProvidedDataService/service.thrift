include "enums.thrift"
include "structs.thrift"
include "../Common/enumsC.thrift"
include "../Common/structsC.thrift"
include "../Common/exceptionsC.thrift"

namespace cpp LineThrift.userprovideddata
namespace py LineThrift.userprovideddata
namespace go LineThrift.userprovideddata

service UserProvidedDataService {
	void reportLocation(
		1: structsC.Geolocation location,
		2: i32 trigger,
		3: structsC.ClientNetworkStatus networkStatus) throws (1: exceptionsC.TalkException e)
	void requestCleanupUserProvidedData(
		1: set<enums.UserProvidedDataType> dataTypes) throws (1: exceptionsC.TalkException e)
}