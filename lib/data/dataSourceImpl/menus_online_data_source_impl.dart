import 'package:foodies_app/domain/model/Menu.dart';
import 'package:injectable/injectable.dart';

import '../api_manager.dart';
import '../dataSourceContract/menus_data_source.dart';

@Injectable(as: MenusDataSource)
class MenusOnlineDataSourceImpl extends MenusDataSource {
  ApiManager apiManager;

  @factoryMethod
  MenusOnlineDataSourceImpl({required this.apiManager});

  @override
  Future<List<Menu>?> getMenus({String? restaurantId}) async {
    var response = await apiManager.getMenus(restaurantId: restaurantId);
    return response.data?.map((menuDto) => menuDto.toMenu()).toList();
  }
}
