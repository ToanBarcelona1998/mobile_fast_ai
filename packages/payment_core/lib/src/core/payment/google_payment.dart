import 'payment.dart';

import 'package:in_app_purchase/in_app_purchase.dart';

final class GooglePayment implements IPayment {
  @override
  Future<void> sendRequest() async{
    final Set<String> ids = {};

    final InAppPurchase inAppPurchase = InAppPurchase.instance;

    final ProductDetailsResponse response = await inAppPurchase.queryProductDetails(ids);


    final List<ProductDetails> productDetails = response.productDetails;

    final ProductDetails productDetail = productDetails[0];

    await InAppPurchase.instance.buyNonConsumable(
      purchaseParam: PurchaseParam(
        productDetails: productDetail,
      ),
    );
  }

  @override
  Stream streamResult() {
    // TODO: implement streamResult
    throw UnimplementedError();
  }
}
