include "enums.thrift"
include "../Common/enumsC.thrift"
include "../Common/structsC.thrift"

namespace py LineThrift.things.structs
namespace go LineThrift.things.structs

struct DeviceLinkRequest {
	1: string deviceId
}
struct DeviceUnlinkRequest {
	1: string deviceId
}

struct GetBleDeviceRequest {
	1: string serviceUuid // uuid
	2: string psdi // hexDigitString
}
struct ThingsDevice {
	1: string deviceId
	2: string actionUri
	3: string botMid
	4: enums.ThingsProductType productType
	5: string providerName
	6: string profileImageLocation
	7: list<string> channelIdList
	8: i16 targetABCEngineVersion
	9: string serviceUuid
	10: bool bondingRequired
}

struct GetPredefinedScenarioSetsRequest {
	1: list<string> deviceIds
}
struct ImmediateTrigger {
}
struct BleNotificationReceivedTrigger {
	1: string serviceUuid
	2: string characteristicUuid
}
struct ScenarioTrigger {
	1: ImmediateTrigger immediate
	2: BleNotificationReceivedTrigger bleNotificationReceived
}
struct GattReadAction {
	1: string serviceUuid
	2: string characteristicUuid
}
struct GattWriteAction {
	1: string serviceUuid
	2: string characteristicUuid
	3: string data
}
struct SleepAction {
	1: i64 sleepMillis
}
struct ScenarioAction {
	1: GattReadAction gattRead
	2: GattWriteAction gattWrite
	3: SleepAction sleep
}
struct Scenario {
	1: string id
	2: ScenarioTrigger trigger
	3: list<ScenarioAction> actions
}
struct ScenarioSet {
	1: list<Scenario> scenarios
	2: bool autoClose
	3: i64 suppressionInterval
	4: i64 revision
	5: i64 modifiedTime
}
struct GetPredefinedScenarioSetsResponse {
	// deviceId: ScenarioSet
	1: map<string,ScenarioSet> scenarioSets
}


struct VoidScenarioActionResult {
}
struct BinaryScenarioActionResult {
	1: binary bytes
}
struct ScenarioActionResult {
	1: VoidScenarioActionResult voidResult
	2: BinaryScenarioActionResult binaryResult
}
struct ScenarioResult {
	1: string scenarioId
	2: string deviceId
	3: i64 revision
	4: i64 startTime
	5: i64 endTime
	6: enums.ScenarioCode code
	7: string errorReason
	8: string bleNotificationPayload
	9: list<ScenarioActionResult> actionResults
	10: string connectionId
}
struct NotifyScenarioExecutedRequest {
	2: list<ScenarioResult> scenarioResults
}
struct NotifyScenarioExecutedResponse {
}

struct UserDevice {
	1: ThingsDevice device
	2: string deviceDisplayName
}

struct BleProduct {
	1: string serviceUuid
	2: string psdiServiceUuid
	3: string psdiCharacteristicUuid
	4: string name
	5: string profileImageLocation
	6: bool bondingRequired
}