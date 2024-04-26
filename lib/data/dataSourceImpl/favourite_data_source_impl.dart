import 'package:dartz/dartz.dart';
import 'package:foodies_app/data/api_manager.dart';
import 'package:foodies_app/data/dataSourceContract/favourite_data_source.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:foodies_app/domain/model/Favourite.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavouriteDataSource)
class FavouriteDataSourceImpl extends FavouriteDataSource {
  ApiManager apiManager;

  @factoryMethod
  FavouriteDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failures, Favourite>> addFavourite(
      {required String restaurantId}) async {
    var either = await apiManager.addToFavourite(restaurantId: restaurantId);

    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r.data!.toFavorite());
    });
  }

  @override
  Future<Either<Failures, Favourite>> isFavourite(String restaurantId) {
    // TODO: implement isFavourite
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, Favourite>> removeFavourite(String restaurantId) {
    // TODO: implement removeFavourite
    throw UnimplementedError();
  }
}
