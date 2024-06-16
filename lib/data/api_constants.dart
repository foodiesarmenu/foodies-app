import '../ui/utils/shared_preference_utils.dart';

class ApiConstants {

  static const String baseUrl = 'foodies-backend-1.onrender.com';
  static const String stripeUrl = 'api.stripe.com';

  static const String categoriesApi = '/mobile/category';
  static const String restaurantsApi = '/mobile/restaurant/';
  static const String menusApi = '/mobile/restaurant/menu/';
  static const String registerApi = '/mobile/client';
  static const String loginApi = '/mobile/auth/login';
  static const String cartApi = '/mobile/cart';
  static const String updatePasswordApi = '/mobile/auth/change-password';
  static const String createOnlineOrderApi = '/client/order/createOnlineOrder';
  static const String createCashOrderApi = '/client/order/createCashOrder';
  static const String makeOnlineOrderApi = '/v1/payment_intents';
  static const String favourite = '/mobile/favorite';
  static const String checkFavourite = '/mobile/favorite/is-favorite';
  static const String orderApi = '/client/order';
  static const String reOrder = '/client/order/reOrder';

  static const String addressApi = '/mobile/address';
  static const String promotionApi = '/mobile/promotion';
  static const String getProfileDataApi = '/mobile/client';
  static const String applyCouponApi = '/mobile/cart/coupon';

  static const String stripePublishableKey =
      'pk_test_51P74Z0RvZAWQr39yHYhCjcu6B95Mf205iwVrhBknhNr8VE1HPSq6jqQi8v4Qhl9PDq1aIrtVIOIAa79Tz9kaTU8x00FCy5Pg1I';
  static const String stripeSecretKey =
      'Bearer sk_test_51P74Z0RvZAWQr39yXWAwnUKz96DCATJ26Scj9GBazhfheYsE2F1BqR66cIij6HFw8CCwXUvJdSi7i97YFn3g7wlQ00gdMrHRGQ';

  static String get authorization {
    var token = SharedPreferenceUtils.getData(key: 'token') ?? '';
    return 'Bearer $token';
  }
}
