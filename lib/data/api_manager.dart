import 'dart:convert';

import 'package:foodies_app/data/model/menu_response/MenusResponse.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'model/category_response/CategoriesResponse.dart';
import 'model/restaurant_response/RestaurantsResponse.dart';

@singleton
@injectable
class ApiManager {
  static const String baseUrl = 'foodies-backend-1.onrender.com';
  static const String authorization =
      'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWRiNTg4NWY3NTE1YTJjODcxOTBiN2MiLCJlbWFpbCI6ImFobWVkQGdtYWlsLmNvbSIsImNvdW50cnlDb2RlIjoiMjAiLCJwaG9uZU51bWJlciI6IjAxMiIsInR5cGUiOiJDbGllbnQiLCJpYXQiOjE3MDg5NjgyNTcsImV4cCI6MTc0MDUyNTg1N30.DfBbDEfGy8OTUT-D1zM673ZZ2Kwvc0hQPXxO57xkuu1HhY8kYx2uIMSMuWe70usooSBxkKn1cYxqcfCzKirAHkP9EAa_Mvn8pbajlnzSAEA-ghiawjodFK_GBc_qVBR9nfGA62I-zzt9Q0IpGOMRawNJwuFpIzIaOy079wfDL4SEPIvBBcIHMfvl7qaEpY13l910xcuxWmfm2nqlfgqiMf8f4lU1Z_76WkbxF9kBAfHGTzJqOzaK6KoL2_gTOWsXLvsGowokICIVmm-MACK5urmDEXV-yh5VWTaB-y5K5sUEBX9Jx9lWRq-jqNIqG8oXXAaAc4572E2Qj6xycaVZ0g';

  Future<CategoriesResponse> getCategories() async {
    Uri uri = Uri.https(
      baseUrl,
      '/mobile/category',
    );
    var response = await http.get(
      uri,
      headers: {'Authorization': authorization},
    );
    var json = jsonDecode(response.body);
    var categoriesResponses = CategoriesResponse.fromJson(json);
    return categoriesResponses;
  }

  Future<RestaurantsResponse> getRestaurants({String? categoryId}) async {
    String catId = categoryId ?? "";
    Uri uri = Uri.https(
      baseUrl,
      '/mobile/restaurant/$catId',
    );
    var response = await http.get(
      uri,
      headers: {'Authorization': authorization},
    );
    var json = jsonDecode(response.body);
    var restaurantsResponses = RestaurantsResponse.fromJson(json);
    return restaurantsResponses;
  }

  Future<MenusResponse> getMenus({String? restaurantId}) async {
    Uri uri = Uri.https(
      baseUrl,
      '/mobile/restaurant/menu/$restaurantId',
    );
    var response = await http.get(
      uri,
      headers: {'Authorization': authorization},
    );
    var json = jsonDecode(response.body);
    var menusResponse = MenusResponse.fromJson(json);
    return menusResponse;
  }
}
