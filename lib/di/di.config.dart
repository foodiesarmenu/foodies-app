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
import '../data/repositoryImpl/delivery_address_repository_impl.dart' as _i54;
import '../data/repositoryImpl/favourite_repo_impl.dart' as _i36;
import '../data/repositoryImpl/home_repository_impl.dart' as _i42;
import '../data/repositoryImpl/menus_repo_impl.dart' as _i67;
import '../data/repositoryImpl/order_repository_impl.dart' as _i15;
import '../data/repositoryImpl/profile_repository_impl.dart' as _i45;
import '../domain/repositoryContract/auth_repository.dart' as _i22;
import '../domain/repositoryContract/cart_repository.dart' as _i33;
import '../domain/repositoryContract/delivery_address_repository.dart' as _i53;
import '../domain/repositoryContract/favourite_repository.dart' as _i35;
import '../domain/repositoryContract/home_repository.dart' as _i41;
import '../domain/repositoryContract/maps_repo.dart' as _i31;
import '../domain/repositoryContract/menus_repo.dart' as _i66;
import '../domain/repositoryContract/order_repository.dart' as _i14;
import '../domain/repositoryContract/profile_repository.dart' as _i44;
import '../domain/usecase/add_delivery_address_use_case.dart' as _i75;
import '../domain/usecase/add_to_cart_use_case.dart' as _i60;
import '../domain/usecase/add_to_favourite_use_case.dart' as _i50;
import '../domain/usecase/apply_coupon_use_case.dart' as _i61;
import '../domain/usecase/check_favourite_use_case.dart' as _i51;
import '../domain/usecase/create_cash_order_use_case.dart' as _i26;
import '../domain/usecase/create_online_order_use_case.dart' as _i27;
import '../domain/usecase/delete_cart_use_case.dart' as _i62;
import '../domain/usecase/delete_delivery_address_use_case.dart' as _i76;
import '../domain/usecase/get_all_delivery_addressess_use_case.dart' as _i77;
import '../domain/usecase/get_all_favourites_use_case.dart' as _i52;
import '../domain/usecase/get_all_orders_use_case.dart' as _i28;
import '../domain/usecase/get_cart_use_case.dart' as _i63;
import '../domain/usecase/get_categories_use_case.dart' as _i57;
import '../domain/usecase/get_menus_use_case.dart' as _i68;
import '../domain/usecase/get_order_use_case.dart' as _i29;
import '../domain/usecase/get_primary_delivery_address_use_case.dart' as _i78;
import '../domain/usecase/get_profile_data_use_case.dart' as _i70;
import '../domain/usecase/get_promotions_use_case.dart' as _i43;
import '../domain/usecase/get_restaurants_by_category_id.dart' as _i48;
import '../domain/usecase/get_restaurants_use_case.dart' as _i49;
import '../domain/usecase/login_use_case.dart' as _i46;
import '../domain/usecase/make_payment_use_case.dart' as _i30;
import '../domain/usecase/register_use_case.dart' as _i47;
import '../domain/usecase/remove_item_from_cart_use_case.dart' as _i64;
import '../domain/usecase/update_count_in_cart_use_case.dart' as _i65;
import '../domain/usecase/update_delivery_address_use_case.dart' as _i79;
import '../domain/usecase/update_password_use_case.dart' as _i71;
import '../ui/auth/login/cubit/login_view_model.dart' as _i55;
import '../ui/auth/register/cubit/register_view_model.dart' as _i58;
import '../ui/cart/cubit/cart_screen_view_model.dart' as _i82;
import '../ui/category_details/cubit/category_details_view_model.dart' as _i73;
import '../ui/change_address/cubit/change_address_view_model.dart' as _i84;
import '../ui/checkout/cubit/checkout_view_model.dart' as _i85;
import '../ui/home/home_tab/cubit/home_tab_view_model.dart' as _i86;
import '../ui/home/orders_tab/cubit/orders_tab_view_model.dart' as _i32;
import '../ui/home/profile_tab/cubit/profile_view_model.dart' as _i80;
import '../ui/home/profile_tab/edit_profile/cubit/edit_profile_view_model.dart'
    as _i81;
import '../ui/home/profile_tab/favourite/cubit/favourite_view_model.dart'
    as _i69;
