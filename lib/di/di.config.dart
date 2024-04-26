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
import '../data/dataSourceContract/CategoriesDataSource.dart' as _i12;
import '../data/dataSourceContract/MenusDataSource.dart' as _i25;
import '../data/dataSourceContract/RestaurantsDataSource.dart' as _i38;
import '../data/dataSourceContract/auth_remote_data_source.dart' as _i4;
import '../data/dataSourceContract/cart_data_source.dart' as _i8;
import '../data/dataSourceContract/favourite_data_source.dart' as _i17;
import '../data/dataSourceContract/order_data_soruce.dart' as _i29;
import '../data/dataSourceContract/profile_data_source.dart' as _i31;
import '../data/dataSourceImpl/CategoriesOnlineDataSourceImpl.dart' as _i13;
import '../data/dataSourceImpl/MenusOnlineDataSourceImpl.dart' as _i26;
import '../data/dataSourceImpl/RestaurantsOnlineDataSourceImpl.dart' as _i39;
import '../data/dataSourceImpl/auth_remote_data_source_impl.dart' as _i5;
import '../data/dataSourceImpl/cart_data_source_impl.dart' as _i9;
import '../data/dataSourceImpl/favourite_data_source_impl.dart' as _i18;
import '../data/dataSourceImpl/order_data_source_impl.dart' as _i30;
import '../data/dataSourceImpl/profile_data_source_impl.dart' as _i32;
import '../data/repositoryImpl/CategoriesRepoImpl.dart' as _i15;
import '../data/repositoryImpl/MenusRepoImpl.dart' as _i28;
import '../data/repositoryImpl/RestaurantsRepoImpl.dart' as _i41;
import '../data/repositoryImpl/auth_repo_impl.dart' as _i7;
import '../data/repositoryImpl/cart_repository_impl.dart' as _i11;
import '../data/repositoryImpl/favourite_repo_impl.dart' as _i20;
import '../data/repositoryImpl/order_repository_impl.dart' as _i55;
import '../data/repositoryImpl/profile_repository_impl.dart' as _i34;
import '../domain/repositoryContract/CategoriesRepo.dart' as _i14;
import '../domain/repositoryContract/MenusRepo.dart' as _i27;
import '../domain/repositoryContract/RestaurantsRepo.dart' as _i40;
import '../domain/repositoryContract/auth_repository.dart' as _i6;
import '../domain/repositoryContract/cart_repository.dart' as _i10;
import '../domain/repositoryContract/favourite_repository.dart' as _i19;
import '../domain/repositoryContract/order_repository.dart' as _i54;
import '../domain/repositoryContract/profile_repository.dart' as _i33;
import '../domain/usecase/GetCategoriesUsecase.dart' as _i22;
import '../domain/usecase/GetMenusUsecase.dart' as _i48;
import '../domain/usecase/GetRestaurantsByCategoryId.dart' as _i49;
import '../domain/usecase/GetRestaurantsUsecase.dart' as _i50;
import '../domain/usecase/add_to_cart_use_case.dart' as _i45;
import '../domain/usecase/add_to_favourite_use_case.dart' as _i46;
import '../domain/usecase/create_cash_order_use_case.dart' as _i58;
import '../domain/usecase/create_online_order_use_case.dart' as _i59;
import '../domain/usecase/delete_cart_use_case.dart' as _i16;
import '../domain/usecase/get_cart_use_case.dart' as _i21;
import '../domain/usecase/login_use_case.dart' as _i23;
import '../domain/usecase/make_payment_use_case.dart' as _i60;
import '../domain/usecase/register_use_case.dart' as _i35;
import '../domain/usecase/remove_item_from_cart_use_case.dart' as _i37;
import '../domain/usecase/update_count_in_cart_use_case.dart' as _i43;
import '../domain/usecase/update_password_use_case.dart' as _i44;
import '../ui/auth/login/cubit/login_view_model.dart' as _i24;
import '../ui/auth/register/cubit/register_view_model.dart' as _i36;
import '../ui/cart/cubit/cart_screen_view_model.dart' as _i47;
import '../ui/category_details/category_details_view_model.dart' as _i57;
import '../ui/checkout/cubit/checkout_view_model.dart' as _i61;
import '../ui/home/home_tab/cubit/home_tab_view_model.dart' as _i51;
import '../ui/home/profile_tab/cubit/profile_view_model.dart' as _i56;
import '../ui/meal_details/cubit/meal_details_view_model.dart' as _i52;
import '../ui/menu/cubit/menu_view_model.dart' as _i53;
import '../ui/utils/stripe_service.dart' as _i42;

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
    gh.factory<_i21.GetCartUseCase>(
        () => _i21.GetCartUseCase(gh<_i10.CartRepository>()));
    gh.factory<_i22.GetCategoriesUsecase>(
        () => _i22.GetCategoriesUsecase(gh<_i14.CategoriesRepo>()));
    gh.factory<_i23.LoginUseCase>(
        () => _i23.LoginUseCase(gh<_i6.AuthRepository>()));
    gh.factory<_i24.LoginViewModel>(
        () => _i24.LoginViewModel(gh<_i23.LoginUseCase>()));
    gh.factory<_i25.MenusDataSource>(
        () => _i26.MenusOnlineDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i27.MenusRepo>(
        () => _i28.MenusRepoImpl(gh<_i25.MenusDataSource>()));
    gh.factory<_i29.OrderDataSource>(
        () => _i30.OrderDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i31.ProfileDataSource>(
        () => _i32.ProfileDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i33.ProfileRepository>(() => _i34.ProfileRepositoryImpl(
        profileDataSource: gh<_i31.ProfileDataSource>()));
    gh.factory<_i35.RegisterUseCase>(
        () => _i35.RegisterUseCase(gh<_i6.AuthRepository>()));
    gh.factory<_i36.RegisterViewModel>(
        () => _i36.RegisterViewModel(gh<_i35.RegisterUseCase>()));
    gh.factory<_i37.RemoveItemFromCartUseCase>(
        () => _i37.RemoveItemFromCartUseCase(gh<_i10.CartRepository>()));
    gh.factory<_i38.RestaurantsDataSource>(
        () => _i39.RestaurantsOnlineDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i40.RestaurantsRepo>(
        () => _i41.RestaurantsRepoImpl(gh<_i38.RestaurantsDataSource>()));
    gh.factory<_i42.StripeService>(
        () => _i42.StripeService(gh<_i3.ApiManager>()));
    gh.factory<_i43.UpdateCountInCartUseCase>(
        () => _i43.UpdateCountInCartUseCase(gh<_i10.CartRepository>()));
    gh.factory<_i44.UpdatePasswordUseCase>(
        () => _i44.UpdatePasswordUseCase(gh<_i33.ProfileRepository>()));
    gh.factory<_i45.AddToCartUseCase>(
        () => _i45.AddToCartUseCase(gh<_i10.CartRepository>()));
    gh.factory<_i46.AddToFavouriteUseCase>(
        () => _i46.AddToFavouriteUseCase(gh<_i19.FavouriteRepository>()));
    gh.factory<_i47.CartScreenViewModel>(() => _i47.CartScreenViewModel(
          gh<_i21.GetCartUseCase>(),
          gh<_i37.RemoveItemFromCartUseCase>(),
          gh<_i43.UpdateCountInCartUseCase>(),
          gh<_i16.DeleteCartUseCase>(),
        ));
    gh.factory<_i48.GetMenusUsecase>(
        () => _i48.GetMenusUsecase(gh<_i27.MenusRepo>()));
    gh.factory<_i49.GetRestaurantsByCategoryId>(
        () => _i49.GetRestaurantsByCategoryId(gh<_i40.RestaurantsRepo>()));
    gh.factory<_i50.GetRestaurantsUsecase>(
        () => _i50.GetRestaurantsUsecase(gh<_i40.RestaurantsRepo>()));
    gh.factory<_i51.HomeTabViewModel>(() => _i51.HomeTabViewModel(
          gh<_i50.GetRestaurantsUsecase>(),
          gh<_i22.GetCategoriesUsecase>(),
        ));
    gh.factory<_i52.MealDetailsViewModel>(
        () => _i52.MealDetailsViewModel(gh<_i45.AddToCartUseCase>()));
    gh.factory<_i53.MenuViewModel>(() => _i53.MenuViewModel(
          gh<_i48.GetMenusUsecase>(),
          gh<_i46.AddToFavouriteUseCase>(),
        ));
    gh.factory<_i54.OrderRepository>(() => _i55.OrderRepositoryImpl(
          gh<_i29.OrderDataSource>(),
          gh<_i42.StripeService>(),
        ));
    gh.factory<_i56.ProfileViewModel>(
        () => _i56.ProfileViewModel(gh<_i44.UpdatePasswordUseCase>()));
    gh.factory<_i57.CategoryDetailsViewModel>(() =>
        _i57.CategoryDetailsViewModel(gh<_i49.GetRestaurantsByCategoryId>()));
    gh.factory<_i58.CreateCashOrderUseCase>(
        () => _i58.CreateCashOrderUseCase(gh<_i54.OrderRepository>()));
    gh.factory<_i59.CreateOnlineOrderUseCase>(
        () => _i59.CreateOnlineOrderUseCase(gh<_i54.OrderRepository>()));
    gh.factory<_i60.MakePaymentUseCase>(
        () => _i60.MakePaymentUseCase(gh<_i54.OrderRepository>()));
    gh.factory<_i61.CheckoutViewModel>(() => _i61.CheckoutViewModel(
          gh<_i59.CreateOnlineOrderUseCase>(),
          gh<_i58.CreateCashOrderUseCase>(),
          gh<_i60.MakePaymentUseCase>(),
        ));
    return this;
  }
}
