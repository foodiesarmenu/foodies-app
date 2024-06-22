import '../../../../domain/model/User.dart';

/// name : "Yungy"
/// email : "yungy403@gmail.com"
/// countryCode : "202"
/// phoneNumber : "01234567890"
/// password : "$2b$12$ZeoG3.ZzCoeSu2pzHKZWZu.ppYzGpNFJV3ysuoDERg3bivIHyHGpe"
/// gender : "Male"
/// dateOfBirth : "2024-02-29T19:58:34.230Z"

class UserDto {
  UserDto({
    this.name,
    this.email,
    this.countryCode,
    this.phoneNumber,
    this.password,
    this.gender,
    this.dateOfBirth,
    this.image,
  });

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    countryCode = json['countryCode'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    image = json['image'];
  }

  String? name;
  String? email;
  String? countryCode;
  String? phoneNumber;
  String? password;
  String? gender;
  String? dateOfBirth;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['countryCode'] = countryCode;
    map['phoneNumber'] = phoneNumber;
    map['password'] = password;
    map['gender'] = gender;
    map['dateOfBirth'] = dateOfBirth;
    map['image'] = image;
    return map;
  }

  User toUser() {
    return User(
      name: name,
      email: email,
      countryCode: countryCode,
      phoneNumber: phoneNumber,
      password: password,
      dateOfBirth: dateOfBirth,
      gender: gender,
      image: image,
    );
  }
}
