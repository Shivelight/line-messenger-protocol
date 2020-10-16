namespace py LineThrift.things.enums
namespace go LineThrift.things.enums


enum ScenarioCode {
	SUCCESS = 0
	UNKNOWN_ERROR = 1
	GATT_ERROR = 2
	GATT_OPERATION_NOT_SUPPORTED = 3
	GATT_SERVICE_NOT_FOUND = 4
	GATT_CHARACTERISTIC_NOT_FOUND = 5
	GATT_CONNECTION_CLOSED = 6
}

enum ThingsProductType {
	CLOUD = 1
	BLE = 2
}