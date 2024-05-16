import 'package:dartz/dartz.dart';
import 'package:foodies_app/data/api_manager.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/User.dart';
import 'package:injectable/injectable.dart';

import '../dataSourceContract/profile_data_source.dart';

@Injectable(as: ProfileDataSource)
class ProfileDataSourceImpl extends ProfileDataSource {
  ApiManager apiManager;

  @factoryMethod
  ProfileDataSourceImpl({required this.apiManager});

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
      required String confirmPassword}) async {
    var either = await apiManager.updatePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword);
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    }, (response) {
      return Right(response.data!.toUser());
    });
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

  @override
  Future<Either<Failures, User>> getProfileData() async {
    var either = await apiManager.getProfileData();
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    }, (response) {
      return Right(response.data!.toUser());
    });
  }
}
