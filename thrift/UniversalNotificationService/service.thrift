include "enums.thrift"
include "structs.thrift"
include "exceptions.thrift"

namespace py LineThrift.universalnotification

service UniversalNotificationService {

  void notify(
    2: structs.GlobalEvent event) throws (1: exceptions.UniversalNotificationServiceException e)

}