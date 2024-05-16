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
import '../data/dataSourceContract/CategoriesDataSource.dart' as _i31;
import '../data/dataSourceContract/delivery_address_data_source.dart' as _i18;
import '../data/dataSourceContract/favourite_data_source.dart' as _i9;
import '../data/dataSourceContract/home_data_source.dart' as _i16;
import '../data/dataSourceContract/MenusDataSource.dart' as _i33;
import '../data/dataSourceContract/order_data_source.dart' as _i5;
import '../data/dataSourceContract/profile_data_source.dart' as _i41;
import '../data/dataSourceContract/RestaurantsDataSource.dart' as _i27;
import '../data/dataSourceImpl/auth_remote_data_source_impl.dart' as _i12;
import '../data/dataSourceImpl/cart_data_source_impl.dart' as _i8;
import '../data/dataSourceImpl/CategoriesOnlineDataSourceImpl.dart' as _i32;
import '../data/dataSourceImpl/delivery_address_data_source_impl.dart' as _i19;
import '../data/dataSourceImpl/favourite_data_source_impl.dart' as _i10;
import '../data/dataSourceImpl/home_data_source_impl.dart' as _i17;
import '../data/dataSourceImpl/MenusOnlineDataSourceImpl.dart' as _i34;
import '../data/dataSourceImpl/order_data_source_impl.dart' as _i6;
import '../data/dataSourceImpl/profile_data_source_impl.dart' as _i42;
import '../data/dataSourceImpl/RestaurantsOnlineDataSourceImpl.dart' as _i28;
import '../data/places_web_services.dart' as _i4;
import '../data/repositoryImpl/auth_repo_impl.dart' as _i21;
import '../data/repositoryImpl/cart_repository_impl.dart' as _i36;
import '../data/repositoryImpl/delivery_address_repository_impl.dart' as _i56;
import '../data/repositoryImpl/favourite_repo_impl.dart' as _i40;
import '../data/repositoryImpl/home_repository_impl.dart' as _i44;
import '../data/repositoryImpl/MenusRepoImpl.dart' as _i38;
import '../data/repositoryImpl/order_repository_impl.dart' as _i15;
import '../data/repositoryImpl/profile_repository_impl.dart' as _i47;
import '../domain/repositoryContract/auth_repository.dart' as _i20;
import '../domain/repositoryContract/cart_repository.dart' as _i35;
import '../domain/repositoryContract/delivery_address_repository.dart' as _i55;
import '../domain/repositoryContract/favourite_repository.dart' as _i39;
import '../domain/repositoryContract/home_repository.dart' as _i43;
import '../domain/repositoryContract/maps_repo.dart' as _i29;
import '../domain/repositoryContract/MenusRepo.dart' as _i37;
import '../domain/repositoryContract/order_repository.dart' as _i14;
import '../domain/repositoryContract/profile_repository.dart' as _i46;
import '../domain/usecase/add_delivery_address_use_case.dart' as _i73;
import '../domain/usecase/add_to_cart_use_case.dart' as _i62;
import '../domain/usecase/add_to_favourite_use_case.dart' as _i52;
import '../domain/usecase/check_favourite_use_case.dart' as _i53;
import '../domain/usecase/create_cash_order_use_case.dart' as _i22;
import '../domain/usecase/create_online_order_use_case.dart' as _i23;
import '../domain/usecase/delete_cart_use_case.dart' as _i63;
import '../domain/usecase/delete_delivery_address_use_case.dart' as _i74;
import '../domain/usecase/get_all_delivery_addressess_use_case.dart' as _i75;
import '../domain/usecase/get_all_favourites_use_case.dart' as _i54;
import '../domain/usecase/get_all_orders_use_case.dart' as _i24;
import '../domain/usecase/get_cart_use_case.dart' as _i64;
import '../domain/usecase/get_order_use_case.dart' as _i25;
import '../domain/usecase/get_primary_delivery_address_use_case.dart' as _i76;
import '../domain/usecase/GetCategoriesUsecase.dart' as _i59;
import '../domain/usecase/GetMenusUsecase.dart' as _i70;
import '../domain/usecase/GetPromotionsUseCase.dart' as _i45;
import '../domain/usecase/GetRestaurantsByCategoryId.dart' as _i50;
import '../domain/usecase/GetRestaurantsUsecase.dart' as _i51;
import '../domain/usecase/login_use_case.dart' as _i48;
import '../domain/usecase/make_payment_use_case.dart' as _i26;
import '../domain/usecase/register_use_case.dart' as _i49;
import '../domain/usecase/remove_item_from_cart_use_case.dart' as _i65;
import '../domain/usecase/update_count_in_cart_use_case.dart' as _i66;
import '../domain/usecase/update_delivery_address_use_case.dart' as _i77;
import '../domain/usecase/update_password_use_case.dart' as _i69;
import '../ui/auth/login/cubit/login_view_model.dart' as _i57;
import '../ui/auth/register/cubit/register_view_model.dart' as _i60;
import '../ui/cart/cubit/cart_screen_view_model.dart' as _i78;
import '../ui/category_details/cubit/category_details_view_model.dart' as _i67;
import '../ui/change_address/cubit/change_address_view_model.dart' as _i82;
import '../ui/checkout/cubit/checkout_view_model.dart' as _i83;
import '../ui/home/home_tab/cubit/home_tab_view_model.dart' as _i81;
import '../ui/home/orders_tab/cubit/orders_tab_view_model.dart' as _i30;
import '../ui/home/profile_tab/cubit/profile_view_model.dart' as _i79;
import '../ui/home/profile_tab/favourite/cubit/favourite_view_model.dart'
    as _i68;
