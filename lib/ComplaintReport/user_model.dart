class ComplaintReport {
  int? id;
  String? userName;
  String? blockcategory;
  String? complaintcategory;
  String? description;
  String? adress;
  String? adminComment;
  String? complaintStatus;
  String? complaintType;
  int? userId;
  String? created_at;



  toJson(){
    return {
      'id' : id.toString(),
      'userName' : userName.toString(),
      'blockcategory' : blockcategory.toString(),
      'complaintcategory' : complaintcategory.toString(),
      'description' : description,
      'adress' : adress,
      'adminComment': adminComment,
      'complaintStatus': complaintStatus.toString(),
      'complaintType': complaintType.toString(),
      'userId': userId.toString(),
      'created_at': created_at.toString(),


    };
  }
}

enum ComplaintStatus {
  PENDING,
  REJECTED,
  RESOLVED
}

final complaintStatusValues = EnumValues({
  "Pending": ComplaintStatus.PENDING,
  "Rejected": ComplaintStatus.REJECTED,
  "Resolved": ComplaintStatus.RESOLVED
});

enum ComplaintType {
  NON_VERIFIED,
  VERIFIED
}

final complaintTypeValues = EnumValues({
  "Non-Verified": ComplaintType.NON_VERIFIED,
  "Verified": ComplaintType.VERIFIED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

