import 'package:votevoiceconnect/ecom/models/user.dart';
import 'package:votevoiceconnect/ecom/repository/repository.dart';

class UserService {
  Repository? _repository;

  UserService(){
    _repository = Repository();
  }

  createUser(User user) async {
    return await _repository!.httpPost('register', user.toJson());
  }

  login(User user) async {
    return await _repository!.httpPost('login', user.toJson());
  }
}