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
import '../data/dataSourceContract/MenusDataSource.dart' as _i21;
import '../data/dataSourceContract/RestaurantsDataSource.dart' as _i32;
import '../data/dataSourceContract/auth_remote_data_source.dart' as _i4;
import '../data/dataSourceContract/cart_data_source.dart' as _i8;
import '../data/dataSourceContract/profile_data_source.dart' as _i25;
import '../data/dataSourceImpl/CategoriesOnlineDataSourceImpl.dart' as _i13;
import '../data/dataSourceImpl/MenusOnlineDataSourceImpl.dart' as _i22;
import '../data/dataSourceImpl/RestaurantsOnlineDataSourceImpl.dart' as _i33;
import '../data/dataSourceImpl/auth_remote_data_source_impl.dart' as _i5;
import '../data/dataSourceImpl/cart_data_source_impl.dart' as _i9;
import '../data/dataSourceImpl/profile_data_source_impl.dart' as _i26;
import '../data/repositoryImpl/CategoriesRepoImpl.dart' as _i15;
import '../data/repositoryImpl/MenusRepoImpl.dart' as _i24;
import '../data/repositoryImpl/RestaurantsRepoImpl.dart' as _i35;
import '../data/repositoryImpl/auth_repo_impl.dart' as _i7;
import '../data/repositoryImpl/cart_repository_impl.dart' as _i11;
import '../data/repositoryImpl/profile_repository_impl.dart' as _i28;
import '../domain/repositoryContract/CategoriesRepo.dart' as _i14;
import '../domain/repositoryContract/MenusRepo.dart' as _i23;
import '../domain/repositoryContract/RestaurantsRepo.dart' as _i34;
import '../domain/repositoryContract/auth_repository.dart' as _i6;
import '../domain/repositoryContract/cart_repository.dart' as _i10;
import '../domain/repositoryContract/profile_repository.dart' as _i27;
import '../domain/usecase/GetCategoriesUsecase.dart' as _i18;
import '../domain/usecase/GetMenusUsecase.dart' as _i40;
import '../domain/usecase/GetRestaurantsByCategoryId.dart' as _i41;
import '../domain/usecase/GetRestaurantsUsecase.dart' as _i42;
import '../domain/usecase/add_to_cart_use_case.dart' as _i38;
import '../domain/usecase/delete_cart_use_case.dart' as _i16;
import '../domain/usecase/get_cart_use_case.dart' as _i17;
import '../domain/usecase/login_use_case.dart' as _i19;
import '../domain/usecase/register_use_case.dart' as _i29;
import '../domain/usecase/remove_item_from_cart_use_case.dart' as _i31;
import '../domain/usecase/update_count_in_cart_use_case.dart' as _i36;
import '../domain/usecase/update_password_use_case.dart' as _i37;
import '../ui/auth/login/cubit/login_view_model.dart' as _i20;
import '../ui/auth/register/cubit/register_view_model.dart' as _i30;
import '../ui/cart/cubit/cart_screen_view_model.dart' as _i39;
import '../ui/category_details/category_details_view_model.dart' as _i47;
import '../ui/home/home_tab/cubit/home_tab_view_model.dart' as _i43;
import '../ui/home/profile_tab/cubit/profile_view_model.dart' as _i46;
import '../ui/meal_details/cubit/meal_details_view_model.dart' as _i44;
import '../ui/menu/menu_view_model.dart' as _i45;

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
    gh.factory<_i17.GetCartUseCase>(
        () => _i17.GetCartUseCase(gh<_i10.CartRepository>()));
    gh.factory<_i18.GetCategoriesUsecase>(
        () => _i18.GetCategoriesUsecase(gh<_i14.CategoriesRepo>()));
    gh.factory<_i19.LoginUseCase>(
        () => _i19.LoginUseCase(gh<_i6.AuthRepository>()));
    gh.factory<_i20.LoginViewModel>(
        () => _i20.LoginViewModel(gh<_i19.LoginUseCase>()));
    gh.factory<_i21.MenusDataSource>(
        () => _i22.MenusOnlineDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i23.MenusRepo>(
        () => _i24.MenusRepoImpl(gh<_i21.MenusDataSource>()));
    gh.factory<_i25.ProfileDataSource>(
        () => _i26.ProfileDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i27.ProfileRepository>(() => _i28.ProfileRepositoryImpl(
        profileDataSource: gh<_i25.ProfileDataSource>()));
    gh.factory<_i29.RegisterUseCase>(
        () => _i29.RegisterUseCase(gh<_i6.AuthRepository>()));
    gh.factory<_i30.RegisterViewModel>(
        () => _i30.RegisterViewModel(gh<_i29.RegisterUseCase>()));
    gh.factory<_i31.RemoveItemFromCartUseCase>(
        () => _i31.RemoveItemFromCartUseCase(gh<_i10.CartRepository>()));
    gh.factory<_i32.RestaurantsDataSource>(
        () => _i33.RestaurantsOnlineDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i34.RestaurantsRepo>(
        () => _i35.RestaurantsRepoImpl(gh<_i32.RestaurantsDataSource>()));
    gh.factory<_i36.UpdateCountInCartUseCase>(
        () => _i36.UpdateCountInCartUseCase(gh<_i10.CartRepository>()));
    gh.factory<_i37.UpdatePasswordUseCase>(
        () => _i37.UpdatePasswordUseCase(gh<_i27.ProfileRepository>()));
    gh.factory<_i38.AddToCartUseCase>(
        () => _i38.AddToCartUseCase(gh<_i10.CartRepository>()));
    gh.factory<_i39.CartScreenViewModel>(() => _i39.CartScreenViewModel(
          gh<_i17.GetCartUseCase>(),
          gh<_i31.RemoveItemFromCartUseCase>(),
          gh<_i36.UpdateCountInCartUseCase>(),
          gh<_i16.DeleteCartUseCase>(),
        ));
    gh.factory<_i40.GetMenusUsecase>(
        () => _i40.GetMenusUsecase(gh<_i23.MenusRepo>()));
    gh.factory<_i41.GetRestaurantsByCategoryId>(
        () => _i41.GetRestaurantsByCategoryId(gh<_i34.RestaurantsRepo>()));
    gh.factory<_i42.GetRestaurantsUsecase>(
        () => _i42.GetRestaurantsUsecase(gh<_i34.RestaurantsRepo>()));
    gh.factory<_i43.HomeTabViewModel>(() => _i43.HomeTabViewModel(
          gh<_i42.GetRestaurantsUsecase>(),
          gh<_i18.GetCategoriesUsecase>(),
        ));
    gh.factory<_i44.MealDetailsViewModel>(
        () => _i44.MealDetailsViewModel(gh<_i38.AddToCartUseCase>()));
    gh.factory<_i45.MenuViewModel>(
        () => _i45.MenuViewModel(gh<_i40.GetMenusUsecase>()));
    gh.factory<_i46.ProfileViewModel>(
        () => _i46.ProfileViewModel(gh<_i37.UpdatePasswordUseCase>()));
    gh.factory<_i47.CategoryDetailsViewModel>(() =>
        _i47.CategoryDetailsViewModel(gh<_i41.GetRestaurantsByCategoryId>()));
    return this;
  }
}
