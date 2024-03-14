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
import '../data/dataSourceContract/CategoriesDataSource.dart' as _i4;
import '../data/dataSourceContract/MenusDataSource.dart' as _i9;
import '../data/dataSourceContract/RestaurantsDataSource.dart' as _i13;
import '../data/dataSourceImpl/CategoriesOnlineDataSourceImpl.dart' as _i5;
import '../data/dataSourceImpl/MenusOnlineDataSourceImpl.dart' as _i10;
import '../data/dataSourceImpl/RestaurantsOnlineDataSourceImpl.dart' as _i14;
import '../data/repositoryImpl/CategoriesRepoImpl.dart' as _i7;
import '../data/repositoryImpl/MenusRepoImpl.dart' as _i12;
import '../data/repositoryImpl/RestaurantsRepoImpl.dart' as _i16;
import '../domain/repositoryContract/CategoriesRepo.dart' as _i6;
import '../domain/repositoryContract/MenusRepo.dart' as _i11;
import '../domain/repositoryContract/RestaurantsRepo.dart' as _i15;
import '../domain/usecase/GetCategoriesUsecase.dart' as _i8;
import '../domain/usecase/GetMenusUsecase.dart' as _i17;
import '../domain/usecase/GetRestaurantsByCategoryId.dart' as _i18;
import '../domain/usecase/GetRestaurantsUsecase.dart' as _i19;
import '../ui/category_details/category_details_view_model.dart' as _i22;
import '../ui/home/home_tab_view_model.dart' as _i20;
import '../ui/menu/menu_view_model.dart' as _i21;

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
    gh.factory<_i4.CategoriesDataSource>(
        () => _i5.CategoriesOnlineDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.CategoriesRepo>(
        () => _i7.CategoriesRepoImpl(gh<_i4.CategoriesDataSource>()));
    gh.factory<_i8.GetCategoriesUsecase>(
        () => _i8.GetCategoriesUsecase(gh<_i6.CategoriesRepo>()));
    gh.factory<_i9.MenusDataSource>(
        () => _i10.MenusOnlineDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i11.MenusRepo>(
        () => _i12.MenusRepoImpl(gh<_i9.MenusDataSource>()));
    gh.factory<_i13.RestaurantsDataSource>(
        () => _i14.RestaurantsOnlineDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i15.RestaurantsRepo>(
        () => _i16.RestaurantsRepoImpl(gh<_i13.RestaurantsDataSource>()));
    gh.factory<_i17.GetMenusUsecase>(
        () => _i17.GetMenusUsecase(gh<_i11.MenusRepo>()));
    gh.factory<_i18.GetRestaurantsByCategoryId>(
        () => _i18.GetRestaurantsByCategoryId(gh<_i15.RestaurantsRepo>()));
    gh.factory<_i19.GetRestaurantsUsecase>(
        () => _i19.GetRestaurantsUsecase(gh<_i15.RestaurantsRepo>()));
    gh.factory<_i20.HomeTabViewModel>(() => _i20.HomeTabViewModel(
          gh<_i19.GetRestaurantsUsecase>(),
          gh<_i8.GetCategoriesUsecase>(),
        ));
    gh.factory<_i21.MenuViewModel>(
        () => _i21.MenuViewModel(gh<_i17.GetMenusUsecase>()));
    gh.factory<_i22.CategoryDetailsViewModel>(() =>
        _i22.CategoryDetailsViewModel(gh<_i18.GetRestaurantsByCategoryId>()));
    return this;
  }
}
