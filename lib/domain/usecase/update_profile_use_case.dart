import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/repositoryContract/profile_repository.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/User.dart';

@injectable
class UpdateProfileUseCase {
  ProfileRepository profileRepository;

  @factoryMethod
  UpdateProfileUseCase(this.profileRepository);

  Future<Either<Failures, User>> invoke({String? name, String? phone}) async {
    return await profileRepository.updateProfile(name: name, phone: phone);
  }
}
