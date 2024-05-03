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
import '../data/dataSourceContract/favourite_data_source.dart' as _i17;
import '../data/dataSourceContract/MenusDataSource.dart' as _i26;
import '../data/dataSourceContract/order_data_source.dart' as _i30;
import '../data/dataSourceContract/profile_data_source.dart' as _i32;
import '../data/dataSourceContract/RestaurantsDataSource.dart' as _i39;
import '../data/dataSourceImpl/auth_remote_data_source_impl.dart' as _i5;
import '../data/dataSourceImpl/cart_data_source_impl.dart' as _i9;
import '../data/dataSourceImpl/CategoriesOnlineDataSourceImpl.dart' as _i13;
import '../data/dataSourceImpl/favourite_data_source_impl.dart' as _i18;
import '../data/dataSourceImpl/MenusOnlineDataSourceImpl.dart' as _i27;
import '../data/dataSourceImpl/order_data_source_impl.dart' as _i31;
import '../data/dataSourceImpl/profile_data_source_impl.dart' as _i33;
import '../data/dataSourceImpl/RestaurantsOnlineDataSourceImpl.dart' as _i40;
import '../data/repositoryImpl/auth_repo_impl.dart' as _i7;
import '../data/repositoryImpl/cart_repository_impl.dart' as _i11;
import '../data/repositoryImpl/CategoriesRepoImpl.dart' as _i15;
import '../data/repositoryImpl/favourite_repo_impl.dart' as _i20;
import '../data/repositoryImpl/MenusRepoImpl.dart' as _i29;
import '../data/repositoryImpl/order_repository_impl.dart' as _i58;
import '../data/repositoryImpl/profile_repository_impl.dart' as _i35;
import '../data/repositoryImpl/RestaurantsRepoImpl.dart' as _i42;
import '../domain/repositoryContract/auth_repository.dart' as _i6;
import '../domain/repositoryContract/cart_repository.dart' as _i10;
import '../domain/repositoryContract/CategoriesRepo.dart' as _i14;
import '../domain/repositoryContract/favourite_repository.dart' as _i19;
import '../domain/repositoryContract/MenusRepo.dart' as _i28;
import '../domain/repositoryContract/order_repository.dart' as _i57;
import '../domain/repositoryContract/profile_repository.dart' as _i34;
import '../domain/repositoryContract/RestaurantsRepo.dart' as _i41;
import '../domain/usecase/add_to_cart_use_case.dart' as _i46;
import '../domain/usecase/add_to_favourite_use_case.dart' as _i47;
import '../domain/usecase/check_favourite_use_case.dart' as _i49;
import '../domain/usecase/create_cash_order_use_case.dart' as _i61;
import '../domain/usecase/create_online_order_use_case.dart' as _i62;
import '../domain/usecase/delete_cart_use_case.dart' as _i16;
import '../domain/usecase/get_all_favourites_use_case.dart' as _i21;
import '../domain/usecase/get_all_orders_use_case.dart' as _i63;
import '../domain/usecase/get_cart_use_case.dart' as _i22;
import '../domain/usecase/get_order_use_case.dart' as _i64;
import '../domain/usecase/GetCategoriesUsecase.dart' as _i23;
import '../domain/usecase/GetMenusUsecase.dart' as _i51;
import '../domain/usecase/GetRestaurantsByCategoryId.dart' as _i52;
import '../domain/usecase/GetRestaurantsUsecase.dart' as _i53;
import '../domain/usecase/login_use_case.dart' as _i24;
import '../domain/usecase/make_payment_use_case.dart' as _i65;
import '../domain/usecase/register_use_case.dart' as _i36;
import '../domain/usecase/remove_item_from_cart_use_case.dart' as _i38;
import '../domain/usecase/update_count_in_cart_use_case.dart' as _i44;
import '../domain/usecase/update_password_use_case.dart' as _i45;
import '../ui/auth/login/cubit/login_view_model.dart' as _i25;
import '../ui/auth/register/cubit/register_view_model.dart' as _i37;
import '../ui/cart/cubit/cart_screen_view_model.dart' as _i48;
import '../ui/category_details/category_details_view_model.dart' as _i60;
import '../ui/checkout/cubit/checkout_view_model.dart' as _i68;
import '../ui/home/home_tab/cubit/home_tab_view_model.dart' as _i54;
import '../ui/home/orders_tab/cubit/orders_tab_view_model.dart' as _i67;
import '../ui/home/profile_tab/cubit/profile_view_model.dart' as _i59;
import '../ui/home/profile_tab/favourite/cubit/favourite_view_model.dart'
    as _i50;
