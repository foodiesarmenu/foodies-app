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
import '../data/dataSourceContract/auth_remote_data_source.dart' as _i4;
import '../data/dataSourceContract/cart_data_source.dart' as _i8;
import '../data/dataSourceContract/CategoriesDataSource.dart' as _i12;
import '../data/dataSourceContract/delivery_address_data_source.dart' as _i17;
import '../data/dataSourceContract/favourite_data_source.dart' as _i21;
import '../data/dataSourceContract/MenusDataSource.dart' as _i32;
import '../data/dataSourceContract/order_data_source.dart' as _i36;
import '../data/dataSourceContract/profile_data_source.dart' as _i38;
import '../data/dataSourceContract/RestaurantsDataSource.dart' as _i45;
import '../data/dataSourceImpl/auth_remote_data_source_impl.dart' as _i5;
import '../data/dataSourceImpl/cart_data_source_impl.dart' as _i9;
import '../data/dataSourceImpl/CategoriesOnlineDataSourceImpl.dart' as _i13;
import '../data/dataSourceImpl/delivery_address_data_source_impl.dart' as _i18;
import '../data/dataSourceImpl/favourite_data_source_impl.dart' as _i22;
import '../data/dataSourceImpl/MenusOnlineDataSourceImpl.dart' as _i33;
import '../data/dataSourceImpl/order_data_source_impl.dart' as _i37;
import '../data/dataSourceImpl/profile_data_source_impl.dart' as _i39;
import '../data/dataSourceImpl/RestaurantsOnlineDataSourceImpl.dart' as _i46;
import '../data/repositoryImpl/auth_repo_impl.dart' as _i7;
import '../data/repositoryImpl/cart_repository_impl.dart' as _i11;
import '../data/repositoryImpl/CategoriesRepoImpl.dart' as _i15;
import '../data/repositoryImpl/delivery_address_repository_impl.dart' as _i20;
import '../data/repositoryImpl/favourite_repo_impl.dart' as _i24;
import '../data/repositoryImpl/MenusRepoImpl.dart' as _i35;
import '../data/repositoryImpl/order_repository_impl.dart' as _i68;
import '../data/repositoryImpl/profile_repository_impl.dart' as _i41;
import '../data/repositoryImpl/RestaurantsRepoImpl.dart' as _i48;
import '../domain/repositoryContract/auth_repository.dart' as _i6;
import '../domain/repositoryContract/cart_repository.dart' as _i10;
import '../domain/repositoryContract/CategoriesRepo.dart' as _i14;
import '../domain/repositoryContract/delivery_address_repository.dart' as _i19;
import '../domain/repositoryContract/favourite_repository.dart' as _i23;
import '../domain/repositoryContract/MenusRepo.dart' as _i34;
import '../domain/repositoryContract/order_repository.dart' as _i67;
import '../domain/repositoryContract/profile_repository.dart' as _i40;
import '../domain/repositoryContract/RestaurantsRepo.dart' as _i47;
import '../domain/usecase/add_delivery_address_use_case.dart' as _i53;
import '../domain/usecase/add_to_cart_use_case.dart' as _i54;
import '../domain/usecase/add_to_favourite_use_case.dart' as _i55;
import '../domain/usecase/check_favourite_use_case.dart' as _i57;
import '../domain/usecase/create_cash_order_use_case.dart' as _i72;
import '../domain/usecase/create_online_order_use_case.dart' as _i73;
import '../domain/usecase/delete_cart_use_case.dart' as _i16;
import '../domain/usecase/delete_delivery_address_use_case.dart' as _i58;
import '../domain/usecase/get_all_delivery_addressess_use_case.dart' as _i25;
import '../domain/usecase/get_all_favourites_use_case.dart' as _i26;
import '../domain/usecase/get_all_orders_use_case.dart' as _i74;
import '../domain/usecase/get_cart_use_case.dart' as _i27;
import '../domain/usecase/get_order_use_case.dart' as _i75;
import '../domain/usecase/get_primary_delivery_address_use_case.dart' as _i29;
import '../domain/usecase/GetCategoriesUsecase.dart' as _i28;
import '../domain/usecase/GetMenusUsecase.dart' as _i61;
import '../domain/usecase/GetRestaurantsByCategoryId.dart' as _i62;
import '../domain/usecase/GetRestaurantsUsecase.dart' as _i63;
import '../domain/usecase/login_use_case.dart' as _i30;
import '../domain/usecase/make_payment_use_case.dart' as _i76;
import '../domain/usecase/register_use_case.dart' as _i42;
import '../domain/usecase/remove_item_from_cart_use_case.dart' as _i44;
import '../domain/usecase/update_count_in_cart_use_case.dart' as _i50;
import '../domain/usecase/update_delivery_address_use_case.dart' as _i51;
import '../domain/usecase/update_password_use_case.dart' as _i52;
import '../ui/auth/login/cubit/login_view_model.dart' as _i31;
import '../ui/auth/register/cubit/register_view_model.dart' as _i43;
import '../ui/cart/cubit/cart_screen_view_model.dart' as _i56;
import '../ui/category_details/category_details_view_model.dart' as _i70;
import '../ui/change_address/cubit/change_address_view_model.dart' as _i71;
import '../ui/checkout/cubit/checkout_view_model.dart' as _i79;
import '../ui/home/home_tab/cubit/home_tab_view_model.dart' as _i64;
import '../ui/home/orders_tab/cubit/orders_tab_view_model.dart' as _i78;
import '../ui/home/profile_tab/cubit/profile_view_model.dart' as _i69;
import '../ui/home/profile_tab/favourite/cubit/favourite_view_model.dart'
    as _i59;