import '../ui/home/profile_tab/settings/my_addresses/form_address/cubit/form_address_view_model.dart'
    as _i80;
import '../ui/home/profile_tab/settings/my_addresses/maps/cubit/maps_cubit.dart'
    as _i58;
import '../ui/meal_details/cubit/meal_details_view_model.dart' as _i72;
import '../ui/menu/cubit/menu_view_model.dart' as _i71;
import '../ui/order_details/cubit/orders_details_view_model.dart' as _i61;
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
    gh.factory<_i20.AuthRepository>(
        () => _i21.AuthRepoImpl(gh<_i11.AuthRemoteDataSource>()));
    gh.factory<_i22.CreateCashOrderUseCase>(
        () => _i22.CreateCashOrderUseCase(gh<_i14.OrderRepository>()));
    gh.factory<_i23.CreateOnlineOrderUseCase>(
        () => _i23.CreateOnlineOrderUseCase(gh<_i14.OrderRepository>()));
    gh.factory<_i24.GetAllOrdersUseCase>(
        () => _i24.GetAllOrdersUseCase(gh<_i14.OrderRepository>()));
    gh.factory<_i25.GetOrderUseCase>(
        () => _i25.GetOrderUseCase(gh<_i14.OrderRepository>()));
    gh.factory<_i26.MakePaymentUseCase>(
        () => _i26.MakePaymentUseCase(gh<_i14.OrderRepository>()));
    gh.factory<_i27.RestaurantsDataSource>(
        () => _i28.RestaurantsOnlineDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i29.MapsRepository>(
        () => _i29.MapsRepository(gh<_i4.PlacesWebservices>()));
    gh.factory<_i30.OrdersTabViewModel>(
        () => _i30.OrdersTabViewModel(gh<_i24.GetAllOrdersUseCase>()));
    gh.factory<_i31.CategoriesDataSource>(
        () => _i32.CategoriesOnlineDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i33.MenusDataSource>(
        () => _i34.MenusOnlineDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i35.CartRepository>(
        () => _i36.CartRepositoryImpl(gh<_i7.CartDataSource>()));
    gh.factory<_i37.MenusRepo>(
        () => _i38.MenusRepoImpl(gh<_i33.MenusDataSource>()));
    gh.factory<_i39.FavouriteRepository>(
        () => _i40.FavouriteRepoImpl(gh<_i9.FavouriteDataSource>()));
    gh.factory<_i41.ProfileDataSource>(
        () => _i42.ProfileDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i43.HomeRepository>(
        () => _i44.HomeRepositoryImpl(gh<_i16.HomeDataSource>()));
    gh.factory<_i45.GetPromotionsUseCase>(
        () => _i45.GetPromotionsUseCase(gh<_i43.HomeRepository>()));
    gh.factory<_i46.ProfileRepository>(() => _i47.ProfileRepositoryImpl(
        profileDataSource: gh<_i41.ProfileDataSource>()));
    gh.factory<_i48.LoginUseCase>(
        () => _i48.LoginUseCase(gh<_i20.AuthRepository>()));
    gh.factory<_i49.RegisterUseCase>(
        () => _i49.RegisterUseCase(gh<_i20.AuthRepository>()));
    gh.factory<_i50.GetRestaurantsByCategoryId>(
        () => _i50.GetRestaurantsByCategoryId(gh<_i43.HomeRepository>()));
    gh.factory<_i51.GetRestaurantsUsecase>(
        () => _i51.GetRestaurantsUsecase(gh<_i43.HomeRepository>()));
    gh.factory<_i52.AddToFavouriteUseCase>(
        () => _i52.AddToFavouriteUseCase(gh<_i39.FavouriteRepository>()));
    gh.factory<_i53.CheckFavouriteUseCase>(
        () => _i53.CheckFavouriteUseCase(gh<_i39.FavouriteRepository>()));
    gh.factory<_i54.GetAllFavouritesUseCase>(
        () => _i54.GetAllFavouritesUseCase(gh<_i39.FavouriteRepository>()));
    gh.factory<_i55.DeliveryAddressRepository>(() =>
        _i56.DeliveryAddressRepositoryImpl(
            gh<_i18.DeliveryAddressDataSource>()));
    gh.factory<_i57.LoginViewModel>(
        () => _i57.LoginViewModel(gh<_i48.LoginUseCase>()));
    gh.factory<_i58.MapsCubit>(() => _i58.MapsCubit(gh<_i29.MapsRepository>()));
    gh.factory<_i59.GetCategoriesUsecase>(
        () => _i59.GetCategoriesUsecase(gh<_i43.HomeRepository>()));
    gh.factory<_i60.RegisterViewModel>(
        () => _i60.RegisterViewModel(gh<_i49.RegisterUseCase>()));
    gh.factory<_i61.OrderDetailsViewModel>(
        () => _i61.OrderDetailsViewModel(gh<_i25.GetOrderUseCase>()));
    gh.factory<_i62.AddToCartUseCase>(
        () => _i62.AddToCartUseCase(gh<_i35.CartRepository>()));
    gh.factory<_i63.DeleteCartUseCase>(
        () => _i63.DeleteCartUseCase(gh<_i35.CartRepository>()));
    gh.factory<_i64.GetCartUseCase>(
        () => _i64.GetCartUseCase(gh<_i35.CartRepository>()));
    gh.factory<_i65.RemoveItemFromCartUseCase>(
        () => _i65.RemoveItemFromCartUseCase(gh<_i35.CartRepository>()));
    gh.factory<_i66.UpdateCountInCartUseCase>(
        () => _i66.UpdateCountInCartUseCase(gh<_i35.CartRepository>()));
    gh.factory<_i67.CategoryDetailsViewModel>(() =>
        _i67.CategoryDetailsViewModel(gh<_i50.GetRestaurantsByCategoryId>()));
    gh.factory<_i68.FavouriteViewModel>(() => _i68.FavouriteViewModel(
          gh<_i54.GetAllFavouritesUseCase>(),
          gh<_i52.AddToFavouriteUseCase>(),
        ));
    gh.factory<_i69.UpdatePasswordUseCase>(
        () => _i69.UpdatePasswordUseCase(gh<_i46.ProfileRepository>()));
    gh.factory<_i70.GetMenusUsecase>(
        () => _i70.GetMenusUsecase(gh<_i37.MenusRepo>()));
    gh.factory<_i71.MenuViewModel>(() => _i71.MenuViewModel(
          gh<_i70.GetMenusUsecase>(),
          gh<_i52.AddToFavouriteUseCase>(),
          gh<_i53.CheckFavouriteUseCase>(),
        ));
    gh.factory<_i72.MealDetailsViewModel>(
        () => _i72.MealDetailsViewModel(gh<_i62.AddToCartUseCase>()));
    gh.factory<_i73.AddDeliveryAddressUseCase>(() =>
        _i73.AddDeliveryAddressUseCase(gh<_i55.DeliveryAddressRepository>()));
    gh.factory<_i74.DeleteDeliveryAddressUseCase>(() =>
        _i74.DeleteDeliveryAddressUseCase(
            gh<_i55.DeliveryAddressRepository>()));
    gh.factory<_i75.GetAllDeliveryAddressessUseCase>(() =>
        _i75.GetAllDeliveryAddressessUseCase(
            gh<_i55.DeliveryAddressRepository>()));
    gh.factory<_i76.GetPrimaryDeliveryAddressUseCase>(() =>
        _i76.GetPrimaryDeliveryAddressUseCase(
            gh<_i55.DeliveryAddressRepository>()));
    gh.factory<_i77.UpdateDeliveryAddressUseCase>(() =>
        _i77.UpdateDeliveryAddressUseCase(
            gh<_i55.DeliveryAddressRepository>()));
    gh.factory<_i78.CartScreenViewModel>(() => _i78.CartScreenViewModel(
          gh<_i64.GetCartUseCase>(),
          gh<_i65.RemoveItemFromCartUseCase>(),
          gh<_i66.UpdateCountInCartUseCase>(),
          gh<_i63.DeleteCartUseCase>(),
        ));
    gh.factory<_i79.ProfileViewModel>(
        () => _i79.ProfileViewModel(gh<_i69.UpdatePasswordUseCase>()));
    gh.factory<_i80.FormAddressViewModel>(
        () => _i80.FormAddressViewModel(gh<_i73.AddDeliveryAddressUseCase>()));
    gh.factory<_i81.HomeTabViewModel>(() => _i81.HomeTabViewModel(
          gh<_i51.GetRestaurantsUsecase>(),
          gh<_i59.GetCategoriesUsecase>(),
          gh<_i76.GetPrimaryDeliveryAddressUseCase>(),
          gh<_i75.GetAllDeliveryAddressessUseCase>(),
          gh<_i77.UpdateDeliveryAddressUseCase>(),
          gh<_i45.GetPromotionsUseCase>(),
        ));
    gh.factory<_i82.ChangeAddressScreenViewModel>(
        () => _i82.ChangeAddressScreenViewModel(
              gh<_i73.AddDeliveryAddressUseCase>(),
              gh<_i74.DeleteDeliveryAddressUseCase>(),
              gh<_i75.GetAllDeliveryAddressessUseCase>(),
              gh<_i77.UpdateDeliveryAddressUseCase>(),
            ));
    gh.factory<_i83.CheckoutViewModel>(() => _i83.CheckoutViewModel(
          gh<_i23.CreateOnlineOrderUseCase>(),
          gh<_i22.CreateCashOrderUseCase>(),
          gh<_i26.MakePaymentUseCase>(),
          gh<_i76.GetPrimaryDeliveryAddressUseCase>(),
        ));
    return this;
  }
}
