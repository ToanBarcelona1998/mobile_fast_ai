import 'package:payment_core/src/core/entity/entity.dart';
import 'package:payment_core/src/core/utils/payment_store.dart';

import 'payment.dart';

import 'package:in_app_purchase/in_app_purchase.dart';
//import for SkuDetailsWrapper
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';



final class GooglePayment implements IPayment<StorePaymentRequest> {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  @override
  Future<void> request({
    required StorePaymentRequest request,
  }) async {
    await _inAppPurchase.buyWithId(request.id);
  }

  @override
  Future<String?> getVerifier() async{
    List<PurchaseDetails> purchaseDetails = await _inAppPurchase.purchaseStream.first;

    for (final purchaseDetail in purchaseDetails) {
      if (purchaseDetail.status == PurchaseStatus.canceled) {
        return null;
      }

      final PurchaseWrapper billing = (purchaseDetail as GooglePlayPurchaseDetails).billingClientPurchase;

      return billing.purchaseToken;
    }

    return null;
  }
}