import '../ui/home/profile_tab/settings/address/form_address/cubit/form_address_view_model.dart'
    as _i60;
import '../ui/meal_details/cubit/meal_details_view_model.dart' as _i65;
import '../ui/menu/cubit/menu_view_model.dart' as _i66;
import '../ui/order_details/cubit/orders_details_view_model.dart' as _i77;
import '../ui/utils/stripe_service.dart' as _i49;

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
    gh.factory<_i4.AuthRemoteDataSource>(
        () => _i5.AuthRemoteDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.AuthRepository>(
        () => _i7.AuthRepoImpl(gh<_i4.AuthRemoteDataSource>()));
    gh.factory<_i8.CartDataSource>(
        () => _i9.CartDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.CartRepository>(
        () => _i11.CartRepositoryImpl(gh<_i8.CartDataSource>()));
    gh.factory<_i12.CategoriesDataSource>(
        () => _i13.CategoriesOnlineDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i14.CategoriesRepo>(
        () => _i15.CategoriesRepoImpl(gh<_i12.CategoriesDataSource>()));
    gh.factory<_i16.DeleteCartUseCase>(
        () => _i16.DeleteCartUseCase(gh<_i10.CartRepository>()));
    gh.factory<_i17.DeliveryAddressDataSource>(
        () => _i18.DeliveryAddressDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i19.DeliveryAddressRepository>(() =>
        _i20.DeliveryAddressRepositoryImpl(
            gh<_i17.DeliveryAddressDataSource>()));
    gh.factory<_i21.FavouriteDataSource>(
        () => _i22.FavouriteDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i23.FavouriteRepository>(
        () => _i24.FavouriteRepoImpl(gh<_i21.FavouriteDataSource>()));
    gh.factory<_i25.GetAllDeliveryAddressessUseCase>(() =>
        _i25.GetAllDeliveryAddressessUseCase(
            gh<_i19.DeliveryAddressRepository>()));
    gh.factory<_i26.GetAllFavouritesUseCase>(
        () => _i26.GetAllFavouritesUseCase(gh<_i23.FavouriteRepository>()));
    gh.factory<_i27.GetCartUseCase>(
        () => _i27.GetCartUseCase(gh<_i10.CartRepository>()));
    gh.factory<_i28.GetCategoriesUsecase>(
        () => _i28.GetCategoriesUsecase(gh<_i14.CategoriesRepo>()));
    gh.factory<_i29.GetPrimaryDeliveryAddressUseCase>(() =>
        _i29.GetPrimaryDeliveryAddressUseCase(
            gh<_i19.DeliveryAddressRepository>()));
    gh.factory<_i30.LoginUseCase>(
        () => _i30.LoginUseCase(gh<_i6.AuthRepository>()));
    gh.factory<_i31.LoginViewModel>(
        () => _i31.LoginViewModel(gh<_i30.LoginUseCase>()));
    gh.factory<_i32.MenusDataSource>(
        () => _i33.MenusOnlineDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i34.MenusRepo>(
        () => _i35.MenusRepoImpl(gh<_i32.MenusDataSource>()));
    gh.factory<_i36.OrderDataSource>(
        () => _i37.OrderDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i38.ProfileDataSource>(
        () => _i39.ProfileDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i40.ProfileRepository>(() => _i41.ProfileRepositoryImpl(
        profileDataSource: gh<_i38.ProfileDataSource>()));
    gh.factory<_i42.RegisterUseCase>(
        () => _i42.RegisterUseCase(gh<_i6.AuthRepository>()));
    gh.factory<_i43.RegisterViewModel>(
        () => _i43.RegisterViewModel(gh<_i42.RegisterUseCase>()));
    gh.factory<_i44.RemoveItemFromCartUseCase>(
        () => _i44.RemoveItemFromCartUseCase(gh<_i10.CartRepository>()));
    gh.factory<_i45.RestaurantsDataSource>(
        () => _i46.RestaurantsOnlineDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i47.RestaurantsRepo>(
        () => _i48.RestaurantsRepoImpl(gh<_i45.RestaurantsDataSource>()));
    gh.factory<_i49.StripeService>(
        () => _i49.StripeService(gh<_i3.ApiManager>()));
    gh.factory<_i50.UpdateCountInCartUseCase>(
        () => _i50.UpdateCountInCartUseCase(gh<_i10.CartRepository>()));
    gh.factory<_i51.UpdateDeliveryAddressUseCase>(() =>
        _i51.UpdateDeliveryAddressUseCase(
            gh<_i19.DeliveryAddressRepository>()));
    gh.factory<_i52.UpdatePasswordUseCase>(
        () => _i52.UpdatePasswordUseCase(gh<_i40.ProfileRepository>()));
    gh.factory<_i53.AddDeliveryAddressUseCase>(() =>
        _i53.AddDeliveryAddressUseCase(gh<_i19.DeliveryAddressRepository>()));
    gh.factory<_i54.AddToCartUseCase>(
        () => _i54.AddToCartUseCase(gh<_i10.CartRepository>()));
    gh.factory<_i55.AddToFavouriteUseCase>(
        () => _i55.AddToFavouriteUseCase(gh<_i23.FavouriteRepository>()));
    gh.factory<_i56.CartScreenViewModel>(() => _i56.CartScreenViewModel(
          gh<_i27.GetCartUseCase>(),
          gh<_i44.RemoveItemFromCartUseCase>(),
          gh<_i50.UpdateCountInCartUseCase>(),
          gh<_i16.DeleteCartUseCase>(),
        ));
    gh.factory<_i57.CheckFavouriteUseCase>(
        () => _i57.CheckFavouriteUseCase(gh<_i23.FavouriteRepository>()));
    gh.factory<_i58.DeleteDeliveryAddressUseCase>(() =>
        _i58.DeleteDeliveryAddressUseCase(
            gh<_i19.DeliveryAddressRepository>()));
    gh.factory<_i59.FavouriteViewModel>(() => _i59.FavouriteViewModel(
          gh<_i26.GetAllFavouritesUseCase>(),
          gh<_i55.AddToFavouriteUseCase>(),
        ));
    gh.factory<_i60.FormAddressViewModel>(
        () => _i60.FormAddressViewModel(gh<_i53.AddDeliveryAddressUseCase>()));
    gh.factory<_i61.GetMenusUsecase>(
        () => _i61.GetMenusUsecase(gh<_i34.MenusRepo>()));
    gh.factory<_i62.GetRestaurantsByCategoryId>(
        () => _i62.GetRestaurantsByCategoryId(gh<_i47.RestaurantsRepo>()));
    gh.factory<_i63.GetRestaurantsUsecase>(
        () => _i63.GetRestaurantsUsecase(gh<_i47.RestaurantsRepo>()));
    gh.factory<_i64.HomeTabViewModel>(() => _i64.HomeTabViewModel(
          gh<_i63.GetRestaurantsUsecase>(),
          gh<_i28.GetCategoriesUsecase>(),
          gh<_i29.GetPrimaryDeliveryAddressUseCase>(),
        ));
    gh.factory<_i65.MealDetailsViewModel>(
        () => _i65.MealDetailsViewModel(gh<_i54.AddToCartUseCase>()));
    gh.factory<_i66.MenuViewModel>(() => _i66.MenuViewModel(
          gh<_i61.GetMenusUsecase>(),
          gh<_i55.AddToFavouriteUseCase>(),
          gh<_i57.CheckFavouriteUseCase>(),
        ));
    gh.factory<_i67.OrderRepository>(() => _i68.OrderRepositoryImpl(
          gh<_i36.OrderDataSource>(),
          gh<_i49.StripeService>(),
        ));
    gh.factory<_i69.ProfileViewModel>(
        () => _i69.ProfileViewModel(gh<_i52.UpdatePasswordUseCase>()));
    gh.factory<_i70.CategoryDetailsViewModel>(() =>
        _i70.CategoryDetailsViewModel(gh<_i62.GetRestaurantsByCategoryId>()));
    gh.factory<_i71.ChangeAddressScreenViewModel>(
        () => _i71.ChangeAddressScreenViewModel(
              gh<_i53.AddDeliveryAddressUseCase>(),
              gh<_i58.DeleteDeliveryAddressUseCase>(),
              gh<_i25.GetAllDeliveryAddressessUseCase>(),
              gh<_i51.UpdateDeliveryAddressUseCase>(),
            ));
    gh.factory<_i72.CreateCashOrderUseCase>(
        () => _i72.CreateCashOrderUseCase(gh<_i67.OrderRepository>()));
    gh.factory<_i73.CreateOnlineOrderUseCase>(
        () => _i73.CreateOnlineOrderUseCase(gh<_i67.OrderRepository>()));
    gh.factory<_i74.GetAllOrdersUseCase>(
        () => _i74.GetAllOrdersUseCase(gh<_i67.OrderRepository>()));
    gh.factory<_i75.GetOrderUseCase>(
        () => _i75.GetOrderUseCase(gh<_i67.OrderRepository>()));
    gh.factory<_i76.MakePaymentUseCase>(
        () => _i76.MakePaymentUseCase(gh<_i67.OrderRepository>()));
    gh.factory<_i77.OrderDetailsViewModel>(
        () => _i77.OrderDetailsViewModel(gh<_i75.GetOrderUseCase>()));
    gh.factory<_i78.OrdersTabViewModel>(
        () => _i78.OrdersTabViewModel(gh<_i74.GetAllOrdersUseCase>()));
    gh.factory<_i79.CheckoutViewModel>(() => _i79.CheckoutViewModel(
          gh<_i73.CreateOnlineOrderUseCase>(),
          gh<_i72.CreateCashOrderUseCase>(),
          gh<_i76.MakePaymentUseCase>(),
          gh<_i29.GetPrimaryDeliveryAddressUseCase>(),
        ));
    return this;
  }
}
