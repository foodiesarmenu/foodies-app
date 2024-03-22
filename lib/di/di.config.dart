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
import '../data/dataSourceContract/CategoriesDataSource.dart' as _i8;
import '../data/dataSourceContract/MenusDataSource.dart' as _i15;
import '../data/dataSourceContract/RestaurantsDataSource.dart' as _i21;
import '../data/dataSourceImpl/auth_remote_data_source_impl.dart' as _i5;
import '../data/dataSourceImpl/CategoriesOnlineDataSourceImpl.dart' as _i9;
import '../data/dataSourceImpl/MenusOnlineDataSourceImpl.dart' as _i16;
import '../data/dataSourceImpl/RestaurantsOnlineDataSourceImpl.dart' as _i22;
import '../data/repositoryImpl/auth_repo_impl.dart' as _i7;
import '../data/repositoryImpl/CategoriesRepoImpl.dart' as _i11;
import '../data/repositoryImpl/MenusRepoImpl.dart' as _i18;
import '../data/repositoryImpl/RestaurantsRepoImpl.dart' as _i24;
import '../domain/repositoryContract/auth_repository.dart' as _i6;
import '../domain/repositoryContract/CategoriesRepo.dart' as _i10;
import '../domain/repositoryContract/MenusRepo.dart' as _i17;
import '../domain/repositoryContract/RestaurantsRepo.dart' as _i23;
import '../domain/usecase/GetCategoriesUsecase.dart' as _i12;
import '../domain/usecase/GetMenusUsecase.dart' as _i25;
import '../domain/usecase/GetRestaurantsByCategoryId.dart' as _i26;
import '../domain/usecase/GetRestaurantsUsecase.dart' as _i27;
import '../domain/usecase/login_use_case.dart' as _i13;
import '../domain/usecase/register_use_case.dart' as _i19;
import '../ui/auth/login/cubit/login_view_model.dart' as _i14;
import '../ui/auth/register/cubit/register_view_model.dart' as _i20;
import '../ui/category_details/category_details_view_model.dart' as _i30;
import '../ui/home/home_tab_view_model.dart' as _i28;
import '../ui/menu/menu_view_model.dart' as _i29;

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
    gh.factory<_i8.CategoriesDataSource>(
        () => _i9.CategoriesOnlineDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.CategoriesRepo>(
        () => _i11.CategoriesRepoImpl(gh<_i8.CategoriesDataSource>()));
    gh.factory<_i12.GetCategoriesUsecase>(
        () => _i12.GetCategoriesUsecase(gh<_i10.CategoriesRepo>()));
    gh.factory<_i13.LoginUseCase>(
        () => _i13.LoginUseCase(gh<_i6.AuthRepository>()));
    gh.factory<_i14.LoginViewModel>(
        () => _i14.LoginViewModel(gh<_i13.LoginUseCase>()));
    gh.factory<_i15.MenusDataSource>(
        () => _i16.MenusOnlineDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i17.MenusRepo>(
        () => _i18.MenusRepoImpl(gh<_i15.MenusDataSource>()));
    gh.factory<_i19.RegisterUseCase>(
        () => _i19.RegisterUseCase(gh<_i6.AuthRepository>()));
    gh.factory<_i20.RegisterViewModel>(
        () => _i20.RegisterViewModel(gh<_i19.RegisterUseCase>()));
    gh.factory<_i21.RestaurantsDataSource>(
        () => _i22.RestaurantsOnlineDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i23.RestaurantsRepo>(
        () => _i24.RestaurantsRepoImpl(gh<_i21.RestaurantsDataSource>()));
    gh.factory<_i25.GetMenusUsecase>(
        () => _i25.GetMenusUsecase(gh<_i17.MenusRepo>()));
    gh.factory<_i26.GetRestaurantsByCategoryId>(
        () => _i26.GetRestaurantsByCategoryId(gh<_i23.RestaurantsRepo>()));
    gh.factory<_i27.GetRestaurantsUsecase>(
        () => _i27.GetRestaurantsUsecase(gh<_i23.RestaurantsRepo>()));
    gh.factory<_i28.HomeTabViewModel>(() => _i28.HomeTabViewModel(
          gh<_i27.GetRestaurantsUsecase>(),
          gh<_i12.GetCategoriesUsecase>(),
        ));
    gh.factory<_i29.MenuViewModel>(
        () => _i29.MenuViewModel(gh<_i25.GetMenusUsecase>()));
    gh.factory<_i30.CategoryDetailsViewModel>(() =>
        _i30.CategoryDetailsViewModel(gh<_i26.GetRestaurantsByCategoryId>()));
    return this;
  }
}
