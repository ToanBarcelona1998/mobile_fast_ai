import 'package:payment_core/src/provider/local_storage.dart';
import 'package:payment_core/src/provider/transaction_provider.dart';

final class Payment {
  final TransactionProvider _transactionProvider;
  final LocalPaymentStorage _localPaymentStorage;

  const Payment(this._transactionProvider,this._localPaymentStorage);

  Future<void> buy()async{
    try{
      // Create transaction
      final createdTransaction = await _transactionProvider.createTransaction();

      // Save transaction to local storage
      await _localPaymentStorage.add();


    }catch(e){

    }
  }
}