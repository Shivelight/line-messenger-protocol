include "structs.thrift"
include "exceptions.thrift"

namespace py LineThrift.square
namespace go LineThrift.square

service SquareService {

  structs.ApproveSquareMembersResponse approveSquareMembers(
    1: structs.ApproveSquareMembersRequest request) throws (1: exceptions.SquareException e)

  structs.CreateSquareResponse createSquare(
    1: structs.CreateSquareRequest request) throws (1: exceptions.SquareException e)

  structs.CreateSquareChatResponse createSquareChat(
    1: structs.CreateSquareChatRequest request) throws (1: exceptions.SquareException e)

  structs.CreateSquareChatAnnouncementResponse createSquareChatAnnouncement(
    1: structs.CreateSquareChatAnnouncementRequest request) throws (1: exceptions.SquareException e)

  structs.DeleteSquareResponse deleteSquare(
    1: structs.DeleteSquareRequest request) throws (1: exceptions.SquareException e)

  structs.DeleteSquareChatResponse deleteSquareChat(
    1: structs.DeleteSquareChatRequest request) throws (1: exceptions.SquareException e)

  structs.DeleteSquareChatAnnouncementResponse deleteSquareChatAnnouncement(
    1: structs.DeleteSquareChatAnnouncementRequest request) throws (1: exceptions.SquareException e)

  structs.DestroyMessageResponse destroyMessage(
    1: structs.DestroyMessageRequest request) throws (1: exceptions.SquareException e)

  structs.DestroyMessagesResponse destroyMessages(
    1: structs.DestroyMessagesRequest request) throws (1: exceptions.SquareException e)

  structs.FetchMyEventsResponse fetchMyEvents(
    1: structs.FetchMyEventsRequest request) throws (1: exceptions.SquareException e)

  structs.FetchSquareChatEventsResponse fetchSquareChatEvents(
    1: structs.FetchSquareChatEventsRequest request) throws (1: exceptions.SquareException e)

  structs.FindSquareByInvitationTicketResponse findSquareByInvitationTicket(
    1: structs.FindSquareByInvitationTicketRequest request) throws (1: exceptions.SquareException e)

  structs.GetSquareCategoriesResponse getCategories(
    1: structs.GetSquareCategoriesRequest request) throws (1: exceptions.SquareException e)

  structs.GetInvitationTicketUrlResponse getInvitationTicketUrl(
    1: structs.GetInvitationTicketUrlRequest request) throws (1: exceptions.SquareException e)

  structs.GetJoinableSquareChatsResponse getJoinableSquareChats(
    1: structs.GetJoinableSquareChatsRequest request) throws (1: exceptions.SquareException e)

  structs.GetJoinedSquareChatsResponse getJoinedSquareChats(
    1: structs.GetJoinedSquareChatsRequest request) throws (1: exceptions.SquareException e)

  structs.GetJoinedSquaresResponse getJoinedSquares(
    1: structs.GetJoinedSquaresRequest request) throws (1: exceptions.SquareException e)

  structs.GetNoteStatusResponse getNoteStatus(
    1: structs.GetNoteStatusRequest request) throws (1: exceptions.SquareException e)

  structs.GetSquareResponse getSquare(
    1: structs.GetSquareRequest request) throws (1: exceptions.SquareException e)

  structs.GetSquareAuthorityResponse getSquareAuthority(
    1: structs.GetSquareAuthorityRequest request) throws (1: exceptions.SquareException e)

  structs.GetSquareChatResponse getSquareChat(
    1: structs.GetSquareChatRequest request) throws (1: exceptions.SquareException e)

  structs.GetSquareChatAnnouncementsResponse getSquareChatAnnouncements(
    1: structs.GetSquareChatAnnouncementsRequest request) throws (1: exceptions.SquareException e)

  structs.GetSquareChatMembersResponse getSquareChatMembers(
    1: structs.GetSquareChatMembersRequest request) throws (1: exceptions.SquareException e)

  structs.GetSquareChatStatusResponse getSquareChatStatus(
    1: structs.GetSquareChatStatusRequest request) throws (1: exceptions.SquareException e)

  structs.GetSquareFeatureSetResponse getSquareFeatureSet(
    1: structs.GetSquareFeatureSetRequest request) throws (1: exceptions.SquareException e)

  structs.GetSquareMemberResponse getSquareMember(
    1: structs.GetSquareMemberRequest request) throws (1: exceptions.SquareException e)

  structs.GetSquareMembersResponse getSquareMembers(
    1: structs.GetSquareMembersRequest request) throws (1: exceptions.SquareException e)

  structs.GetSquareMemberRelationResponse getSquareMemberRelation(
    1: structs.GetSquareMemberRelationRequest request) throws (1: exceptions.SquareException e)

  structs.GetSquareMemberRelationsResponse getSquareMemberRelations(
    1: structs.GetSquareMemberRelationsRequest request) throws (1: exceptions.SquareException e)

  structs.GetSquareStatusResponse getSquareStatus(
    1: structs.GetSquareStatusRequest request) throws (1: exceptions.SquareException e)

  structs.InviteToSquareResponse inviteToSquare(
    1: structs.InviteToSquareRequest request) throws (1: exceptions.SquareException e)

  structs.InviteToSquareChatResponse inviteToSquareChat(
    1: structs.InviteToSquareChatRequest request) throws (1: exceptions.SquareException e)

  structs.JoinSquareResponse joinSquare(
    1: structs.JoinSquareRequest request) throws (1: exceptions.SquareException e)

  structs.JoinSquareChatResponse joinSquareChat(
    1: structs.JoinSquareChatRequest request) throws (1: exceptions.SquareException e)

  structs.LeaveSquareResponse leaveSquare(
    1: structs.LeaveSquareRequest request) throws (1: exceptions.SquareException e)

  structs.LeaveSquareChatResponse leaveSquareChat(
    1: structs.LeaveSquareChatRequest request) throws (1: exceptions.SquareException e)

  structs.MarkAsReadResponse markAsRead(
    1: structs.MarkAsReadRequest request) throws (1: exceptions.SquareException e)

  structs.RefreshSubscriptionsResponse refreshSubscriptions(
    1: structs.RefreshSubscriptionsRequest request) throws (1: exceptions.SquareException e)

  structs.RejectSquareMembersResponse rejectSquareMembers(
    1: structs.RejectSquareMembersRequest request) throws (1: exceptions.SquareException e)

  structs.RemoveSubscriptionsResponse removeSubscriptions(
    1: structs.RemoveSubscriptionsRequest request) throws (1: exceptions.SquareException e)

  structs.ReportSquareResponse reportSquare(
    1: structs.ReportSquareRequest request) throws (1: exceptions.SquareException e)

  structs.ReportSquareChatResponse reportSquareChat(
    1: structs.ReportSquareChatRequest request) throws (1: exceptions.SquareException e)

  structs.ReportSquareMemberResponse reportSquareMember(
    1: structs.ReportSquareMemberRequest request) throws (1: exceptions.SquareException e)

  structs.ReportSquareMessageResponse reportSquareMessage(
    1: structs.ReportSquareMessageRequest request) throws (1: exceptions.SquareException e)

  structs.SearchSquareMembersResponse searchSquareMembers(
    1: structs.SearchSquareMembersRequest request) throws (1: exceptions.SquareException e)

  structs.SearchSquaresResponse searchSquares(
    1: structs.SearchSquaresRequest request) throws (1: exceptions.SquareException e)

  structs.SendMessageResponse sendMessage(
    1: structs.SendMessageRequest request) throws (1: exceptions.SquareException e)

  structs.UpdateSquareResponse updateSquare(
    1: structs.UpdateSquareRequest request) throws (1: exceptions.SquareException e)

  structs.UpdateSquareAuthorityResponse updateSquareAuthority(
    1: structs.UpdateSquareAuthorityRequest request) throws (1: exceptions.SquareException e)

  structs.UpdateSquareChatResponse updateSquareChat(
    1: structs.UpdateSquareChatRequest request) throws (1: exceptions.SquareException e)

  structs.UpdateSquareChatMemberResponse updateSquareChatMember(
    1: structs.UpdateSquareChatMemberRequest request) throws (1: exceptions.SquareException e)

  structs.UpdateSquareFeatureSetResponse updateSquareFeatureSet(
    1: structs.UpdateSquareFeatureSetRequest request) throws (1: exceptions.SquareException e)

  structs.UpdateSquareMemberResponse updateSquareMember(
    1: structs.UpdateSquareMemberRequest request) throws (1: exceptions.SquareException e)

  structs.UpdateSquareMemberRelationResponse updateSquareMemberRelation(
    1: structs.UpdateSquareMemberRelationRequest request) throws (1: exceptions.SquareException e)

  structs.UpdateSquareMembersResponse updateSquareMembers(
    1: structs.UpdateSquareMembersRequest request) throws (1: exceptions.SquareException e)

}