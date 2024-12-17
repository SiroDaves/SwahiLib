// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:droidconug/common/data/db/app_database.dart' as _i1040;
import 'package:droidconug/common/repository/auth_repository.dart' as _i938;
import 'package:droidconug/common/repository/db/database_repository.dart'
    as _i902;
import 'package:droidconug/common/repository/local_storage.dart' as _i1062;
import 'package:droidconug/core/di/injectable.dart' as _i137;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> initGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => registerModule.localStorage(),
      preResolve: true,
    );
    await gh.singletonAsync<_i1040.AppDatabase>(
      () => registerModule.provideAppDatabase(),
      preResolve: true,
    );
    gh.lazySingleton<_i938.AuthRepository>(() => _i938.AuthRepository());
    gh.lazySingleton<_i902.DatabaseRepository>(() =>
        registerModule.provideDatabaseRepository(gh<_i1040.AppDatabase>()));
    gh.singleton<_i1062.LocalStorage>(
        () => _i1062.LocalStorage(gh<_i460.SharedPreferences>()));
    return this;
  }
}

class _$RegisterModule extends _i137.RegisterModule {}
