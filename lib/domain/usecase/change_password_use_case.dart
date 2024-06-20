import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/model/AuthResult.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../repositoryContract/auth_repository.dart';

@injectable
class ChangePasswordUseCase {
  AuthRepository authRepository;

  @factoryMethod
  ChangePasswordUseCase(this.authRepository);

  Future<Either<Failures, AuthResult>> invoke(
      {required String email,
      required String newPassword,
      required String confirmPassword}) async {
    return await authRepository.changePassword(
        email: email,
        newPassword: newPassword,
        confirmPassword: confirmPassword);
  }
}
