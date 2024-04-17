import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/User.dart';
import '../repositoryContract/profile_repository.dart';

@injectable
class UpdatePasswordUseCase {
  ProfileRepository profileRepository;

  @factoryMethod
  UpdatePasswordUseCase(this.profileRepository);

  Future<Either<Failures, User>> invoke(
      {required String currentPassword,
      required String newPassword,
      required String confirmPassword}) async {
    return await profileRepository.updatePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword);
  }
}
