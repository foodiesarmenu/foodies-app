import 'package:dartz/dartz.dart';

import '../../domain/failures.dart';
import '../../domain/model/User.dart';

abstract class ProfileDataSource {
  Future<Either<Failures, User>> updateProfile(
      {required String name, required String email, required String phone});

  Future<Either<Failures, User>> updatePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  });

  Future<Either<Failures, User>> updateProfilePicture(
      {required String profilePicture});

  Future<Either<Failures, User>> deleteProfilePicture();

  Future<Either<Failures, User>> deleteAccount();

  Future<Either<Failures, User>> getProfileData();
}
