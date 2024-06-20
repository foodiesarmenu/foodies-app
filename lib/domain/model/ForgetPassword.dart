/// message : "OTP sent to your email"
/// to : "ehabtarek166@gmail.com"
/// success : true

class ForgetPassword {
  ForgetPassword({
    this.message,
    this.to,
    this.success,
  });

  ForgetPassword.fromJson(dynamic json) {
    message = json['message'];
    to = json['to'];
    success = json['success'];
  }

  String? message;
  String? to;
  bool? success;
}
