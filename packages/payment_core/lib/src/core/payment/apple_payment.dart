import 'dart:io';

import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:payment_core/src/core/entity/entity.dart';
import 'package:payment_core/src/core/utils/payment_store.dart';

import 'payment.dart';

final class ApplePayment implements IPayment<StorePaymentRequest> {

  final InAppPurchase _inAppPurchase = InAppPurchase.instance;

  ///region xoá phiên giao dịch cũ trên ios
  Future<void> _clearPurchases() async {
    if (Platform.isIOS) {
      await _inAppPurchase.restorePurchases();

      final transactions = await SKPaymentQueueWrapper().transactions();

      if (transactions.isEmpty) return;

      for (final tran in transactions) {
        await SKPaymentQueueWrapper().finishTransaction(tran);
      }
    }
  }

  @override
  Future<void> request({
    required StorePaymentRequest request,
  }) async {
    final isAvailable = await _inAppPurchase.isAvailable();

    if (!isAvailable) {
      throw 'Store is not available';
    }

    await _clearPurchases();

    await _inAppPurchase.buyWithId(request.id);
  }

  @override
  Future<String?> getVerifier() async {
    await _inAppPurchase.purchaseStream.first;

    List<PurchaseDetails> purchaseDetails =
        await _inAppPurchase.purchaseStream.first;

    for (final purchaseDetail in purchaseDetails) {
      if (purchaseDetail.status == PurchaseStatus.canceled) {
        return null;
      }

      return purchaseDetail.verificationData.serverVerificationData;
    }

    return null;
  }
}
