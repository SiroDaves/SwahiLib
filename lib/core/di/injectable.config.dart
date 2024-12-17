// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:swahilib/common/data/db/app_database.dart' as _i853;
import 'package:swahilib/common/repository/auth_repository.dart' as _i1013;
import 'package:swahilib/common/repository/db/database_repository.dart'
    as _i510;
import 'package:swahilib/common/repository/local_storage.dart' as _i703;
import 'package:swahilib/core/di/injectable.dart' as _i18;

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
    await gh.singletonAsync<_i853.AppDatabase>(
      () => registerModule.provideAppDatabase(),
      preResolve: true,
    );
    gh.lazySingleton<_i1013.AuthRepository>(() => _i1013.AuthRepository());
    gh.lazySingleton<_i510.DatabaseRepository>(() =>
        registerModule.provideDatabaseRepository(gh<_i853.AppDatabase>()));
    gh.singleton<_i703.LocalStorage>(
        () => _i703.LocalStorage(gh<_i460.SharedPreferences>()));
    return this;
  }
}

class _$RegisterModule extends _i18.RegisterModule {}
