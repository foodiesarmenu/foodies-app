import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/AuthResult.dart';
import '../repositoryContract/auth_repository.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;

  @factoryMethod
  RegisterUseCase(this.authRepository);

  Future<Either<Failures, AuthResult>> invoke(
      String name, String email, String password, String phone) {
    return authRepository.register(name, email, password, phone);
  }
}
