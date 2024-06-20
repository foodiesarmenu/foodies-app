import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/repositoryContract/profile_repository.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/User.dart';

@injectable
class ChangeEmailUseCase {
  ProfileRepository profileRepository;

  @factoryMethod
  ChangeEmailUseCase(this.profileRepository);

  Future<Either<Failures, User>> invoke({required String email}) async {
    return await profileRepository.changeEmail(email: email);
  }
}
