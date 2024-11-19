abstract interface class IPayment {
  Future<void> sendRequest();

  Stream streamResult();
}