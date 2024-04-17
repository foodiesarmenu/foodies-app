import '../ui/utils/shared_preference_utils.dart';

class ApiConstants {
//https://foodies-backend-1.onrender.com/mobile/category
//https://foodies-backend-1.onrender.com/mobile/restaurant/
//https://foodies-backend-1.onrender.com/mobile/restaurant/menu/
//https://foodies-backend-1.onrender.com/mobile/client
//https://foodies-backend-1.onrender.com/mobile/auth/login

  static const String baseUrl = 'foodies-backend-1.onrender.com';

  static const String categoriesApi = '/mobile/category';
  static const String restaurantsApi = '/mobile/restaurant/';
  static const String menusApi = '/mobile/restaurant/menu/';
  static const String registerApi = '/mobile/client';
  static const String loginApi = '/mobile/auth/login';
  static const String cartApi = '/mobile/cart';
  static const String updatePasswordApi = '/mobile/auth/change-password';

  static String get authorization {
    var token = SharedPreferenceUtils.getData(key: 'token') ?? '';
    return 'Bearer $token';
  }
}
