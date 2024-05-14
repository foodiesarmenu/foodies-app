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
import '../data/dataSourceContract/auth_remote_data_source.dart' as _i10;
import '../data/dataSourceContract/cart_data_source.dart' as _i6;
import '../data/dataSourceContract/CategoriesDataSource.dart' as _i27;
import '../data/dataSourceContract/delivery_address_data_source.dart' as _i15;
import '../data/dataSourceContract/favourite_data_source.dart' as _i8;
import '../data/dataSourceContract/MenusDataSource.dart' as _i29;
import '../data/dataSourceContract/order_data_source.dart' as _i4;
import '../data/dataSourceContract/profile_data_source.dart' as _i39;
import '../data/dataSourceContract/RestaurantsDataSource.dart' as _i24;
import '../data/dataSourceImpl/auth_remote_data_source_impl.dart' as _i11;
import '../data/dataSourceImpl/cart_data_source_impl.dart' as _i7;
import '../data/dataSourceImpl/CategoriesOnlineDataSourceImpl.dart' as _i28;
import '../data/dataSourceImpl/delivery_address_data_source_impl.dart' as _i16;
import '../data/dataSourceImpl/favourite_data_source_impl.dart' as _i9;
import '../data/dataSourceImpl/MenusOnlineDataSourceImpl.dart' as _i30;
import '../data/dataSourceImpl/order_data_source_impl.dart' as _i5;
import '../data/dataSourceImpl/profile_data_source_impl.dart' as _i40;
import '../data/dataSourceImpl/RestaurantsOnlineDataSourceImpl.dart' as _i25;
import '../data/repositoryImpl/auth_repo_impl.dart' as _i18;
import '../data/repositoryImpl/cart_repository_impl.dart' as _i32;
import '../data/repositoryImpl/CategoriesRepoImpl.dart' as _i36;
import '../data/repositoryImpl/delivery_address_repository_impl.dart' as _i51;
import '../data/repositoryImpl/favourite_repo_impl.dart' as _i38;
import '../data/repositoryImpl/MenusRepoImpl.dart' as _i34;
import '../data/repositoryImpl/order_repository_impl.dart' as _i14;
import '../data/repositoryImpl/profile_repository_impl.dart' as _i44;
import '../data/repositoryImpl/RestaurantsRepoImpl.dart' as _i42;
import '../domain/repositoryContract/auth_repository.dart' as _i17;
import '../domain/repositoryContract/cart_repository.dart' as _i31;
import '../domain/repositoryContract/CategoriesRepo.dart' as _i35;
import '../domain/repositoryContract/delivery_address_repository.dart' as _i50;
import '../domain/repositoryContract/favourite_repository.dart' as _i37;
import '../domain/repositoryContract/MenusRepo.dart' as _i33;
import '../domain/repositoryContract/order_repository.dart' as _i13;
import '../domain/repositoryContract/profile_repository.dart' as _i43;
import '../domain/repositoryContract/RestaurantsRepo.dart' as _i41;
import '../domain/usecase/add_delivery_address_use_case.dart' as _i68;
import '../domain/usecase/add_to_cart_use_case.dart' as _i55;
import '../domain/usecase/add_to_favourite_use_case.dart' as _i47;
import '../domain/usecase/check_favourite_use_case.dart' as _i48;
import '../domain/usecase/create_cash_order_use_case.dart' as _i19;
import '../domain/usecase/create_online_order_use_case.dart' as _i20;
import '../domain/usecase/delete_cart_use_case.dart' as _i56;
import '../domain/usecase/delete_delivery_address_use_case.dart' as _i69;
import '../domain/usecase/get_all_delivery_addressess_use_case.dart' as _i70;
import '../domain/usecase/get_all_favourites_use_case.dart' as _i49;
import '../domain/usecase/get_all_orders_use_case.dart' as _i21;
import '../domain/usecase/get_cart_use_case.dart' as _i57;
import '../domain/usecase/get_order_use_case.dart' as _i22;
import '../domain/usecase/get_primary_delivery_address_use_case.dart' as _i71;
import '../domain/usecase/GetCategoriesUsecase.dart' as _i60;
import '../domain/usecase/GetMenusUsecase.dart' as _i65;
import '../domain/usecase/GetRestaurantsByCategoryId.dart' as _i62;
import '../domain/usecase/GetRestaurantsUsecase.dart' as _i63;
import '../domain/usecase/login_use_case.dart' as _i45;
import '../domain/usecase/make_payment_use_case.dart' as _i23;
import '../domain/usecase/register_use_case.dart' as _i46;
import '../domain/usecase/remove_item_from_cart_use_case.dart' as _i58;
import '../domain/usecase/update_count_in_cart_use_case.dart' as _i59;
import '../domain/usecase/update_delivery_address_use_case.dart' as _i72;
import '../domain/usecase/update_password_use_case.dart' as _i64;
import '../ui/auth/login/cubit/login_view_model.dart' as _i52;
import '../ui/auth/register/cubit/register_view_model.dart' as _i53;
import '../ui/cart/cubit/cart_screen_view_model.dart' as _i73;
import '../ui/category_details/category_details_view_model.dart' as _i76;
import '../ui/change_address/cubit/change_address_view_model.dart' as _i77;
import '../ui/checkout/cubit/checkout_view_model.dart' as _i79;
import '../ui/home/home_tab/cubit/home_tab_view_model.dart' as _i78;
import '../ui/home/orders_tab/cubit/orders_tab_view_model.dart' as _i26;
import '../ui/home/profile_tab/cubit/profile_view_model.dart' as _i74;
import '../ui/home/profile_tab/favourite/cubit/favourite_view_model.dart'
    as _i61;
