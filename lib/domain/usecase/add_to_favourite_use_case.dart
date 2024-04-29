import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/Favourite.dart';
import '../repositoryContract/favourite_repository.dart';

@injectable
class AddToFavouriteUseCase {
  FavouriteRepository favouriteRepository;

  @factoryMethod
  AddToFavouriteUseCase(this.favouriteRepository);

  Future<Either<Failures, Favourite>> invoke(
      {required String restaurantId}) async {
    return await favouriteRepository.addToFavourite(restaurantId: restaurantId);
  }
}
