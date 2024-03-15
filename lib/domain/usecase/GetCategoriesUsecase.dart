import 'package:injectable/injectable.dart';

import '../model/Category.dart';
import '../repositoryContract/CategoriesRepo.dart';

@injectable
class GetCategoriesUsecase {
  CategoriesRepo categoriesRepo;

  @factoryMethod
  GetCategoriesUsecase(this.categoriesRepo);

  Future<List<Category>?> invoke() {
    return categoriesRepo.getCategories();
  }
}
