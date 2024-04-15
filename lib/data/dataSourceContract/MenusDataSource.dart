import '../../domain/model/Menu.dart';

abstract class MenusDataSource {
  Future<List<Menu>?> getMenus({String? restaurantId});
}
