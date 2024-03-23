import '../../../../domain/model/AuthResult.dart';
import 'UserDto.dart';

/// user : {"_id":"65e0e4618e28dce090c547cc","email":"ehab@gmail.com","countryCode":"20","phoneNumber":"01157003360","type":"Client"}
/// accessToken : "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWUwZTQ2MThlMjhkY2UwOTBjNTQ3Y2MiLCJlbWFpbCI6ImVoYWJAZ21haWwuY29tIiwiY291bnRyeUNvZGUiOiIyMCIsInBob25lTnVtYmVyIjoiMDExNTcwMDMzNjAiLCJ0eXBlIjoiQ2xpZW50IiwiaWF0IjoxNzExMDc5MzAyLCJleHAiOjE3NDI2MzY5MDJ9.F-hjGfbQqD2LhVlsHaUCJtShTf1c8ukF42szukyLVMpmSMbsXWshF76eAZY3M8AAxDptkf5o5wTpgtPICRzC_V7j1S92nQtpzTbJEnaFgSSEs5dwqhGnUlr0_k8hTDV0D4A5B9r0H4pcJCOLbvZ46tZsmQWM90EeWRjVxzUGPe8MgWFYCBalDOWPoyYwbon7XvAZUu2jD8pLPwhapHqKiKJCpzumQEzuDpgWd5C3ktA-ujzsxOZW77i6pApSSNxXl24L1zaMiEOS4Pfq2HeBuupBEoAyf9bGbugfc-2_U6ZRsBfh178e1lcTDqLtfMc6yu8Wk8Xz_H7JTKmJsdf-Lw"

class LoginResponse {
  LoginResponse({
    this.user,
    this.accessToken,
    this.statusCode,
    this.message,
    this.error,
  });

  LoginResponse.fromJson(dynamic json) {
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
    statusCode = json['statusCode'];
    message = json['message'];
    error = json['error'];
  }

  UserDto? user;
  String? accessToken;
  num? statusCode;
  String? message;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['accessToken'] = accessToken;
    map['statusCode'] = statusCode;
    map['message'] = message;
    map['error'] = error;
    return map;
  }

  AuthResult toAuthResult() {
    return AuthResult(
      data: user?.toUser(),
      accessToken: accessToken,
    );
  }
}
