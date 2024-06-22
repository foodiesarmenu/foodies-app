import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/repositoryContract/profile_repository.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/User.dart';

@injectable
class UpdateProfileImageUseCase {
  ProfileRepository profileRepository;

  @factoryMethod
  UpdateProfileImageUseCase(this.profileRepository);

  Future<Either<Failures, User>> invoke({required String image}) async {
    return await profileRepository.updateProfileImage(image: image);
  }
}
