import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/FavouriteResponse.dart';
import '../repositoryContract/favourite_repository.dart';

@injectable
class CheckFavouriteUseCase {
  FavouriteRepository favouriteRepository;

  @factoryMethod
  CheckFavouriteUseCase(this.favouriteRepository);

  Future<Either<Failures, FavouriteResponse>> invoke(
      {required String restaurantId}) async {
    return await favouriteRepository.checkFavourite(restaurantId: restaurantId);
  }
}
