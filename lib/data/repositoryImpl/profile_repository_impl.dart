import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/User.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositoryContract/profile_repository.dart';
import '../dataSourceContract/profile_data_source.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  ProfileDataSource profileDataSource;

  @factoryMethod
  ProfileRepositoryImpl({required this.profileDataSource});

  @override
  Future<Either<Failures, User>> deleteAccount() {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, User>> deleteProfilePicture() {
    // TODO: implement deleteProfilePicture
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, User>> updatePassword(
      {required String currentPassword,
      required String newPassword,
      required String confirmPassword}) {
    return profileDataSource.updatePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword);
  }

  @override
  Future<Either<Failures, User>> updateProfile(
      {required String name, required String email, required String phone}) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, User>> updateProfilePicture(
      {required String profilePicture}) {
    // TODO: implement updateProfilePicture
    throw UnimplementedError();
  }
}
