// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api_manager.dart' as _i3;
import '../data/dataSourceContract/auth_remote_data_source.dart' as _i11;
import '../data/dataSourceContract/cart_data_source.dart' as _i7;
import '../data/dataSourceContract/categories_data_source.dart' as _i20;
import '../data/dataSourceContract/delivery_address_data_source.dart' as _i18;
import '../data/dataSourceContract/favourite_data_source.dart' as _i9;
import '../data/dataSourceContract/home_data_source.dart' as _i16;
import '../data/dataSourceContract/menus_data_source.dart' as _i37;
import '../data/dataSourceContract/order_data_source.dart' as _i5;
import '../data/dataSourceContract/profile_data_source.dart' as _i39;
import '../data/dataSourceContract/restaurants_data_source.dart' as _i24;
import '../data/dataSourceImpl/auth_remote_data_source_impl.dart' as _i12;
import '../data/dataSourceImpl/cart_data_source_impl.dart' as _i8;
import '../data/dataSourceImpl/categories_online_data_source_impl.dart' as _i21;
import '../data/dataSourceImpl/delivery_address_data_source_impl.dart' as _i19;
import '../data/dataSourceImpl/favourite_data_source_impl.dart' as _i10;
import '../data/dataSourceImpl/home_data_source_impl.dart' as _i17;
import '../data/dataSourceImpl/menus_online_data_source_impl.dart' as _i38;
import '../data/dataSourceImpl/order_data_source_impl.dart' as _i6;
import '../data/dataSourceImpl/profile_data_source_impl.dart' as _i40;
import '../data/dataSourceImpl/restaurants_online_data_source_impl.dart'
    as _i25;
import '../data/places_web_services.dart' as _i4;
import '../data/repositoryImpl/auth_repo_impl.dart' as _i23;
import '../data/repositoryImpl/cart_repository_impl.dart' as _i34;
import '../data/repositoryImpl/delivery_address_repository_impl.dart' as _i58;
import '../data/repositoryImpl/favourite_repo_impl.dart' as _i36;
import '../data/repositoryImpl/home_repository_impl.dart' as _i42;
import '../data/repositoryImpl/menus_repo_impl.dart' as _i71;
import '../data/repositoryImpl/order_repository_impl.dart' as _i15;
import '../data/repositoryImpl/profile_repository_impl.dart' as _i45;
import '../domain/repositoryContract/auth_repository.dart' as _i22;
import '../domain/repositoryContract/cart_repository.dart' as _i33;
import '../domain/repositoryContract/delivery_address_repository.dart' as _i57;
import '../domain/repositoryContract/favourite_repository.dart' as _i35;
import '../domain/repositoryContract/home_repository.dart' as _i41;
import '../domain/repositoryContract/maps_repo.dart' as _i32;
import '../domain/repositoryContract/menus_repo.dart' as _i70;
import '../domain/repositoryContract/order_repository.dart' as _i14;
import '../domain/repositoryContract/profile_repository.dart' as _i44;
import '../domain/usecase/add_delivery_address_use_case.dart' as _i84;
import '../domain/usecase/add_to_cart_use_case.dart' as _i64;
import '../domain/usecase/add_to_favourite_use_case.dart' as _i53;
import '../domain/usecase/apply_coupon_use_case.dart' as _i65;
import '../domain/usecase/change_password_use_case.dart' as _i46;
import '../domain/usecase/check_favourite_use_case.dart' as _i54;
import '../domain/usecase/create_cash_order_use_case.dart' as _i26;
import '../domain/usecase/create_online_order_use_case.dart' as _i27;
import '../domain/usecase/delete_cart_use_case.dart' as _i66;
import '../domain/usecase/delete_delivery_address_use_case.dart' as _i85;
import '../domain/usecase/forget_password_use_case.dart' as _i47;
import '../domain/usecase/get_all_delivery_addressess_use_case.dart' as _i86;
import '../domain/usecase/get_all_favourites_use_case.dart' as _i55;
import '../domain/usecase/get_all_orders_use_case.dart' as _i28;
import '../domain/usecase/get_cart_use_case.dart' as _i67;
import '../domain/usecase/get_categories_use_case.dart' as _i62;
import '../domain/usecase/get_menus_use_case.dart' as _i72;
import '../domain/usecase/get_order_use_case.dart' as _i29;
import '../domain/usecase/get_primary_delivery_address_use_case.dart' as _i87;
import '../domain/usecase/get_profile_data_use_case.dart' as _i77;
import '../domain/usecase/get_promotions_use_case.dart' as _i43;
import '../domain/usecase/get_restaurant_by_id_use_case.dart' as _i73;
import '../domain/usecase/get_restaurants_by_category_id.dart' as _i51;
import '../domain/usecase/get_restaurants_use_case.dart' as _i52;
import '../domain/usecase/login_use_case.dart' as _i48;
import '../domain/usecase/make_payment_use_case.dart' as _i30;
import '../domain/usecase/re_order_use_case.dart' as _i31;
import '../domain/usecase/register_use_case.dart' as _i49;
import '../domain/usecase/remove_item_from_cart_use_case.dart' as _i68;
import '../domain/usecase/update_count_in_cart_use_case.dart' as _i69;
import '../domain/usecase/update_delivery_address_use_case.dart' as _i88;
import '../domain/usecase/update_password_use_case.dart' as _i78;
import '../domain/usecase/update_profile_image_use_case.dart' as _i79;
import '../domain/usecase/verify_otp_use_case.dart' as _i50;
import '../ui/auth/change_password/cubit/change_password_view_model.dart'
    as _i59;