import '../ui/home/profile_tab/settings/my_addresses/form_address/cubit/form_address_view_model.dart'
    as _i75;
import '../ui/meal_details/cubit/meal_details_view_model.dart' as _i67;
import '../ui/menu/cubit/menu_view_model.dart' as _i66;
import '../ui/order_details/cubit/orders_details_view_model.dart' as _i54;
import '../ui/utils/stripe_service.dart' as _i12;

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
    gh.factory<_i4.OrderDataSource>(
        () => _i5.OrderDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.CartDataSource>(
        () => _i7.CartDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i8.FavouriteDataSource>(
        () => _i9.FavouriteDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.AuthRemoteDataSource>(
        () => _i11.AuthRemoteDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i12.StripeService>(
        () => _i12.StripeService(gh<_i3.ApiManager>()));
    gh.factory<_i13.OrderRepository>(() => _i14.OrderRepositoryImpl(
          gh<_i4.OrderDataSource>(),
          gh<_i12.StripeService>(),
        ));
    gh.factory<_i15.DeliveryAddressDataSource>(
        () => _i16.DeliveryAddressDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i17.AuthRepository>(
        () => _i18.AuthRepoImpl(gh<_i10.AuthRemoteDataSource>()));
    gh.factory<_i19.CreateCashOrderUseCase>(
        () => _i19.CreateCashOrderUseCase(gh<_i13.OrderRepository>()));
    gh.factory<_i20.CreateOnlineOrderUseCase>(
        () => _i20.CreateOnlineOrderUseCase(gh<_i13.OrderRepository>()));
    gh.factory<_i21.GetAllOrdersUseCase>(
        () => _i21.GetAllOrdersUseCase(gh<_i13.OrderRepository>()));
    gh.factory<_i22.GetOrderUseCase>(
        () => _i22.GetOrderUseCase(gh<_i13.OrderRepository>()));
    gh.factory<_i23.MakePaymentUseCase>(
        () => _i23.MakePaymentUseCase(gh<_i13.OrderRepository>()));
    gh.factory<_i24.RestaurantsDataSource>(
        () => _i25.RestaurantsOnlineDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i26.OrdersTabViewModel>(
        () => _i26.OrdersTabViewModel(gh<_i21.GetAllOrdersUseCase>()));
    gh.factory<_i27.CategoriesDataSource>(
        () => _i28.CategoriesOnlineDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i29.MenusDataSource>(
        () => _i30.MenusOnlineDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i31.CartRepository>(
        () => _i32.CartRepositoryImpl(gh<_i6.CartDataSource>()));
    gh.factory<_i33.MenusRepo>(
        () => _i34.MenusRepoImpl(gh<_i29.MenusDataSource>()));
    gh.factory<_i35.CategoriesRepo>(
        () => _i36.CategoriesRepoImpl(gh<_i27.CategoriesDataSource>()));
    gh.factory<_i37.FavouriteRepository>(
        () => _i38.FavouriteRepoImpl(gh<_i8.FavouriteDataSource>()));
    gh.factory<_i39.ProfileDataSource>(
        () => _i40.ProfileDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i41.RestaurantsRepo>(
        () => _i42.RestaurantsRepoImpl(gh<_i24.RestaurantsDataSource>()));
    gh.factory<_i43.ProfileRepository>(() => _i44.ProfileRepositoryImpl(
        profileDataSource: gh<_i39.ProfileDataSource>()));
    gh.factory<_i45.LoginUseCase>(
        () => _i45.LoginUseCase(gh<_i17.AuthRepository>()));
    gh.factory<_i46.RegisterUseCase>(
        () => _i46.RegisterUseCase(gh<_i17.AuthRepository>()));
    gh.factory<_i47.AddToFavouriteUseCase>(
        () => _i47.AddToFavouriteUseCase(gh<_i37.FavouriteRepository>()));
    gh.factory<_i48.CheckFavouriteUseCase>(
        () => _i48.CheckFavouriteUseCase(gh<_i37.FavouriteRepository>()));
    gh.factory<_i49.GetAllFavouritesUseCase>(
        () => _i49.GetAllFavouritesUseCase(gh<_i37.FavouriteRepository>()));
    gh.factory<_i50.DeliveryAddressRepository>(() =>
        _i51.DeliveryAddressRepositoryImpl(
            gh<_i15.DeliveryAddressDataSource>()));
    gh.factory<_i52.LoginViewModel>(
        () => _i52.LoginViewModel(gh<_i45.LoginUseCase>()));
    gh.factory<_i53.RegisterViewModel>(
        () => _i53.RegisterViewModel(gh<_i46.RegisterUseCase>()));
    gh.factory<_i54.OrderDetailsViewModel>(
        () => _i54.OrderDetailsViewModel(gh<_i22.GetOrderUseCase>()));
    gh.factory<_i55.AddToCartUseCase>(
        () => _i55.AddToCartUseCase(gh<_i31.CartRepository>()));
    gh.factory<_i56.DeleteCartUseCase>(
        () => _i56.DeleteCartUseCase(gh<_i31.CartRepository>()));
    gh.factory<_i57.GetCartUseCase>(
        () => _i57.GetCartUseCase(gh<_i31.CartRepository>()));
    gh.factory<_i58.RemoveItemFromCartUseCase>(
        () => _i58.RemoveItemFromCartUseCase(gh<_i31.CartRepository>()));
    gh.factory<_i59.UpdateCountInCartUseCase>(
        () => _i59.UpdateCountInCartUseCase(gh<_i31.CartRepository>()));
    gh.factory<_i60.GetCategoriesUsecase>(
        () => _i60.GetCategoriesUsecase(gh<_i35.CategoriesRepo>()));
    gh.factory<_i61.FavouriteViewModel>(() => _i61.FavouriteViewModel(
          gh<_i49.GetAllFavouritesUseCase>(),
          gh<_i47.AddToFavouriteUseCase>(),
        ));
    gh.factory<_i62.GetRestaurantsByCategoryId>(
        () => _i62.GetRestaurantsByCategoryId(gh<_i41.RestaurantsRepo>()));
    gh.factory<_i63.GetRestaurantsUsecase>(
        () => _i63.GetRestaurantsUsecase(gh<_i41.RestaurantsRepo>()));
    gh.factory<_i64.UpdatePasswordUseCase>(
        () => _i64.UpdatePasswordUseCase(gh<_i43.ProfileRepository>()));
    gh.factory<_i65.GetMenusUsecase>(
        () => _i65.GetMenusUsecase(gh<_i33.MenusRepo>()));
    gh.factory<_i66.MenuViewModel>(() => _i66.MenuViewModel(
          gh<_i65.GetMenusUsecase>(),
          gh<_i47.AddToFavouriteUseCase>(),
          gh<_i48.CheckFavouriteUseCase>(),
        ));
    gh.factory<_i67.MealDetailsViewModel>(
        () => _i67.MealDetailsViewModel(gh<_i55.AddToCartUseCase>()));
    gh.factory<_i68.AddDeliveryAddressUseCase>(() =>
        _i68.AddDeliveryAddressUseCase(gh<_i50.DeliveryAddressRepository>()));
    gh.factory<_i69.DeleteDeliveryAddressUseCase>(() =>
        _i69.DeleteDeliveryAddressUseCase(
            gh<_i50.DeliveryAddressRepository>()));
    gh.factory<_i70.GetAllDeliveryAddressessUseCase>(() =>
        _i70.GetAllDeliveryAddressessUseCase(
            gh<_i50.DeliveryAddressRepository>()));
    gh.factory<_i71.GetPrimaryDeliveryAddressUseCase>(() =>
        _i71.GetPrimaryDeliveryAddressUseCase(
            gh<_i50.DeliveryAddressRepository>()));
    gh.factory<_i72.UpdateDeliveryAddressUseCase>(() =>
        _i72.UpdateDeliveryAddressUseCase(
            gh<_i50.DeliveryAddressRepository>()));
    gh.factory<_i73.CartScreenViewModel>(() => _i73.CartScreenViewModel(
          gh<_i57.GetCartUseCase>(),
          gh<_i58.RemoveItemFromCartUseCase>(),
          gh<_i59.UpdateCountInCartUseCase>(),
          gh<_i56.DeleteCartUseCase>(),
        ));
    gh.factory<_i74.ProfileViewModel>(
        () => _i74.ProfileViewModel(gh<_i64.UpdatePasswordUseCase>()));
    gh.factory<_i75.FormAddressViewModel>(
        () => _i75.FormAddressViewModel(gh<_i68.AddDeliveryAddressUseCase>()));
    gh.factory<_i76.CategoryDetailsViewModel>(() =>
        _i76.CategoryDetailsViewModel(gh<_i62.GetRestaurantsByCategoryId>()));
    gh.factory<_i77.ChangeAddressScreenViewModel>(
        () => _i77.ChangeAddressScreenViewModel(
              gh<_i68.AddDeliveryAddressUseCase>(),
              gh<_i69.DeleteDeliveryAddressUseCase>(),
              gh<_i70.GetAllDeliveryAddressessUseCase>(),
              gh<_i72.UpdateDeliveryAddressUseCase>(),
            ));
    gh.factory<_i78.HomeTabViewModel>(() => _i78.HomeTabViewModel(
          gh<_i63.GetRestaurantsUsecase>(),
          gh<_i60.GetCategoriesUsecase>(),
          gh<_i71.GetPrimaryDeliveryAddressUseCase>(),
          gh<_i70.GetAllDeliveryAddressessUseCase>(),
          gh<_i72.UpdateDeliveryAddressUseCase>(),
        ));
    gh.factory<_i79.CheckoutViewModel>(() => _i79.CheckoutViewModel(
          gh<_i20.CreateOnlineOrderUseCase>(),
          gh<_i19.CreateCashOrderUseCase>(),
          gh<_i23.MakePaymentUseCase>(),
          gh<_i71.GetPrimaryDeliveryAddressUseCase>(),
        ));
    return this;
  }
}
