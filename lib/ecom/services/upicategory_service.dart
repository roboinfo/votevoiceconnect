import 'package:votevoiceconnect/ecom/repository/repository.dart';

class UpiCategoryService {
  Repository? _repository;
  UpiCategoryService(){
    _repository = Repository();
  }

  getUpiCategories() async {
    return await _repository!.httpGet('upiCategories');
  }
}