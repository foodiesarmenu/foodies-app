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
import '../data/dataSourceContract/RestaurantsDataSource.dart' as _i9;
import '../data/dataSourceImpl/CategoriesOnlineDataSourceImpl.dart' as _i5;
import '../data/dataSourceImpl/RestaurantsOnlineDataSourceImpl.dart' as _i10;
import '../data/repositoryImpl/CategoriesRepoImpl.dart' as _i7;
import '../data/repositoryImpl/RestaurantsRepoImpl.dart' as _i12;
import '../domain/repositoryContract/CategoriesRepo.dart' as _i6;
import '../domain/repositoryContract/RestaurantsRepo.dart' as _i11;
import '../domain/usecase/GetCategoriesUsecase.dart' as _i8;
import '../domain/usecase/GetRestaurantsUsecase.dart' as _i13;
import '../ui/home_tab/home_tab_view_model.dart' as _i14;

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
    gh.factory<_i9.RestaurantsDataSource>(
        () => _i10.RestaurantsOnlineDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i11.RestaurantsRepo>(
        () => _i12.RestaurantsRepoImpl(gh<_i9.RestaurantsDataSource>()));
    gh.factory<_i13.GetRestaurantsUsecase>(
        () => _i13.GetRestaurantsUsecase(gh<_i11.RestaurantsRepo>()));
    gh.factory<_i14.HomeTabViewModel>(() => _i14.HomeTabViewModel(
          gh<_i13.GetRestaurantsUsecase>(),
          gh<_i8.GetCategoriesUsecase>(),
        ));
    return this;
  }
}
