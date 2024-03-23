import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../domain/failures.dart';
import '../ui/utils/shared_preference_utils.dart';
import 'api_constants.dart';
import 'model/request/LoginRequest.dart';
import 'model/request/RegisterRequest.dart';
import 'model/response/auth_response/LoginResponse.dart';
import 'model/response/auth_response/RegisterResponse.dart';
import 'model/response/category_response/CategoriesResponse.dart';
import 'model/response/menu_response/MenusResponse.dart';
import 'model/response/restaurant_response/RestaurantsResponse.dart';

@singleton
@injectable
class ApiManager {
  Future<CategoriesResponse> getCategories() async {
    Uri uri = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.categoriesApi,
    );
    var response = await http.get(
      uri,
      headers: {'Authorization': ApiConstants.authorization},
    );
    var json = jsonDecode(response.body);
    var categoriesResponses = CategoriesResponse.fromJson(json);
    return categoriesResponses;
  }

  Future<RestaurantsResponse> getRestaurants({String? categoryId}) async {
    String catId = categoryId ?? "";
    Uri uri = Uri.https(
      ApiConstants.baseUrl,
      '${ApiConstants.restaurantsApi}$catId',
    );
    var response = await http.get(
      uri,
      headers: {'Authorization': ApiConstants.authorization},
    );
    var json = jsonDecode(response.body);
    var restaurantsResponses = RestaurantsResponse.fromJson(json);
    return restaurantsResponses;
  }

  Future<MenusResponse> getMenus({String? restaurantId}) async {
    Uri uri = Uri.https(
      ApiConstants.baseUrl,
      '${ApiConstants.menusApi}$restaurantId',
    );
    var response = await http.get(
      uri,
      headers: {'Authorization': ApiConstants.authorization},
    );
    var json = jsonDecode(response.body);
    var menusResponse = MenusResponse.fromJson(json);
    return menusResponse;
  }

  Future<Either<Failures, RegisterResponse>> register(
      String name, String email, String password, String phone) async {
    var url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);
    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var registerBody = RegisterRequest(
          name: name, email: email, password: password, phoneNumber: phone);

      var response = await http.post(url, body: registerBody.toJson());

      var registerResponse =
          RegisterResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(ServerError(
            errorMessage: registerResponse.error ?? registerResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check your internet connection'));
    }
  }

  Future<Either<Failures, LoginResponse>> login(
      String email, String password) async {
    var url = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.loginApi,
    );
    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var loginBody = LoginRequest(
        email: email,
        password: password,
      );

      var response = await http.post(url, body: loginBody.toJson());

      var loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        SharedPreferenceUtils.saveData(
            key: 'accessToken', value: loginResponse.accessToken);
        return Right(loginResponse);
      } else {
        return Left(ServerError(
            errorMessage: loginResponse.error ?? loginResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check your internet connection'));
    }
  }
}
