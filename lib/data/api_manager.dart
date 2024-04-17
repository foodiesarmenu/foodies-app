import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:foodies_app/data/model/response/profile_response/ProfileResponseDto.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:injectable/injectable.dart';

import '../domain/failures.dart';
import '../ui/utils/shared_preference_utils.dart';
import 'LoggingInterceptor.dart';
import 'api_constants.dart';
import 'model/request/LoginRequest.dart';
import 'model/request/RegisterRequest.dart';
import 'model/response/auth_response/LoginResponse.dart';
import 'model/response/auth_response/RegisterResponse.dart';
import 'model/response/cart_response/CartResponseDto.dart';
import 'model/response/category_response/CategoriesResponse.dart';
import 'model/response/menu_response/MenusResponse.dart';
import 'model/response/restaurant_response/RestaurantsResponse.dart';

@singleton
@injectable
class ApiManager {
  Client client = InterceptedClient.build(interceptors: [
    LoggingInterceptor(),
  ]);

  Future<CategoriesResponse> getCategories() async {
    Uri uri = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.categoriesApi,
    );
    var response = await client.get(
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
    var response = await client.get(
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
    var response = await client.get(
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

      var response = await client.post(url, body: registerBody.toJson());

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

      var response = await client.post(url, body: loginBody.toJson());

      var loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        SharedPreferenceUtils.saveData(
            key: 'token', value: loginResponse.accessToken);
        print('token: ${loginResponse.accessToken}');
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

  Future<Either<Failures, CartResponseDto>> addToCart(
      {required String mealId, required String restaurantId}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.cartApi);
    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi.
      var response = await client.post(url,
          body: {'meal': mealId, 'restaurant': restaurantId},
          headers: {'Authorization': ApiConstants.authorization});
      var cartResponseDto = CartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(cartResponseDto);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: cartResponseDto.message));
      } else {
        return Left(ServerError(errorMessage: cartResponseDto.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check your internet connection'));
    }
  }

  Future<Either<Failures, CartResponseDto>> getCart() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.cartApi);
    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi.
      var response = await client
          .get(url, headers: {'Authorization': ApiConstants.authorization});
      var cartResponse = CartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(cartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: cartResponse.message));
      } else {
        return Left(ServerError(errorMessage: cartResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check your internet connection'));
    }
  }

  Future<Either<Failures, CartResponseDto>> removeItemFromCart(
      {required String mealId}) async {
    Uri url =
        Uri.https(ApiConstants.baseUrl, '${ApiConstants.cartApi}/$mealId');
    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi.
      var response = await client
          .delete(url, headers: {'Authorization': ApiConstants.authorization});
      var cartResponse = CartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(cartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: cartResponse.message));
      } else {
        return Left(ServerError(errorMessage: cartResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check your internet connection'));
    }
  }

  Future<Either<Failures, CartResponseDto>> updateCountInCart(
      {required String mealId, required int quantity}) async {
    Uri url =
        Uri.https(ApiConstants.baseUrl, '${ApiConstants.cartApi}/$mealId');
    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi.
      var response = await client.patch(url,
          body: {'quantity': '$quantity'},
          headers: {'Authorization': ApiConstants.authorization});
      var cartResponse = CartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(cartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: cartResponse.message));
      } else {
        return Left(ServerError(errorMessage: cartResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check your internet connection'));
    }
  }

  Future<Either<Failures, CartResponseDto>> deleteCart() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.cartApi);
    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi.
      var response = await client
          .delete(url, headers: {'Authorization': ApiConstants.authorization});
      var cartResponse = CartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(cartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: cartResponse.message));
      } else {
        return Left(ServerError(errorMessage: cartResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check your internet connection'));
    }
  }

  Future<Either<Failures, ProfileResponseDto>> updatePassword(
      {required String currentPassword,
      required String newPassword,
      required String confirmPassword}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.updatePasswordApi);
    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi.
      var response = await client.patch(url, body: {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword
      }, headers: {
        'Authorization': ApiConstants.authorization
      });
      var profileResponse =
          ProfileResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(profileResponse);
      } else {
        return Left(ServerError(errorMessage: profileResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check your internet connection'));
    }
  }
}
