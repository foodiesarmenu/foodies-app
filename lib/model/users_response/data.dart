/// _id : "65e0e4618e28dce090c547cc"
/// name : "ehah"
/// email : "ehab@gmail.com"
/// countryCode : "20"
/// phoneNumber : "01157003360"
/// password : "$2b$12$6l6CvlcfuDDaCCTTSVS4quMYhWioUE6pztgJtVVK6eEucTbfXxorO"
/// gender : "Male"
/// isDeleted : false
/// isEmailVerified : false
/// isPhoneVerified : false
/// dateOfBirth : "2024-02-29T19:58:34.230Z"
/// type : "Client"
/// isActive : true
/// createdAt : "2024-02-29T20:09:05.074Z"
/// updatedAt : "2024-02-29T20:09:05.074Z"
/// __v : 0

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.countryCode,
    this.phoneNumber,
    this.password,
    this.gender,
    this.isDeleted,
    this.isEmailVerified,
    this.isPhoneVerified,
    this.dateOfBirth,
    this.type,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Data.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    countryCode = json['countryCode'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    gender = json['gender'];
    isDeleted = json['isDeleted'];
    isEmailVerified = json['isEmailVerified'];
    isPhoneVerified = json['isPhoneVerified'];
    dateOfBirth = json['dateOfBirth'];
    type = json['type'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
  String? name;
  String? email;
  String? countryCode;
  String? phoneNumber;
  String? password;
  String? gender;
  bool? isDeleted;
  bool? isEmailVerified;
  bool? isPhoneVerified;
  String? dateOfBirth;
  String? type;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? v;

  Data copyWith({
    String? id,
    String? name,
    String? email,
    String? countryCode,
    String? phoneNumber,
    String? password,
    String? gender,
    bool? isDeleted,
    bool? isEmailVerified,
    bool? isPhoneVerified,
    String? dateOfBirth,
    String? type,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) =>
      Data(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        countryCode: countryCode ?? this.countryCode,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        gender: gender ?? this.gender,
        isDeleted: isDeleted ?? this.isDeleted,
        isEmailVerified: isEmailVerified ?? this.isEmailVerified,
        isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        type: type ?? this.type,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['countryCode'] = countryCode;
    map['phoneNumber'] = phoneNumber;
    map['password'] = password;
    map['gender'] = gender;
    map['isDeleted'] = isDeleted;
    map['isEmailVerified'] = isEmailVerified;
    map['isPhoneVerified'] = isPhoneVerified;
    map['dateOfBirth'] = dateOfBirth;
    map['type'] = type;
    map['isActive'] = isActive;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
