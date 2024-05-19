import 'package:foodies_app/data/api_manager.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/Category.dart';
import '../dataSourceContract/categories_data_source.dart';

@Injectable(as: CategoriesDataSource)
class CategoriesOnlineDataSourceImpl extends CategoriesDataSource {
  ApiManager apiManager;

  @factoryMethod
  CategoriesOnlineDataSourceImpl(this.apiManager);

  @override
  Future<List<Category>?> getCategories() async {
    var response = await apiManager.getCategories();
    return response.data
        ?.map((categoryDto) => categoryDto.toCategory())
        .toList();
  }
}
