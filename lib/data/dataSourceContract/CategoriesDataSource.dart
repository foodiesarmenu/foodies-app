import '../../domain/model/Category.dart';

abstract class CategoriesDataSource {
  Future<List<Category>?> getCategories();
}
