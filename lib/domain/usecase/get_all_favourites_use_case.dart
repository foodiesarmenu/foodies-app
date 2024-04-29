import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/FavouriteResponse.dart';
import '../repositoryContract/favourite_repository.dart';

@injectable
class GetAllFavouritesUseCase {
  FavouriteRepository favouriteRepository;

  @factoryMethod
  GetAllFavouritesUseCase(this.favouriteRepository);

  Future<Either<Failures, FavouriteResponse>> invoke() async {
    return await favouriteRepository.getAllFavourites();
  }
}
