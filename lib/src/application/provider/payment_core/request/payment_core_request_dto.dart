import 'package:payment_core/payment_core.dart';

extension CreateTransactionRequestDto on CreateTransactionRequest{
  Map<String,dynamic> toJson(){
    return {
      'package_id' : packageId,
      'method_id' : methodId,
    };
  }
}

extension CompleteTransactionRequestDto on CompleteTransactionRequest{
  Map<String,dynamic> toJson(){
    return {
      'transaction_id' : txId,
      'payment_type' : type,
      'verify_data' : verifyData,
    };
  }
}