import '../ui/meal_details/cubit/meal_details_view_model.dart' as _i55;
import '../ui/menu/cubit/menu_view_model.dart' as _i56;
import '../ui/order_details/cubit/orders_details_view_model.dart' as _i66;
import '../ui/utils/stripe_service.dart' as _i43;

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
    gh.factory<_i17.FavouriteDataSource>(
        () => _i18.FavouriteDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i19.FavouriteRepository>(
        () => _i20.FavouriteRepoImpl(gh<_i17.FavouriteDataSource>()));
    gh.factory<_i21.GetAllFavouritesUseCase>(
        () => _i21.GetAllFavouritesUseCase(gh<_i19.FavouriteRepository>()));
    gh.factory<_i22.GetCartUseCase>(
        () => _i22.GetCartUseCase(gh<_i10.CartRepository>()));
    gh.factory<_i23.GetCategoriesUsecase>(
        () => _i23.GetCategoriesUsecase(gh<_i14.CategoriesRepo>()));
    gh.factory<_i24.LoginUseCase>(
        () => _i24.LoginUseCase(gh<_i6.AuthRepository>()));
    gh.factory<_i25.LoginViewModel>(
        () => _i25.LoginViewModel(gh<_i24.LoginUseCase>()));
    gh.factory<_i26.MenusDataSource>(
        () => _i27.MenusOnlineDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i28.MenusRepo>(
        () => _i29.MenusRepoImpl(gh<_i26.MenusDataSource>()));
    gh.factory<_i30.OrderDataSource>(
        () => _i31.OrderDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i32.ProfileDataSource>(
        () => _i33.ProfileDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i34.ProfileRepository>(() => _i35.ProfileRepositoryImpl(
        profileDataSource: gh<_i32.ProfileDataSource>()));
    gh.factory<_i36.RegisterUseCase>(
        () => _i36.RegisterUseCase(gh<_i6.AuthRepository>()));
    gh.factory<_i37.RegisterViewModel>(
        () => _i37.RegisterViewModel(gh<_i36.RegisterUseCase>()));
    gh.factory<_i38.RemoveItemFromCartUseCase>(
        () => _i38.RemoveItemFromCartUseCase(gh<_i10.CartRepository>()));
    gh.factory<_i39.RestaurantsDataSource>(
        () => _i40.RestaurantsOnlineDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i41.RestaurantsRepo>(
        () => _i42.RestaurantsRepoImpl(gh<_i39.RestaurantsDataSource>()));
    gh.factory<_i43.StripeService>(
        () => _i43.StripeService(gh<_i3.ApiManager>()));
    gh.factory<_i44.UpdateCountInCartUseCase>(
        () => _i44.UpdateCountInCartUseCase(gh<_i10.CartRepository>()));
    gh.factory<_i45.UpdatePasswordUseCase>(
        () => _i45.UpdatePasswordUseCase(gh<_i34.ProfileRepository>()));
    gh.factory<_i46.AddToCartUseCase>(
        () => _i46.AddToCartUseCase(gh<_i10.CartRepository>()));
    gh.factory<_i47.AddToFavouriteUseCase>(
        () => _i47.AddToFavouriteUseCase(gh<_i19.FavouriteRepository>()));
    gh.factory<_i48.CartScreenViewModel>(() => _i48.CartScreenViewModel(
          gh<_i22.GetCartUseCase>(),
          gh<_i38.RemoveItemFromCartUseCase>(),
          gh<_i44.UpdateCountInCartUseCase>(),
          gh<_i16.DeleteCartUseCase>(),
        ));
    gh.factory<_i49.CheckFavouriteUseCase>(
        () => _i49.CheckFavouriteUseCase(gh<_i19.FavouriteRepository>()));
    gh.factory<_i50.FavouriteViewModel>(() => _i50.FavouriteViewModel(
          gh<_i21.GetAllFavouritesUseCase>(),
          gh<_i47.AddToFavouriteUseCase>(),
        ));
    gh.factory<_i51.GetMenusUsecase>(
        () => _i51.GetMenusUsecase(gh<_i28.MenusRepo>()));
    gh.factory<_i52.GetRestaurantsByCategoryId>(
        () => _i52.GetRestaurantsByCategoryId(gh<_i41.RestaurantsRepo>()));
    gh.factory<_i53.GetRestaurantsUsecase>(
        () => _i53.GetRestaurantsUsecase(gh<_i41.RestaurantsRepo>()));
    gh.factory<_i54.HomeTabViewModel>(() => _i54.HomeTabViewModel(
          gh<_i53.GetRestaurantsUsecase>(),
          gh<_i23.GetCategoriesUsecase>(),
        ));
    gh.factory<_i55.MealDetailsViewModel>(
        () => _i55.MealDetailsViewModel(gh<_i46.AddToCartUseCase>()));
    gh.factory<_i56.MenuViewModel>(() => _i56.MenuViewModel(
          gh<_i51.GetMenusUsecase>(),
          gh<_i47.AddToFavouriteUseCase>(),
          gh<_i49.CheckFavouriteUseCase>(),
        ));
    gh.factory<_i57.OrderRepository>(() => _i58.OrderRepositoryImpl(
          gh<_i30.OrderDataSource>(),
          gh<_i43.StripeService>(),
        ));
    gh.factory<_i59.ProfileViewModel>(
        () => _i59.ProfileViewModel(gh<_i45.UpdatePasswordUseCase>()));
    gh.factory<_i60.CategoryDetailsViewModel>(() =>
        _i60.CategoryDetailsViewModel(gh<_i52.GetRestaurantsByCategoryId>()));
    gh.factory<_i61.CreateCashOrderUseCase>(
        () => _i61.CreateCashOrderUseCase(gh<_i57.OrderRepository>()));
    gh.factory<_i62.CreateOnlineOrderUseCase>(
        () => _i62.CreateOnlineOrderUseCase(gh<_i57.OrderRepository>()));
    gh.factory<_i63.GetAllOrdersUseCase>(
        () => _i63.GetAllOrdersUseCase(gh<_i57.OrderRepository>()));
    gh.factory<_i64.GetOrderUseCase>(
        () => _i64.GetOrderUseCase(gh<_i57.OrderRepository>()));
    gh.factory<_i65.MakePaymentUseCase>(
        () => _i65.MakePaymentUseCase(gh<_i57.OrderRepository>()));
    gh.factory<_i66.OrderDetailsViewModel>(
        () => _i66.OrderDetailsViewModel(gh<_i64.GetOrderUseCase>()));
    gh.factory<_i67.OrdersTabViewModel>(
        () => _i67.OrdersTabViewModel(gh<_i63.GetAllOrdersUseCase>()));
    gh.factory<_i68.CheckoutViewModel>(() => _i68.CheckoutViewModel(
          gh<_i62.CreateOnlineOrderUseCase>(),
          gh<_i61.CreateCashOrderUseCase>(),
          gh<_i65.MakePaymentUseCase>(),
        ));
    return this;
  }
}
