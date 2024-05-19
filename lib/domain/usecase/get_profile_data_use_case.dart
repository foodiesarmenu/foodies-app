import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/repositoryContract/profile_repository.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/User.dart';

@injectable
class GetProfileDataUseCase {
  ProfileRepository profileRepository;

  @factoryMethod
  GetProfileDataUseCase(this.profileRepository);

  Future<Either<Failures, User>> invoke() async {
    return await profileRepository.getProfileData();
  }
}
