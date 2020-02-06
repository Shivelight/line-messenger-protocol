include "enums.thrift"
include "structs.thrift"

namespace py LineThrift.universalnotification.exceptions

exception UniversalNotificationServiceException {
  1: enums.UniversalNotificationServiceErrorCode code
  2: string reason
  3: map<string, string> parameterMap
}

