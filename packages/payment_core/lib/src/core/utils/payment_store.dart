import 'package:in_app_purchase/in_app_purchase.dart';

extension PaymentStore on InAppPurchase{
  Future<void> buyWithId(String id)async{
    final ProductDetailsResponse response = await queryProductDetails({id});

    response.checkResponse();

    final List<ProductDetails> productDetails = response.productDetails;

    final ProductDetails productDetail = productDetails[0];

    await buyNonConsumable(
      purchaseParam: PurchaseParam(
        productDetails: productDetail,
      ),
    );
  }
}

extension ProductDetailsResponseE on ProductDetailsResponse{
  void checkResponse(){
    if (error != null) {
      throw error!.message;
    }
  }
}