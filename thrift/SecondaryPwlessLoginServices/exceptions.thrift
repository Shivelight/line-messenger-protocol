include "enums.thrift"

namespace cpp LineThrift.secondarypwlesslogin.exceptions
namespace py LineThrift.secondarypwlesslogin.exceptions
namespace go LineThrift.secondarypwlesslogin.exceptions

exception SecondaryPwlessLoginException {
    1: enums.SecondaryPwlessLoginErrorCode code,
    2: string alertMessage
}