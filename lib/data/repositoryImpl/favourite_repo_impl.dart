import 'package:dartz/dartz.dart';
import 'package:foodies_app/data/dataSourceContract/favourite_data_source.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/Favourite.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositoryContract/favourite_repository.dart';

@Injectable(as: FavouriteRepository)
class FavouriteRepoImpl extends FavouriteRepository {
  FavouriteDataSource favouriteDataSource;

  @factoryMethod
  FavouriteRepoImpl(this.favouriteDataSource);

  @override
  Future<Either<Failures, Favourite>> addFavourite(
      {required String restaurantId}) async {
    return await favouriteDataSource.addFavourite(restaurantId: restaurantId);
  }

  @override
  Future<Either<Failures, Favourite>> getFavourites() {
    // TODO: implement getFavourites
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, Favourite>> removeFavourite(
      {required String restaurantId}) {
    // TODO: implement removeFavourite
    throw UnimplementedError();
  }
}
