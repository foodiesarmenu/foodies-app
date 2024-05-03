import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/Favourite.dart';

import '../model/CheckFavourite.dart';

abstract class FavouriteRepository {
  Future<Either<Failures, Favourite>> addToFavourite(
      {required String restaurantId});

  Future<Either<Failures, List<Favourite>>> getAllFavourites();

  Future<Either<Failures, CheckFavourite>> checkFavourite(
      {required String restaurantId});
}
