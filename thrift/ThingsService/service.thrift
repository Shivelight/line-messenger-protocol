include "enums.thrift"
include "structs.thrift"
include "../Common/enumsC.thrift"
include "../Common/structsC.thrift"
include "../Common/exceptionsC.thrift"

namespace cpp LineThrift.things
namespace py LineThrift.things
namespace go LineThrift.things

service ThingsService {
	void linkDevice(
		1: structs.DeviceLinkRequest request) throws (1: exceptionsC.TalkException e)

	void unlinkDevice(
		1: structs.DeviceUnlinkRequest request) throws (1: exceptionsC.TalkException e)

	structs.ThingsDevice getBleDevice(
		1: structs.GetBleDeviceRequest request) throws (1: exceptionsC.TalkException e)

	structs.GetPredefinedScenarioSetsResponse getPredefinedScenarioSets(
		1: structs.GetPredefinedScenarioSetsRequest request) throws (1: exceptionsC.TalkException e)

	structs.NotifyScenarioExecutedResponse notifyScenarioExecuted(
		1: structs.NotifyScenarioExecutedRequest request) throws (1: exceptionsC.TalkException e)

	list<structs.UserDevice> getLinkedDevices() throws (1: exceptionsC.TalkException e)

	list<structs.BleProduct> getBleProducts() throws (1: exceptionsC.TalkException e)

}