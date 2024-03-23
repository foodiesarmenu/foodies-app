import 'package:dartz/dartz.dart';

import '../../domain/failures.dart';
import '../../domain/model/AuthResult.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, AuthResult>> register(
      String name, String email, String password, String phone);

  Future<Either<Failures, AuthResult>> login(String email, String password);
}
