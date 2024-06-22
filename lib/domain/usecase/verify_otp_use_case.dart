import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/model/ForgetPassword.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../repositoryContract/auth_repository.dart';

@injectable
class VerifyOTPUseCase {
  AuthRepository authRepository;

  @factoryMethod
  VerifyOTPUseCase(this.authRepository);

  Future<Either<Failures, ForgetPassword>> invoke(
      {required String email, required String code}) async {
    return await authRepository.verifyOTP(email: email, code: code);
  }
}
