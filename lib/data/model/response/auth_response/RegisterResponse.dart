import '../../../../domain/model/AuthResult.dart';
import 'UserDto.dart';

/// success : true
/// data : {"name":"Yungy","email":"yungy403@gmail.com","countryCode":"202","phoneNumber":"01234567890","password":"$2b$12$ZeoG3.ZzCoeSu2pzHKZWZu.ppYzGpNFJV3ysuoDERg3bivIHyHGpe","gender":"Male","dateOfBirth":"2024-02-29T19:58:34.230Z"}

class RegisterResponse {
  RegisterResponse({
    this.success,
    this.data,
    this.statusCode,
    this.message,
    this.error,
  });

  RegisterResponse.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'] != null ? UserDto.fromJson(json['data']) : null;
    statusCode = json['statusCode'];
    message = json['message'];
    error = json['error'];
  }

  bool? success;
  UserDto? data;
  num? statusCode;
  String? message;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['statusCode'] = statusCode;
    map['message'] = message;
    map['error'] = error;
    return map;
  }

  AuthResult toAuthResult() {
    return AuthResult(
      success: success,
      data: data?.toUser(),
    );
  }
}
