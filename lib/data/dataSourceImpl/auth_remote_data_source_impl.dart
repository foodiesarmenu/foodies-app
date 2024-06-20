import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/model/ForgetPassword.dart';
import 'package:injectable/injectable.dart';

import '../../domain/failures.dart';
import '../../domain/model/AuthResult.dart';
import '../api_manager.dart';
import '../dataSourceContract/auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  ApiManager apiManager;

  @factoryMethod
  AuthRemoteDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failures, AuthResult>> register(
      String name, String email, String password, String phone) async {
    var either = await apiManager.register(name, email, password, phone);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toAuthResult());
    });
  }

  @override
  Future<Either<Failures, AuthResult>> login(
      String email, String password) async {
    var either = await apiManager.login(email, password);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toAuthResult());
    });
  }

  @override
  Future<Either<Failures, AuthResult>> changePassword(
      {required String email,
      required String newPassword,
      required String confirmPassword}) async {
    var either =
        await apiManager.changePassword(email, newPassword, confirmPassword);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toAuthResult());
    });
  }

  @override
  Future<Either<Failures, ForgetPassword>> forgetPassword(
      {required String email}) async {
    var either = await apiManager.forgetPassword(email);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toForgetPassword());
    });
  }

  @override
  Future<Either<Failures, ForgetPassword>> verifyOTP(
      {required String email, required String code}) async {
    var either = await apiManager.verifyOTP(email, code);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toForgetPassword());
    });
  }
}
