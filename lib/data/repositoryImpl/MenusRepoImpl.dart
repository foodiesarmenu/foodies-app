import 'package:foodies_app/domain/model/Menu.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositoryContract/MenusRepo.dart';
import '../dataSourceContract/MenusDataSource.dart';

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
