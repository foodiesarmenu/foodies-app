import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/model/ForgetPassword.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../repositoryContract/auth_repository.dart';

@injectable
class ForgetPasswordUseCase {
  AuthRepository authRepository;

  @factoryMethod
  ForgetPasswordUseCase(this.authRepository);

  Future<Either<Failures, ForgetPassword>> invoke(
      {required String email}) async {
    return await authRepository.forgetPassword(email: email);
  }
}
