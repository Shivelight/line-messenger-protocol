include "enums.thrift"
include "structs.thrift"
include "exceptions.thrift"

namespace py LineThrift.shop
namespace go LineThrift.shop

service ShopService {

  void buyCoinProduct(
    2: structs.PaymentReservation paymentReservation) throws (1: exceptions.TalkException e)

  void buyFreeProduct(
    2: string receiverMid,
    3: string productId,
    4: i32 messageTemplate,
    5: string language,
    6: string country,
    7: i64 packageId) throws (1: exceptions.TalkException e)

  void buyMustbuyProduct(
    2: string receiverMid,
    3: string productId,
    4: i32 messageTemplate,
    5: string language,
    6: string country,
    7: i64 packageId,
    8: string serialNumber) throws (1: exceptions.TalkException e)

  void checkCanReceivePresent(
    2: string recipientMid,
    3: i64 packageId,
    4: string language,
    5: string country) throws (1: exceptions.TalkException e)

  structs.ProductList getActivePurchases(
    2: i64 start,
    3: i32 size,
    4: string language,
    5: string country) throws (1: exceptions.TalkException e)

  structs.ProductSimpleList getActivePurchaseVersions(
    2: i64 start,
    3: i32 size,
    4: string language,
    5: string country) throws (1: exceptions.TalkException e)

  list<structs.CoinProductItem> getCoinProducts(
    2: enums.PaymentType appStoreCode,
    3: string country,
    4: string language) throws (1: exceptions.TalkException e)

  list<structs.CoinProductItem> getCoinProductsByPgCode(
    2: enums.PaymentType appStoreCode,
    3: enums.PaymentPgType pgCode,
    4: string country,
    5: string language) throws (1: exceptions.TalkException e)

  structs.CoinHistoryResult getCoinPurchaseHistory(
    2: structs.CoinHistoryCondition request) throws (1: exceptions.TalkException e)

  structs.CoinHistoryResult getCoinUseAndRefundHistory(
    2: structs.CoinHistoryCondition request) throws (1: exceptions.TalkException e)

  structs.ProductList getDownloads(
    2: i64 start,
    3: i32 size,
    4: string language,
    5: string country) throws (1: exceptions.TalkException e)

  structs.ProductList getEventPackages(
    2: i64 start,
    3: i32 size,
    4: string language,
    5: string country) throws (1: exceptions.TalkException e)

  structs.ProductList getNewlyReleasedPackages(
    2: i64 start,
    3: i32 size,
    4: string language,
    5: string country) throws (1: exceptions.TalkException e)

  structs.ProductList getPopularPackages(
    2: i64 start,
    3: i32 size,
    4: string language,
    5: string country) throws (1: exceptions.TalkException e)

  structs.ProductList getPresentsReceived(
    2: i64 start,
    3: i32 size,
    4: string language,
    5: string country) throws (1: exceptions.TalkException e)

  structs.ProductList getPresentsSent(
    2: i64 start,
    3: i32 size,
    4: string language,
    5: string country) throws (1: exceptions.TalkException e)

  structs.Product getProduct(
    2: i64 packageID,
    3: string language,
    4: string country) throws (1: exceptions.TalkException e)

  structs.ProductList getProductList(
    2: list<string> productIdList,
    3: string language,
    4: string country) throws (1: exceptions.TalkException e)

  structs.ProductList getProductListWithCarrier(
    2: list<string> productIdList,
    3: string language,
    4: string country,
    5: string carrierCode) throws (1: exceptions.TalkException e)

  structs.Product getProductWithCarrier(
    2: i64 packageID,
    3: string language,
    4: string country,
    5: string carrierCode) throws (1: exceptions.TalkException e)

  structs.ProductList getPurchaseHistory(
    2: i64 start,
    3: i32 size,
    4: string language,
    5: string country) throws (1: exceptions.TalkException e)

  structs.Coin getTotalBalance(
    2: enums.PaymentType appStoreCode) throws (1: exceptions.TalkException e)

  i64 notifyDownloaded(
    2: i64 packageId,
    3: string language) throws (1: exceptions.TalkException e)

  structs.PaymentReservationResult reserveCoinPurchase(
    2: structs.CoinPurchaseReservation request) throws (1: exceptions.TalkException e)

  structs.PaymentReservationResult reservePayment(
    2: structs.PaymentReservation paymentReservation) throws (1: exceptions.TalkException e)

}