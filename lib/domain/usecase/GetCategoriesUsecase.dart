import 'package:injectable/injectable.dart';

import '../model/Category.dart';
import '../repositoryContract/home_repository.dart';

@injectable
class GetCategoriesUsecase {
  HomeRepository categoriesRepo;

  @factoryMethod
  GetCategoriesUsecase(this.categoriesRepo);

  Future<List<Category>?> invoke() {
    return categoriesRepo.getCategories();
  }
}
