import '../model/Menu.dart';

abstract class MenusRepo {
  Future<List<Menu>?> getMenus({String? restaurantId});
}
