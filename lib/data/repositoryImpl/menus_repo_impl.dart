import 'package:foodies_app/domain/model/Menu.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositoryContract/menus_repo.dart';
import '../dataSourceContract/menus_data_source.dart';

@Injectable(as: MenusRepo)
class MenusRepoImpl extends MenusRepo {
  MenusDataSource menusOnlineDataSource;

  @factoryMethod
  MenusRepoImpl(this.menusOnlineDataSource);

  @override
  Future<List<Menu>?> getMenus({String? restaurantId}) {
    return menusOnlineDataSource.getMenus(restaurantId: restaurantId);
  }
}
