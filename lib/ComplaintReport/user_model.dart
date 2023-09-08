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