import '../auth_response/UserDto.dart';

/// success : true
/// data : {"_id":"65febe55dfd1d02c2de022ab","name":"Yehya","email":"yehya404@gmail.com","phoneNumber":"0127858443","password":"$2b$10$ppnI.dV1MJJqlNLYfkQ/XOtSPBN1EzPxJPHoIdrTOH0couzQkGprq","isDeleted":false,"isEmailVerified":false,"isPhoneVerified":false,"type":"Client","isActive":true,"createdAt":"2024-03-23T11:34:45.299Z","updatedAt":"2024-04-15T16:42:29.811Z","__v":0}

class ProfileResponseDto {
  ProfileResponseDto({
    this.success,
    this.data,
    this.statusCode,
    this.message,
    this.error,
  });

  ProfileResponseDto.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'] != null ? UserDto.fromJson(json['data']) : null;
    statusCode = json['statusCode'];
    error = json['error'];
    message = json['message'];
  }

  bool? success;
  UserDto? data;
  int? statusCode;
  String? message;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['statusCode'] = statusCode;
    map['error'] = error;
    map['message'] = message;

    return map;
  }
}
