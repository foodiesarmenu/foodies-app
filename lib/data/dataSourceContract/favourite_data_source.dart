import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/Favourite.dart';

import '../../domain/model/FavouriteResponse.dart';

abstract class FavouriteDataSource {
  Future<Either<Failures, Favourite>> addToFavourite(
      {required String restaurantId});

  Future<Either<Failures, FavouriteResponse>> checkFavourite(
      {required String restaurantId});

  Future<Either<Failures, FavouriteResponse>> getAllFavourites();
}
