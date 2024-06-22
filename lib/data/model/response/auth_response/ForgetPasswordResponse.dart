import 'package:foodies_app/domain/model/ForgetPassword.dart';

/// message : "OTP verified"
/// to : "ehabtarek166@gmail.com"
/// success : true

class ForgetPasswordResponse {
  ForgetPasswordResponse({
    this.message,
    this.to,
    this.success,
    this.error,
    this.statusCode,
  });

  ForgetPasswordResponse.fromJson(dynamic json) {
    message = json['message'];
    to = json['to'];
    success = json['success'];
  }

  String? message;
  String? to;
  bool? success;
  String? error;
  String? statusCode;

  ForgetPassword toForgetPassword() {
    return ForgetPassword(
      message: message,
      to: to,
      success: success,
    );
  }
}
