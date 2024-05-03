import 'package:dartz/dartz.dart';
import 'package:foodies_app/data/api_manager.dart';
import 'package:foodies_app/data/dataSourceContract/favourite_data_source.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/Favourite.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/CheckFavourite.dart';

@Injectable(as: FavouriteDataSource)
class FavouriteDataSourceImpl extends FavouriteDataSource {
  ApiManager apiManager;

  @factoryMethod
  FavouriteDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failures, Favourite>> addToFavourite(
      {required String restaurantId}) async {
    var either = await apiManager.addToFavourite(restaurantId: restaurantId);

    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r.toFavourite());
    });
  }

  @override
  Future<Either<Failures, CheckFavourite>> checkFavourite(
      {required String restaurantId}) async {
    var either = await apiManager.checkFavourite(restaurantId: restaurantId);

    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r.toFavouriteResponse());
    });
  }

  @override
  Future<Either<Failures, List<Favourite>>> getAllFavourites() async {
    var either = await apiManager.getAllFavourites();

    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r.data?.map((e) => e.toFavourite()).toList() ?? []);
    });
  }
}
