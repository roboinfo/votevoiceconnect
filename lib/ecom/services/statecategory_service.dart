import 'package:votevoiceconnect/ecom/repository/repository.dart';

class StateCategoryService {
  Repository? _repository;
  StateCategoryService(){
    _repository = Repository();
  }

  getStateCategories() async {
    return await _repository!.httpGet('stateCategories');
  }
}