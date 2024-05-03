import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:foodies_app/data/model/response/favourite_response/FavouriteResponseDto.dart';
import 'package:foodies_app/data/model/response/profile_response/ProfileResponseDto.dart';
import 'package:foodies_app/domain/model/DeliveryAddress.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:injectable/injectable.dart';
import '../domain/failures.dart';
import '../ui/utils/shared_preference_utils.dart';
import 'LoggingInterceptor.dart';
import 'api_constants.dart';
import 'model/request/LoginRequest.dart';
import 'model/request/RegisterRequest.dart';
import 'model/request/payment_intent_input_model.dart';
import 'model/response/auth_response/LoginResponse.dart';
import 'model/response/auth_response/RegisterResponse.dart';
import 'model/response/category_response/CategoriesResponse.dart';
import 'model/response/favourite_response/FavouriteDto.dart';
import 'model/response/menu_response/MenusResponse.dart';
import 'model/response/online_order_response/OnlineOrderPaymentDto.dart';
import 'model/response/order_cart_response/OrderResponseDto.dart';
import 'model/response/order_cart_response/OrdersResponseDto.dart';
import 'model/response/payment_intent_model_response/PaymentIntentModel.dart';
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

  Future<Either<Failures, OrderResponseDto>> addToCart(
      {required String mealId, required String restaurantId,required int quantity, required String size}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.cartApi);

    Map<String, dynamic> requestBody = {
      "meal": mealId,
      "restaurant": restaurantId,
      "quantity": quantity,
      "size": size,
    };

    print(jsonEncode(requestBody)); // Print the requestBody

    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi.


      var response = await client.post(url,
          body: jsonEncode(requestBody),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': ApiConstants.authorization});
      var cartResponseDto = OrderResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(cartResponseDto);
      } else {
        print(cartResponseDto.message);
        return Left(ServerError(errorMessage: cartResponseDto.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check your internet connection'));
    }
  }

  Future<Either<Failures, OrderResponseDto>> getCart() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.cartApi);
    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi.
      var response = await client
          .get(url, headers: {'Authorization': ApiConstants.authorization});
      var cartResponse = OrderResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(cartResponse);
      } else {
        return Left(ServerError(errorMessage: cartResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check your internet connection'));
    }
  }

  Future<Either<Failures, OrderResponseDto>> removeItemFromCart(
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
      var cartResponse = OrderResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(cartResponse);
      } else {
        return Left(ServerError(errorMessage: cartResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check your internet connection'));
    }
  }


  Future<Either<Failures, OrderResponseDto>> updateCountInCart(
      {required String mealId, required int quantity,required String size}) async {
    Uri url =
        Uri.https(ApiConstants.baseUrl, '${ApiConstants.cartApi}/$mealId');
    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    Map<String, dynamic> requestBody = {
        "quantity": quantity,
        "size": size,
    };

    print(jsonEncode(requestBody)); // Print the requestBody
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
 //      var mealBody = AddMealRequest(
 //          quantity: quantity.toString(), // Convert quantity to string
 // size: size
 //      );
      // I am connected to a mobile network or wifi.
      //print('Request Body: ${mealBody.toJson()}'); // Print the request body
      var response = await client.patch(url,
          body: jsonEncode(requestBody),
          headers: {
        'Content-Type': 'application/json',
          'Authorization': ApiConstants.authorization});

      var cartResponse = OrderResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(cartResponse);
      } else {
        print(cartResponse.message);
        return Left(ServerError(errorMessage: cartResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check your internet connection'));
    }
  }

  Future<Either<Failures, OrderResponseDto>> deleteCart() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.cartApi);
    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi.
      var response = await client
          .delete(url, headers: {'Authorization': ApiConstants.authorization});
      var cartResponse = OrderResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(cartResponse);
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

  Future<Either<Failures, OnlineOrderPaymentDto>> createOnlineOrder(
      {required DeliveryAddress deliveryAddress}) async {
    Uri url =
        Uri.https(ApiConstants.baseUrl, ApiConstants.createOnlineOrderApi);
    Map<String, dynamic> requestBody = {
      "deliveryAddress": {
        "firstAddress": deliveryAddress.firstAddress,
        "secondAddress": deliveryAddress.secondAddress,
        "buildingNumber": deliveryAddress.buildingNumber,
        "streetName": deliveryAddress.streetName,
        "floorNumber": deliveryAddress.floorNumber,
        "apartmentNumber": deliveryAddress.apartmentNumber,
        "note": deliveryAddress.note
      }
    };

    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi.
      var response = await client.post(url,
          body: jsonEncode(requestBody),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': ApiConstants.authorization
          });

      print(jsonEncode(requestBody));

      var onlineResponseDto =
          OnlineOrderPaymentDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(onlineResponseDto);
      } else {
        print(onlineResponseDto.message);
        return Left(ServerError(errorMessage: onlineResponseDto.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check your internet connection'));
    }
  }

  Future<Either<Failures, OrderResponseDto>> createCashOrder(
      {required DeliveryAddress deliveryAddress}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.createCashOrderApi);

    Map<String, dynamic> requestBody = {
      "deliveryAddress": {
        "firstAddress": deliveryAddress.firstAddress,
        "secondAddress": deliveryAddress.secondAddress,
        "buildingNumber": deliveryAddress.buildingNumber,
        "streetName": deliveryAddress.streetName,
        "floorNumber": deliveryAddress.floorNumber,
        "apartmentNumber": deliveryAddress.apartmentNumber,
        "note": deliveryAddress.note,
      }
    };

    //print(requestBody); // Print the requestBody
    //print(jsonEncode(requestBody)); // Print the requestBody

    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi.
      var response = await client.post(url,
          body: jsonEncode(requestBody),
          // Encode the requestBody to JSON
          headers: {
            'Content-Type': 'application/json',
            'Authorization': ApiConstants.authorization
          });

      var cashResponseDto =
      OrderResponseDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(cashResponseDto);
      } else {
        return Left(ServerError(errorMessage: cashResponseDto.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check your internet connection'));
    }
  }

  Future<Either<Failures, PaymentIntentModel>> createPaymentIntent(
      {required String amount, required String currency}) async {
    Uri url =
        Uri.https(ApiConstants.stripeUrl, ApiConstants.makeOnlineOrderApi);

    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    var paymentIntentInputModel =
        PaymentIntentInputModel(amount: amount, currency: currency);
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi.
      var response = await client.post(
        url,
        body: paymentIntentInputModel.toJson(),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': ApiConstants.stripeSecretKey
        },
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var paymentIntentModel =
            PaymentIntentModel.fromJson(jsonDecode(response.body));
        return Right(paymentIntentModel);
      } else {
        var paymentIntentModel =
            PaymentIntentModel.fromJson(jsonDecode(response.body));
        return Left(
            ServerError(errorMessage: paymentIntentModel.error?.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check your internet connection'));
    }
  }

  Future<Either<Failures, FavouriteDto>> addToFavourite(
      {required String restaurantId}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.favourite);

    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi.
      var response = await client.post(url,
          body: {"restaurant": restaurantId},
          // Encode the requestBody to JSON
          headers: {'Authorization': ApiConstants.authorization});

      var favouriteDto = FavouriteDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(favouriteDto);
      } else {
        return Left(ServerError(errorMessage: favouriteDto.error));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check your internet connection'));
    }
  }

  Future<Either<Failures, FavouriteResponseDto>> getAllFavourites() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.favourite);
    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi.
      var response = await client
          .get(url, headers: {'Authorization': ApiConstants.authorization});
      var favouriteResponse =
          FavouriteResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(favouriteResponse);
      } else {
        return Left(ServerError(errorMessage: favouriteResponse.error));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check your internet connection'));
    }
  }

  Future<Either<Failures, FavouriteResponseDto>> checkFavourite(
      {required String restaurantId}) async {
    Uri url = Uri.https(
        ApiConstants.baseUrl, '${ApiConstants.checkFavourite}/$restaurantId');

    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi.
      var response = await client
          .get(url, headers: {'Authorization': ApiConstants.authorization});

      var favouriteResponseDto =
          FavouriteResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(favouriteResponseDto);
      } else {
        return Left(ServerError(errorMessage: favouriteResponseDto.error));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check your internet connection'));
    }
  }

  Future<Either<Failures, OrderResponseDto>> getOrder({required String orderId}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, '${ApiConstants.orderApi}/$orderId');
    final ConnectivityResult connectivityResult =
    await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi.
      var response = await client
          .get(url, headers: {'Authorization': ApiConstants.authorization});
      var orderResponse = OrderResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(orderResponse);
      } else {
        return Left(ServerError(errorMessage: orderResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check your internet connection'));
    }
  }

  Future<Either<Failures, OrdersResponseDto>> getAllOrders() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.orderApi);
    final ConnectivityResult connectivityResult =
    await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi.
      var response = await client
          .get(url, headers: {'Authorization': ApiConstants.authorization});
      var ordersResponse = OrdersResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(ordersResponse);
      } else {
        return Left(ServerError(errorMessage: ordersResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check your internet connection'));
    }
  }

}
