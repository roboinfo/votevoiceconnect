import 'package:votevoiceconnect/ComplaintReport/complaint.dart';
import 'package:votevoiceconnect/ecom/models/donation.dart';
import 'package:votevoiceconnect/ecom/repository/repository.dart';

class ComplaintService {
  Repository? _repository;

  ComplaintService(){
    _repository = Repository();
  }

  addComplaint(Complaint complaint) async {
    return await _repository!.httpPost('complaints', complaint.toJson());
  }

  getComplaintsByUserId(int userId) async{
    return await _repository!.httpGetById('get-complaint-by-user-id', userId);
  }

  getComplaint() async {
    return await _repository!.httpGet('complaint');
  }

}