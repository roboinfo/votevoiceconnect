import 'package:votevoiceconnect/ecom/models/shipping.dart';
import 'package:votevoiceconnect/ecom/repository/repository.dart';

class ShippingService {
  Repository? _repository;

  ShippingService(){
    _repository = Repository();
  }

  addShipping(Shipping shipping) async {
    return await _repository!.httpPost('shipping', shipping.toJson());
  }
}