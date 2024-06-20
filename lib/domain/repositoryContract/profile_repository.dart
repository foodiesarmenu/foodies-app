import 'package:dartz/dartz.dart';

import '../failures.dart';
import '../model/User.dart';

abstract class ProfileRepository {
  Future<Either<Failures, User>> updateProfile({String? name, String? phone});

  Future<Either<Failures, User>> updatePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  });

  Future<Either<Failures, User>> updateProfileImage({required String image});

  Future<Either<Failures, User>> deleteProfilePicture();

  Future<Either<Failures, User>> deleteAccount();

  Future<Either<Failures, User>> getProfileData();
}
