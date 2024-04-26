import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/Favourite.dart';

abstract class FavouriteRepository {
  Future<Either<Failures, Favourite>> addFavourite(
      {required String restaurantId});

  Future<Either<Failures, Favourite>> removeFavourite(
      {required String restaurantId});

  Future<Either<Failures, Favourite>> getFavourites();
}
