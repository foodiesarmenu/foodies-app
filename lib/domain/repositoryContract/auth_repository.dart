import 'package:dartz/dartz.dart';
import '../failures.dart';
import '../model/AuthResult.dart';

abstract class AuthRepository {
  Future<Either<Failures, AuthResult>> register(
      String name, String email, String password, String phone);

  Future<Either<Failures, AuthResult>> login(String email, String password);
}
