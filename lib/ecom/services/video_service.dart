import 'package:votevoiceconnect/ecom/repository/repository.dart';

class VideoService {
  Repository? _repository;
  VideoService(){
    _repository = Repository();
  }

  getVideos() async {
    return await _repository!.httpGet('videos');
  }
}