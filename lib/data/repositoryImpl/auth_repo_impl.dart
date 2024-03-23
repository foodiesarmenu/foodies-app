import 'package:dartz/dartz.dart';
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
}
