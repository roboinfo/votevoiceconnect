import 'package:votevoiceconnect/ecom/models/payment.dart';
import 'package:votevoiceconnect/ecom/repository/repository.dart';

class PaymentService {
  Repository? _repository;

  PaymentService(){
    _repository = Repository();
  }

  makePayment(Payment payment) async {
    return await _repository!.httpPost('make-payment', payment.toJson());
  }
}