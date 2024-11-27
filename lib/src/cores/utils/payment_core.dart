import 'package:domain/domain.dart' as d;
import 'package:payment_core/payment_core.dart' as px;

extension PaymentTypeMapper on d.PaymentType{
  px.PaymentType get toPaymentCoreType{
    return px.PaymentType.values[index];
  }
}

extension PaymentCoreTypeMapper on px.PaymentType{
  d.PaymentType get toPaymentType{
    return d.PaymentType.values[index];
  }
}