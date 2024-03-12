import '../model/Category.dart';

abstract class CategoriesRepo {
  Future<List<Category>?> getCategories();
}