import '../ui/auth/forget_password/cubit/forget_password_view_model.dart'
    as _i76;
import '../ui/auth/login/cubit/login_view_model.dart' as _i60;
import '../ui/auth/otp/cubit/otp_code_view_model.dart' as _i56;
import '../ui/auth/register/cubit/register_view_model.dart' as _i63;
import '../ui/cart/cubit/cart_screen_view_model.dart' as _i91;
import '../ui/category_details/cubit/category_details_view_model.dart' as _i82;
import '../ui/change_address/cubit/change_address_view_model.dart' as _i94;
import '../ui/checkout/cubit/checkout_view_model.dart' as _i93;
import '../ui/home/home_tab/cubit/home_tab_view_model.dart' as _i95;
import '../ui/home/orders_tab/cubit/orders_tab_view_model.dart' as _i83;
import '../ui/home/profile_tab/cubit/profile_view_model.dart' as _i89;
import '../ui/home/profile_tab/edit_profile/cubit/edit_profile_view_model.dart'
    as _i90;
import '../ui/home/profile_tab/favourite/cubit/favourite_view_model.dart'
    as _i74;
import '../ui/home/profile_tab/settings/my_addresses/form_address/cubit/form_address_view_model.dart'
    as _i92;
import '../ui/home/profile_tab/settings/my_addresses/maps/cubit/maps_cubit.dart'
    as _i61;
