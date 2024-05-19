import 'package:injectable/injectable.dart';

import '../model/Menu.dart';
import '../repositoryContract/menus_repo.dart';

@injectable
class GetMenusUsecase {
  MenusRepo menusRepo;

  @factoryMethod
  GetMenusUsecase(this.menusRepo);

  Future<List<Menu>?> invoke(String? restaurantId) {
    return menusRepo.getMenus(restaurantId: restaurantId);
  }
}
