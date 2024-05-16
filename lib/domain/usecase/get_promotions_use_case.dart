import 'package:dartz/dartz.dart';
import 'package:foodies_app/domain/failures.dart';
import 'package:injectable/injectable.dart';

import '../model/Promotion.dart';
import '../repositoryContract/home_repository.dart';

@injectable
class GetPromotionsUseCase {
  HomeRepository homeRepository;

  @factoryMethod
  GetPromotionsUseCase(this.homeRepository);

  Future<Either<Failures, List<Promotion>>> invoke() {
    return homeRepository.getAllPromotions();
  }
}