import '../ui/meal_details/cubit/meal_details_view_model.dart' as _i80;
import '../ui/menu/cubit/menu_view_model.dart' as _i75;
import '../ui/order_details/cubit/orders_details_view_model.dart' as _i81;
import '../ui/utils/stripe_service.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.singleton<_i4.PlacesWebservices>(() => _i4.PlacesWebservices());
    gh.factory<_i5.OrderDataSource>(
        () => _i6.OrderDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i7.CartDataSource>(
        () => _i8.CartDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i9.FavouriteDataSource>(
        () => _i10.FavouriteDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i11.AuthRemoteDataSource>(
        () => _i12.AuthRemoteDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i13.StripeService>(
        () => _i13.StripeService(gh<_i3.ApiManager>()));
    gh.factory<_i14.OrderRepository>(() => _i15.OrderRepositoryImpl(
          gh<_i5.OrderDataSource>(),
          gh<_i13.StripeService>(),
        ));
    gh.factory<_i16.HomeDataSource>(
        () => _i17.HomeDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i18.DeliveryAddressDataSource>(
        () => _i19.DeliveryAddressDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i20.CategoriesDataSource>(
        () => _i21.CategoriesOnlineDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i22.AuthRepository>(
        () => _i23.AuthRepoImpl(gh<_i11.AuthRemoteDataSource>()));
    gh.factory<_i24.RestaurantsDataSource>(
        () => _i25.RestaurantsOnlineDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i26.CreateCashOrderUseCase>(
        () => _i26.CreateCashOrderUseCase(gh<_i14.OrderRepository>()));
    gh.factory<_i27.CreateOnlineOrderUseCase>(
        () => _i27.CreateOnlineOrderUseCase(gh<_i14.OrderRepository>()));
    gh.factory<_i28.GetAllOrdersUseCase>(
        () => _i28.GetAllOrdersUseCase(gh<_i14.OrderRepository>()));
    gh.factory<_i29.GetOrderUseCase>(
        () => _i29.GetOrderUseCase(gh<_i14.OrderRepository>()));
    gh.factory<_i30.MakePaymentUseCase>(
        () => _i30.MakePaymentUseCase(gh<_i14.OrderRepository>()));
    gh.factory<_i31.ReOrderUseCase>(
        () => _i31.ReOrderUseCase(gh<_i14.OrderRepository>()));
    gh.factory<_i32.MapsRepository>(
        () => _i32.MapsRepository(gh<_i4.PlacesWebservices>()));
    gh.factory<_i33.CartRepository>(
        () => _i34.CartRepositoryImpl(gh<_i7.CartDataSource>()));
    gh.factory<_i35.FavouriteRepository>(
        () => _i36.FavouriteRepoImpl(gh<_i9.FavouriteDataSource>()));
    gh.factory<_i37.MenusDataSource>(
        () => _i38.MenusOnlineDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i39.ProfileDataSource>(
        () => _i40.ProfileDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i41.HomeRepository>(
        () => _i42.HomeRepositoryImpl(gh<_i16.HomeDataSource>()));
    gh.factory<_i43.GetPromotionsUseCase>(
        () => _i43.GetPromotionsUseCase(gh<_i41.HomeRepository>()));
    gh.factory<_i44.ProfileRepository>(() => _i45.ProfileRepositoryImpl(
        profileDataSource: gh<_i39.ProfileDataSource>()));
    gh.factory<_i46.ChangePasswordUseCase>(
        () => _i46.ChangePasswordUseCase(gh<_i22.AuthRepository>()));
    gh.factory<_i47.ForgetPasswordUseCase>(
        () => _i47.ForgetPasswordUseCase(gh<_i22.AuthRepository>()));
    gh.factory<_i48.LoginUseCase>(
        () => _i48.LoginUseCase(gh<_i22.AuthRepository>()));
    gh.factory<_i49.RegisterUseCase>(
        () => _i49.RegisterUseCase(gh<_i22.AuthRepository>()));
    gh.factory<_i50.VerifyOTPUseCase>(
        () => _i50.VerifyOTPUseCase(gh<_i22.AuthRepository>()));
    gh.factory<_i51.GetRestaurantsByCategoryId>(
        () => _i51.GetRestaurantsByCategoryId(gh<_i41.HomeRepository>()));
    gh.factory<_i52.GetRestaurantsUsecase>(
        () => _i52.GetRestaurantsUsecase(gh<_i41.HomeRepository>()));
    gh.factory<_i53.AddToFavouriteUseCase>(
        () => _i53.AddToFavouriteUseCase(gh<_i35.FavouriteRepository>()));
    gh.factory<_i54.CheckFavouriteUseCase>(
        () => _i54.CheckFavouriteUseCase(gh<_i35.FavouriteRepository>()));
    gh.factory<_i55.GetAllFavouritesUseCase>(
        () => _i55.GetAllFavouritesUseCase(gh<_i35.FavouriteRepository>()));
    gh.factory<_i56.OtpCodeViewModel>(
        () => _i56.OtpCodeViewModel(gh<_i50.VerifyOTPUseCase>()));
    gh.factory<_i57.DeliveryAddressRepository>(() =>
        _i58.DeliveryAddressRepositoryImpl(
            gh<_i18.DeliveryAddressDataSource>()));
    gh.factory<_i59.ChangePasswordViewModel>(
        () => _i59.ChangePasswordViewModel(gh<_i46.ChangePasswordUseCase>()));
    gh.factory<_i60.LoginViewModel>(
        () => _i60.LoginViewModel(gh<_i48.LoginUseCase>()));
    gh.factory<_i61.MapsCubit>(() => _i61.MapsCubit(gh<_i32.MapsRepository>()));
    gh.factory<_i62.GetCategoriesUsecase>(
        () => _i62.GetCategoriesUsecase(gh<_i41.HomeRepository>()));
    gh.factory<_i63.RegisterViewModel>(
        () => _i63.RegisterViewModel(gh<_i49.RegisterUseCase>()));
    gh.factory<_i64.AddToCartUseCase>(
        () => _i64.AddToCartUseCase(gh<_i33.CartRepository>()));
    gh.factory<_i65.ApplyCouponUseCase>(
        () => _i65.ApplyCouponUseCase(gh<_i33.CartRepository>()));
    gh.factory<_i66.DeleteCartUseCase>(
        () => _i66.DeleteCartUseCase(gh<_i33.CartRepository>()));
    gh.factory<_i67.GetCartUseCase>(
        () => _i67.GetCartUseCase(gh<_i33.CartRepository>()));
    gh.factory<_i68.RemoveItemFromCartUseCase>(
        () => _i68.RemoveItemFromCartUseCase(gh<_i33.CartRepository>()));
    gh.factory<_i69.UpdateCountInCartUseCase>(
        () => _i69.UpdateCountInCartUseCase(gh<_i33.CartRepository>()));
    gh.factory<_i70.MenusRepo>(
        () => _i71.MenusRepoImpl(gh<_i37.MenusDataSource>()));
    gh.factory<_i72.GetMenusUsecase>(
        () => _i72.GetMenusUsecase(gh<_i70.MenusRepo>()));
    gh.factory<_i73.GetRestaurantByIdUseCase>(
        () => _i73.GetRestaurantByIdUseCase(gh<_i70.MenusRepo>()));
    gh.factory<_i74.FavouriteViewModel>(() => _i74.FavouriteViewModel(
          gh<_i55.GetAllFavouritesUseCase>(),
          gh<_i53.AddToFavouriteUseCase>(),
        ));
    gh.factory<_i75.MenuViewModel>(() => _i75.MenuViewModel(
          gh<_i72.GetMenusUsecase>(),
          gh<_i53.AddToFavouriteUseCase>(),
          gh<_i54.CheckFavouriteUseCase>(),
          gh<_i73.GetRestaurantByIdUseCase>(),
        ));
    gh.factory<_i76.ForgetPasswordViewModel>(
        () => _i76.ForgetPasswordViewModel(gh<_i47.ForgetPasswordUseCase>()));
    gh.factory<_i77.GetProfileDataUseCase>(
        () => _i77.GetProfileDataUseCase(gh<_i44.ProfileRepository>()));
    gh.factory<_i78.UpdatePasswordUseCase>(
        () => _i78.UpdatePasswordUseCase(gh<_i44.ProfileRepository>()));
    gh.factory<_i79.UpdateProfileImageUseCase>(
        () => _i79.UpdateProfileImageUseCase(gh<_i44.ProfileRepository>()));
    gh.factory<_i80.MealDetailsViewModel>(
        () => _i80.MealDetailsViewModel(gh<_i64.AddToCartUseCase>()));
    gh.factory<_i81.OrderDetailsViewModel>(() => _i81.OrderDetailsViewModel(
          gh<_i29.GetOrderUseCase>(),
          gh<_i77.GetProfileDataUseCase>(),
        ));
    gh.factory<_i82.CategoryDetailsViewModel>(() =>
        _i82.CategoryDetailsViewModel(gh<_i51.GetRestaurantsByCategoryId>()));
    gh.factory<_i83.OrdersTabViewModel>(() => _i83.OrdersTabViewModel(
          gh<_i28.GetAllOrdersUseCase>(),
          gh<_i31.ReOrderUseCase>(),
          gh<_i66.DeleteCartUseCase>(),
        ));
    gh.factory<_i84.AddDeliveryAddressUseCase>(() =>
        _i84.AddDeliveryAddressUseCase(gh<_i57.DeliveryAddressRepository>()));
    gh.factory<_i85.DeleteDeliveryAddressUseCase>(() =>
        _i85.DeleteDeliveryAddressUseCase(
            gh<_i57.DeliveryAddressRepository>()));
    gh.factory<_i86.GetAllDeliveryAddressessUseCase>(() =>
        _i86.GetAllDeliveryAddressessUseCase(
            gh<_i57.DeliveryAddressRepository>()));
    gh.factory<_i87.GetPrimaryDeliveryAddressUseCase>(() =>
        _i87.GetPrimaryDeliveryAddressUseCase(
            gh<_i57.DeliveryAddressRepository>()));
    gh.factory<_i88.UpdateDeliveryAddressUseCase>(() =>
        _i88.UpdateDeliveryAddressUseCase(
            gh<_i57.DeliveryAddressRepository>()));
    gh.factory<_i89.ProfileViewModel>(() => _i89.ProfileViewModel(
          gh<_i78.UpdatePasswordUseCase>(),
          gh<_i77.GetProfileDataUseCase>(),
        ));
    gh.factory<_i90.EditProfileViewModel>(() => _i90.EditProfileViewModel(
          gh<_i77.GetProfileDataUseCase>(),
          gh<_i79.UpdateProfileImageUseCase>(),
        ));
    gh.factory<_i91.CartScreenViewModel>(() => _i91.CartScreenViewModel(
          gh<_i67.GetCartUseCase>(),
          gh<_i68.RemoveItemFromCartUseCase>(),
          gh<_i69.UpdateCountInCartUseCase>(),
          gh<_i66.DeleteCartUseCase>(),
          gh<_i65.ApplyCouponUseCase>(),
        ));
    gh.factory<_i92.FormAddressViewModel>(
        () => _i92.FormAddressViewModel(gh<_i84.AddDeliveryAddressUseCase>()));
    gh.factory<_i93.CheckoutViewModel>(() => _i93.CheckoutViewModel(
          gh<_i27.CreateOnlineOrderUseCase>(),
          gh<_i26.CreateCashOrderUseCase>(),
          gh<_i30.MakePaymentUseCase>(),
          gh<_i87.GetPrimaryDeliveryAddressUseCase>(),
          gh<_i77.GetProfileDataUseCase>(),
        ));
    gh.factory<_i94.ChangeAddressScreenViewModel>(
        () => _i94.ChangeAddressScreenViewModel(
              gh<_i84.AddDeliveryAddressUseCase>(),
              gh<_i85.DeleteDeliveryAddressUseCase>(),
              gh<_i86.GetAllDeliveryAddressessUseCase>(),
              gh<_i88.UpdateDeliveryAddressUseCase>(),
              gh<_i77.GetProfileDataUseCase>(),
            ));
    gh.factory<_i95.HomeTabViewModel>(() => _i95.HomeTabViewModel(
          gh<_i52.GetRestaurantsUsecase>(),
          gh<_i62.GetCategoriesUsecase>(),
          gh<_i87.GetPrimaryDeliveryAddressUseCase>(),
          gh<_i86.GetAllDeliveryAddressessUseCase>(),
          gh<_i88.UpdateDeliveryAddressUseCase>(),
          gh<_i43.GetPromotionsUseCase>(),
        ));
    return this;
  }
}
