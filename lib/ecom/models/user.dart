

class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? device_token;


  toJson(){
    return {
      'id' : id.toString(),
      'name' : name.toString(),
      'email' : email.toString(),
      'password' : password.toString(),
      'device_token' : device_token.toString(),
    };
  }
}