include "enums.thrift"
include "structs.thrift"
include "../Common/_enums.thrift"
include "../Common/_structs.thrift"
include "../Common/_exceptions.thrift"

namespace py LineThrift.buddy
namespace go LineThrift.buddy

service BuddyService {

  list<structs.BuddySearchResult> findBuddyContactsByQuery(
    2: string language,
    3: string country,
    4: string query,
    5: i32 fromIndex,
    6: i32 count,
    7: enums.BuddySearchRequestSource requestSource) throws (1: _exceptions.TalkException e)

  list<_structs.Contact> getBuddyContacts(
    2: string language,
    3: string country,
    4: string classification,
    5: i32 fromIndex,
    6: i32 count) throws (1: _exceptions.TalkException e)

  _structs.BuddyDetail getBuddyDetail(
    4: string buddyMid) throws (1: _exceptions.TalkException e)

  structs.BuddyOnAir getBuddyOnAir(
    4: string buddyMid) throws (1: _exceptions.TalkException e)

  list<string> getCountriesHavingBuddy() throws (1: _exceptions.TalkException e)

  map<string, i64> getNewlyReleasedBuddyIds(
    3: string country) throws (1: _exceptions.TalkException e)

  structs.BuddyBanner getPopularBuddyBanner(
    2: string language,
    3: string country,
    4: _enums.ApplicationType applicationType,
    5: string resourceSpecification) throws (1: _exceptions.TalkException e)

  list<structs.BuddyList> getPopularBuddyLists(
    2: string language,
    3: string country) throws (1: _exceptions.TalkException e)

  list<_structs.Contact> getPromotedBuddyContacts(
    2: string language,
    3: string country) throws (1: _exceptions.TalkException e)

}