// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api_service/api_Service.dart' as _i878;
import '../../data/data_source/articles_api_datasource.dart' as _i1064;
import '../../data/data_source/articles_datasource.dart' as _i172;
import '../../data/data_source/sources_api_datasource.dart' as _i44;
import '../../data/data_source/sources_datasource.dart' as _i1009;
import '../../data/repository/articles_repository.dart' as _i25;
import '../../data/repository/articles_repository_impl.dart' as _i914;
import '../../data/repository/sources_repository.dart' as _i773;
import '../../data/repository/sources_repository_impl.dart' as _i340;
import '../../feathers/main_layout/sources/article_viewModel.dart' as _i367;
import '../../feathers/main_layout/sources/search_viewModel.dart' as _i1046;
import '../../feathers/main_layout/sources/sources_viewModel.dart' as _i583;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i878.APIService>(() => _i878.APIService());
    gh.singleton<_i172.ArticlesDataSource>(
      () => _i1064.ArticlesApiDataSource(apiService: gh<_i878.APIService>()),
    );
    gh.singleton<_i1009.SourcesDataSource>(
      () => _i44.SourcesApiDataSource(gh<_i878.APIService>()),
    );
    gh.singleton<_i25.ArticlesRepository>(
      () => _i914.ArticlesRepositoryImpl(
        dataSource: gh<_i172.ArticlesDataSource>(),
      ),
    );
    gh.singleton<_i773.SourcesRepository>(
      () => _i340.SourcesRepositoryImpl(
        dataSource: gh<_i1009.SourcesDataSource>(),
      ),
    );
    gh.singleton<_i367.ArticlesViewModel>(
      () => _i367.ArticlesViewModel(repository: gh<_i25.ArticlesRepository>()),
    );
    gh.singleton<_i1046.SearchViewModel>(
      () => _i1046.SearchViewModel(repository: gh<_i25.ArticlesRepository>()),
    );
    gh.singleton<_i583.SourcesViewModel>(
      () => _i583.SourcesViewModel(repository: gh<_i773.SourcesRepository>()),
    );
    return this;
  }
}
