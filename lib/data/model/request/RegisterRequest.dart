/// name : "Yungy"
/// email : "yungy403@gmail.com"
/// countryCode : "202"
/// phoneNumber : "01234567890"
/// password : "Ehab123@"
/// gender : "Male"
/// dateOfBirth : "2024-02-29T19:58:34.230Z"

class RegisterRequest {
  RegisterRequest({
    this.name,
    this.email,
    this.phoneNumber,
    this.password,
  });

  RegisterRequest.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
  }

  String? name;
  String? email;
  String? phoneNumber;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['password'] = password;
    return map;
  }
}
