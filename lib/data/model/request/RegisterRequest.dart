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
    this.countryCode,
    this.phoneNumber,
    this.password,
    this.gender,
    this.dateOfBirth,
  });

  RegisterRequest.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    countryCode = json['countryCode'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
  }

  String? name;
  String? email;
  String? countryCode;
  String? phoneNumber;
  String? password;
  String? gender;
  String? dateOfBirth;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['countryCode'] = countryCode;
    map['phoneNumber'] = phoneNumber;
    map['password'] = password;
    map['gender'] = gender;
    map['dateOfBirth'] = dateOfBirth;
    return map;
  }
}
