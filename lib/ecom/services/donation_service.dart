import 'package:votevoiceconnect/ecom/models/donation.dart';
import 'package:votevoiceconnect/ecom/repository/repository.dart';

class DonationService {
  Repository? _repository;

  DonationService(){
    _repository = Repository();
  }

  addDonation(Donation donation) async {
    return await _repository!.httpPost('donation', donation.toJson());
  }
}