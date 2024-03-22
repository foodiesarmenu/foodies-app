import 'User.dart';

/// success : true
/// data : {"name":"Yungy","email":"yungy403@gmail.com","countryCode":"202","phoneNumber":"01234567890","password":"$2b$12$ZeoG3.ZzCoeSu2pzHKZWZu.ppYzGpNFJV3ysuoDERg3bivIHyHGpe","gender":"Male","dateOfBirth":"2024-02-29T19:58:34.230Z"}

class AuthResult {
  AuthResult({
    this.success,
    this.data,
    this.accessToken,
  });

  bool? success;
  User? data;
  String? accessToken;
}
