include "enums.thrift"

namespace py LineThrift.secondaryqrcode.exceptions
namespace go LineThrift.secondaryqrcode.exceptions

exception SecondaryQrCodeException {
	1: enums.SecondaryQrCodeErrorCode code,
	2: string alertMessage
}