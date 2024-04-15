import 'package:injectable/injectable.dart';

import '../../domain/model/Category.dart';
import '../../domain/repositoryContract/CategoriesRepo.dart';
import '../dataSourceContract/CategoriesDataSource.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl extends CategoriesRepo {
  CategoriesDataSource categoriesOnlineDataSource;

  @factoryMethod
  CategoriesRepoImpl(this.categoriesOnlineDataSource);

  @override
  Future<List<Category>?> getCategories() {
    return categoriesOnlineDataSource.getCategories();
  }
}
