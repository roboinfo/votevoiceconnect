import 'package:votevoiceconnect/ecom/repository/repository.dart';

class ComplaintCategoryService {
  Repository? _repository;
  ComplaintCategoryService(){
    _repository = Repository();
  }

  getComplaintCategories() async {
    return await _repository!.httpGet('complaintCategories');
  }
}