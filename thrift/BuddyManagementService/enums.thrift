namespace py LineThrift.buddymanagement.enums
namespace go LineThrift.buddymanagement.enums

enum BuddyResultState {
  ACCEPTED = 1
  SUCCEEDED = 2
  FAILED = 3
  CANCELLED = 4
  NOTIFY_FAILED = 5
  STORING = 11
  UPLOADING = 21
  NOTIFYING = 31
  REMOVING_SUBSCRIPTION = 41
  UNREGISTERING_ACCOUNT = 42
  NOTIFYING_LEAVE_CHAT = 43
}
