include "enums.thrift"
include "structs.thrift"
include "exceptions.thrift"

namespace cpp LineThrift.things
namespace py LineThrift.things
namespace go LineThrift.things

service ThingsService {
	structs.NotifyDeviceConnectionResponse notifyDeviceConnection(
		1: structs.NotifyDeviceConnectionRequest request) throws(1: exceptions.ThingsException e),
	structs.NotifyDeviceDisconnectionResponse notifyDeviceDisconnection(
		1: structs.NotifyDeviceDisconnectionRequest request) throws(1: exceptions.ThingsException e),

	void linkDevice(
		1: structs.DeviceLinkRequest request) throws (1: exceptions.ThingsException e),
	void unlinkDevice(
		1: structs.DeviceUnlinkRequest request) throws (1: exceptions.ThingsException e),

	structs.ThingsDevice getBleDevice(
		1: structs.GetBleDeviceRequest request) throws (1: exceptions.ThingsException e),

	structs.GetPredefinedScenarioSetsResponse getPredefinedScenarioSets(
		1: structs.GetPredefinedScenarioSetsRequest request) throws (1: exceptions.ThingsException e),

	structs.NotifyScenarioExecutedResponse notifyScenarioExecuted(
		1: structs.NotifyScenarioExecutedRequest request) throws (1: exceptions.ThingsException e),

	list<structs.UserDevice> getLinkedDevices() throws (1: exceptions.ThingsException e),

	list<structs.BleProduct> getBleProducts() throws (1: exceptions.ThingsException e)

}