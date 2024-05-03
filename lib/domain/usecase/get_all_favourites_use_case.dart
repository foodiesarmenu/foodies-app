import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../model/CheckFavourite.dart';
import '../model/Favourite.dart';
import '../repositoryContract/favourite_repository.dart';

@injectable
class GetAllFavouritesUseCase {
  FavouriteRepository favouriteRepository;

  @factoryMethod
  GetAllFavouritesUseCase(this.favouriteRepository);

  Future<Either<Failures, List<Favourite>>> invoke() async {
    return await favouriteRepository.getAllFavourites();
  }
}
