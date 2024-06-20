import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/model/ForgetPassword.dart';
import 'package:injectable/injectable.dart';

import '../../domain/failures.dart';
import '../../domain/model/AuthResult.dart';
import '../../domain/repositoryContract/auth_repository.dart';
import '../dataSourceContract/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepoImpl extends AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  @factoryMethod
  AuthRepoImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failures, AuthResult>> register(
      String name, String email, String password, String phone) {
    return authRemoteDataSource.register(name, email, password, phone);
  }

  @override
  Future<Either<Failures, AuthResult>> login(String email, String password) {
    return authRemoteDataSource.login(email, password);
  }

  @override
  Future<Either<Failures, AuthResult>> changePassword(
      {required String email,
      required String newPassword,
      required String confirmPassword}) {
    return authRemoteDataSource.changePassword(
        email: email,
        newPassword: newPassword,
        confirmPassword: confirmPassword);
  }

  @override
  Future<Either<Failures, ForgetPassword>> forgetPassword(
      {required String email}) {
    return authRemoteDataSource.forgetPassword(email: email);
  }

  @override
  Future<Either<Failures, ForgetPassword>> verifyOTP(
      {required String email, required String code}) {
    return authRemoteDataSource.verifyOTP(email: email, code: code);
  }
}
