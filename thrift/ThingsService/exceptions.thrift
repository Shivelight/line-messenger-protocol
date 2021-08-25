include "enums.thrift"

namespace cpp LineThrift.things.exceptions
namespace py LineThrift.things.exceptions
namespace go LineThrift.things.exceptions

exception ThingsException {
    1: enums.ThingsErrorCode code
    2: string reason
}