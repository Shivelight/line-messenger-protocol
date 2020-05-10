include "../Common/_structs.thrift"
include "../Common/_exceptions.thrift"

namespace py LineThrift.accountsupervisor
namespace go LineThrift.accountsupervisor

service AccountSupervisorService {

  _structs.RSAKey getRSAKey() throws (1: _exceptions.TalkException e)

  void notifyEmailConfirmationResult(
    2: map<string, string> parameterMap) throws (1: _exceptions.TalkException e)

  string registerVirtualAccount(
    2: string locale,
    3: string encryptedVirtualUserId,
    4: string encryptedPassword) throws (1: _exceptions.TalkException e)

  void requestVirtualAccountPasswordChange(
    2: string virtualMid,
    3: string encryptedVirtualUserId,
    4: string encryptedOldPassword,
    5: string encryptedNewPassword) throws (1: _exceptions.TalkException e)

  void requestVirtualAccountPasswordSet(
    2: string virtualMid,
    3: string encryptedVirtualUserId,
    4: string encryptedNewPassword) throws (1: _exceptions.TalkException e)

  void unregisterVirtualAccount(
    2: string virtualMid) throws (1: _exceptions.TalkException e)

}