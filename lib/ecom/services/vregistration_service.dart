import 'package:votevoiceconnect/ecom/models/vregistration.dart';
import 'package:votevoiceconnect/ecom/repository/repository.dart';

class RegistrationService {
  Repository? _repository;

  RegistrationService(){
    _repository = Repository();
  }

  addRegistration(Registration registration) async {
    return await _repository!.httpPost('registration', registration.toJson());
  }
}