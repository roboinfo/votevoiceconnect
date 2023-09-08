import 'package:votevoiceconnect/ecom/repository/repository.dart';

class SliderService {
  Repository? _repository;
  SliderService(){
    _repository = Repository();
  }

  getSliders() async {
    return await _repository!.httpGet('sliders');
  }
}