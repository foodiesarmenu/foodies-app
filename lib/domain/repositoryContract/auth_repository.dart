import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/model/ForgetPassword.dart';

import '../failures.dart';
import '../model/AuthResult.dart';

abstract class AuthRepository {
  Future<Either<Failures, AuthResult>> register(
      String name, String email, String password, String phone);

  Future<Either<Failures, AuthResult>> login(String email, String password);

  Future<Either<Failures, ForgetPassword>> forgetPassword(
      {required String email});

  Future<Either<Failures, ForgetPassword>> verifyOTP(
      {required String email, required String code});

  Future<Either<Failures, AuthResult>> changePassword(
      {required String email,
      required String newPassword,
      required String confirmPassword});
}
