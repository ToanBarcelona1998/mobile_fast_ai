import 'obj_transaction.dart';
import 'package:objectbox/objectbox.dart';
import 'package:payment_core/payment_core.dart';

final class LocalTransactionProvider implements LocalPaymentStorage {
  final Store _store;

  const LocalTransactionProvider(this._store);

  Box<OTransaction> get _tx => _store.box<OTransaction>();

  @override
  Future<void> add({required CoreTransaction tx}) async {
    _tx.put(
      tx.toOTx,
    );
  }

  @override
  Future<void> delete(int id) async{
    _tx.remove(id);
  }

  @override
  Future<void> deleteAll() async{
    _tx.removeAll();
  }

  @override
  Future<CoreTransaction?> get(int id) async{
    final oTx = _tx.get(id);

    return oTx?.toCoreTx;
  }

  @override
  Future<List<CoreTransaction>> getAll() async{
    final txs = _tx.getAll();

    return txs.map((e) => e.toCoreTx,).toList();
  }
}
