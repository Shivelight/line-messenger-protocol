include "enums.thrift"

namespace py LineThrift.channelapplicationprovided.structs

struct Contact {
  1: string mid
  2: i64 createdTime
  10: enums.ContactType type
  11: enums.ContactStatus status
  21: enums.ContactRelation relation
  22: string displayName
  23: string phoneticName
  24: string pictureStatus
  25: string thumbnailUrl
  26: string statusMessage
  27: string displayNameOverridden
  28: i64 favoriteTime
  31: bool capableVoiceCall
  32: bool capableVideoCall
  33: bool capableMyhome
  34: bool capableBuddy
  35: i32 attributes
  36: i64 settings
  37: string picturePath
  38: string recommendParams
  39: enums.FriendRequestStatus friendRequestStatus
  40: string musicProfile
  42: string videoProfile
}

struct CompactContact {
  1: string mid
  2: i64 createdTime
  3: i64 modifiedTime
  4: enums.ContactStatus status
  5: i64 settings
  6: string displayNameOverridden
}

struct GroupPreference {
  1: string invitationTicket
  2: i64 favoriteTimestamp
}

struct Group {
  1: string id
  2: i64 createdTime
  10: string name
  11: string pictureStatus
  12: bool preventedJoinByTicket
  13: GroupPreference groupPreference
  20: list<Contact> members
  21: Contact creator
  22: list<Contact> invitee
  31: bool notificationDisabled
  32: string picturePath
  40: list<string> memberMids
  41: list<string> inviteeMids
}

struct IdentityCredential {
  1: enums.IdentityProvider provider
  2: string identifier
  3: string password
}

struct MetaProfile {
  1: i64 createTime
  2: string regionCode
  3: map<enums.RegistrationType, string> identities
}

struct SimpleChannelClient {
  1: string applicationType
  2: string applicationVersion
  3: string locale
}

struct Profile {
  1: string mid
  3: string userid
  10: string phone
  11: string email
  12: string regionCode
  20: string displayName
  21: string phoneticName
  22: string pictureStatus
  23: string thumbnailUrl
  24: string statusMessage
  31: bool allowSearchByUserid
  32: bool allowSearchByEmail
  33: string picturePath
  34: string musicProfile
  35: string videoProfile
}

struct SimpleChannelContact {
  1: string mid
  2: string displayName
  3: string pictureStatus
  4: string picturePath
  5: string statusMessage
}

struct Location {
  1: string title
  2: string address
  3: double latitude
  4: double longitude
  5: string phone
}

struct Message {
  1: string from_
  2: string to
  3: enums.MIDType toType
  4: string id
  5: i64 createdTime
  6: i64 deliveredTime
  10: string text
  11: Location location
  14: bool hasContent
  15: enums.ContentType contentType
  17: binary contentPreview
  18: map<string, string> contentMetadata
  19: i8 sessionId
  20: list<binary> chunks
  21: string relatedMessageId
  22: enums.MessageRelationType messageRelationType
  23: i32 readCount
  24: enums.ServiceCode relatedMessageServiceCode
}