import '../ui/home/profile_tab/settings/my_addresses/form_address/cubit/form_address_view_model.dart'
    as _i83;
import '../ui/home/profile_tab/settings/my_addresses/maps/cubit/maps_cubit.dart'
    as _i56;
import '../ui/meal_details/cubit/meal_details_view_model.dart' as _i72;
import '../ui/menu/cubit/menu_view_model.dart' as _i74;
import '../ui/order_details/cubit/orders_details_view_model.dart' as _i59;
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
    gh.factory<_i31.MapsRepository>(
        () => _i31.MapsRepository(gh<_i4.PlacesWebservices>()));
    gh.factory<_i32.OrdersTabViewModel>(
        () => _i32.OrdersTabViewModel(gh<_i28.GetAllOrdersUseCase>()));
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
    gh.factory<_i46.LoginUseCase>(
        () => _i46.LoginUseCase(gh<_i22.AuthRepository>()));
    gh.factory<_i47.RegisterUseCase>(
        () => _i47.RegisterUseCase(gh<_i22.AuthRepository>()));
    gh.factory<_i48.GetRestaurantsByCategoryId>(
        () => _i48.GetRestaurantsByCategoryId(gh<_i41.HomeRepository>()));
    gh.factory<_i49.GetRestaurantsUsecase>(
        () => _i49.GetRestaurantsUsecase(gh<_i41.HomeRepository>()));
    gh.factory<_i50.AddToFavouriteUseCase>(
        () => _i50.AddToFavouriteUseCase(gh<_i35.FavouriteRepository>()));
    gh.factory<_i51.CheckFavouriteUseCase>(
        () => _i51.CheckFavouriteUseCase(gh<_i35.FavouriteRepository>()));
    gh.factory<_i52.GetAllFavouritesUseCase>(
        () => _i52.GetAllFavouritesUseCase(gh<_i35.FavouriteRepository>()));
    gh.factory<_i53.DeliveryAddressRepository>(() =>
        _i54.DeliveryAddressRepositoryImpl(
            gh<_i18.DeliveryAddressDataSource>()));
    gh.factory<_i55.LoginViewModel>(
        () => _i55.LoginViewModel(gh<_i46.LoginUseCase>()));
    gh.factory<_i56.MapsCubit>(() => _i56.MapsCubit(gh<_i31.MapsRepository>()));
    gh.factory<_i57.GetCategoriesUsecase>(
        () => _i57.GetCategoriesUsecase(gh<_i41.HomeRepository>()));
    gh.factory<_i58.RegisterViewModel>(
        () => _i58.RegisterViewModel(gh<_i47.RegisterUseCase>()));
    gh.factory<_i59.OrderDetailsViewModel>(
        () => _i59.OrderDetailsViewModel(gh<_i29.GetOrderUseCase>()));
    gh.factory<_i60.AddToCartUseCase>(
        () => _i60.AddToCartUseCase(gh<_i33.CartRepository>()));
    gh.factory<_i61.ApplyCouponUseCase>(
        () => _i61.ApplyCouponUseCase(gh<_i33.CartRepository>()));
    gh.factory<_i62.DeleteCartUseCase>(
        () => _i62.DeleteCartUseCase(gh<_i33.CartRepository>()));
    gh.factory<_i63.GetCartUseCase>(
        () => _i63.GetCartUseCase(gh<_i33.CartRepository>()));
    gh.factory<_i64.RemoveItemFromCartUseCase>(
        () => _i64.RemoveItemFromCartUseCase(gh<_i33.CartRepository>()));
    gh.factory<_i65.UpdateCountInCartUseCase>(
        () => _i65.UpdateCountInCartUseCase(gh<_i33.CartRepository>()));
    gh.factory<_i66.MenusRepo>(
        () => _i67.MenusRepoImpl(gh<_i37.MenusDataSource>()));
    gh.factory<_i68.GetMenusUsecase>(
        () => _i68.GetMenusUsecase(gh<_i66.MenusRepo>()));
    gh.factory<_i69.FavouriteViewModel>(() => _i69.FavouriteViewModel(
          gh<_i52.GetAllFavouritesUseCase>(),
          gh<_i50.AddToFavouriteUseCase>(),
        ));
    gh.factory<_i70.GetProfileDataUseCase>(
        () => _i70.GetProfileDataUseCase(gh<_i44.ProfileRepository>()));
    gh.factory<_i71.UpdatePasswordUseCase>(
        () => _i71.UpdatePasswordUseCase(gh<_i44.ProfileRepository>()));
    gh.factory<_i72.MealDetailsViewModel>(
        () => _i72.MealDetailsViewModel(gh<_i60.AddToCartUseCase>()));
    gh.factory<_i73.CategoryDetailsViewModel>(() =>
        _i73.CategoryDetailsViewModel(gh<_i48.GetRestaurantsByCategoryId>()));
    gh.factory<_i74.MenuViewModel>(() => _i74.MenuViewModel(
          gh<_i68.GetMenusUsecase>(),
          gh<_i50.AddToFavouriteUseCase>(),
          gh<_i51.CheckFavouriteUseCase>(),
        ));
    gh.factory<_i75.AddDeliveryAddressUseCase>(() =>
        _i75.AddDeliveryAddressUseCase(gh<_i53.DeliveryAddressRepository>()));
    gh.factory<_i76.DeleteDeliveryAddressUseCase>(() =>
        _i76.DeleteDeliveryAddressUseCase(
            gh<_i53.DeliveryAddressRepository>()));
    gh.factory<_i77.GetAllDeliveryAddressessUseCase>(() =>
        _i77.GetAllDeliveryAddressessUseCase(
            gh<_i53.DeliveryAddressRepository>()));
    gh.factory<_i78.GetPrimaryDeliveryAddressUseCase>(() =>
        _i78.GetPrimaryDeliveryAddressUseCase(
            gh<_i53.DeliveryAddressRepository>()));
    gh.factory<_i79.UpdateDeliveryAddressUseCase>(() =>
        _i79.UpdateDeliveryAddressUseCase(
            gh<_i53.DeliveryAddressRepository>()));
    gh.factory<_i80.ProfileViewModel>(() => _i80.ProfileViewModel(
          gh<_i71.UpdatePasswordUseCase>(),
          gh<_i70.GetProfileDataUseCase>(),
        ));
    gh.factory<_i81.EditProfileViewModel>(
        () => _i81.EditProfileViewModel(gh<_i70.GetProfileDataUseCase>()));
    gh.factory<_i82.CartScreenViewModel>(() => _i82.CartScreenViewModel(
          gh<_i63.GetCartUseCase>(),
          gh<_i64.RemoveItemFromCartUseCase>(),
          gh<_i65.UpdateCountInCartUseCase>(),
          gh<_i62.DeleteCartUseCase>(),
          gh<_i61.ApplyCouponUseCase>(),
        ));
    gh.factory<_i83.FormAddressViewModel>(
        () => _i83.FormAddressViewModel(gh<_i75.AddDeliveryAddressUseCase>()));
    gh.factory<_i84.ChangeAddressScreenViewModel>(
        () => _i84.ChangeAddressScreenViewModel(
              gh<_i75.AddDeliveryAddressUseCase>(),
              gh<_i76.DeleteDeliveryAddressUseCase>(),
              gh<_i77.GetAllDeliveryAddressessUseCase>(),
              gh<_i79.UpdateDeliveryAddressUseCase>(),
            ));
    gh.factory<_i85.CheckoutViewModel>(() => _i85.CheckoutViewModel(
          gh<_i27.CreateOnlineOrderUseCase>(),
          gh<_i26.CreateCashOrderUseCase>(),
          gh<_i30.MakePaymentUseCase>(),
          gh<_i78.GetPrimaryDeliveryAddressUseCase>(),
        ));
    gh.factory<_i86.HomeTabViewModel>(() => _i86.HomeTabViewModel(
          gh<_i49.GetRestaurantsUsecase>(),
          gh<_i57.GetCategoriesUsecase>(),
          gh<_i78.GetPrimaryDeliveryAddressUseCase>(),
          gh<_i77.GetAllDeliveryAddressessUseCase>(),
          gh<_i79.UpdateDeliveryAddressUseCase>(),
          gh<_i43.GetPromotionsUseCase>(),
        ));
    return this;
  }
}
