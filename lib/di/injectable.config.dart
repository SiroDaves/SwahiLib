// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:drift/drift.dart' as _i7;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../db/dao/history_dao.dart' as _i13;
import '../db/dao/idiom_dao.dart' as _i14;
import '../db/dao/proverb_dao.dart' as _i15;
import '../db/dao/saying_dao.dart' as _i16;
import '../db/dao/search_dao.dart' as _i17;
import '../db/dao/word_dao.dart' as _i12;
import '../db/swahilib_db.dart' as _i11;
import '../repo/db_repository.dart' as _i19;
import '../repo/storage/auth_storage.dart' as _i18;
import '../repo/storage/local_storage.dart' as _i20;
import '../repo/storage/secure_storage.dart' as _i9;
import '../util/cache/cache_controller.dart' as _i5;
import '../util/cache/cache_controlling.dart' as _i4;
import '../vm/global_vm.dart' as _i27;
import '../vm/home/home_vm.dart' as _i28;
import '../vm/info/info_vm.dart' as _i30;
import '../vm/init/data_init_vm.dart' as _i26;
import '../vm/init/splash_vm.dart' as _i24;
import '../vm/manage/settings_vm.dart' as _i23;
import '../vm/viewer/idiom_vm.dart' as _i29;
import '../vm/viewer/proverb_vm.dart' as _i21;
import '../vm/viewer/saying_vm.dart' as _i22;
import '../vm/viewer/word_vm.dart' as _i25;
import '../webservice/app_web_service.dart' as _i3;
import 'injectable.dart' as _i31; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AppWebService>(() => _i3.AppWebService());
  gh.singleton<_i4.CacheControlling>(_i5.CacheController());
  gh.singleton<_i6.ConnectivityHelper>(registerModule.connectivityHelper());
  await gh.singletonAsync<_i7.DatabaseConnection>(
    () => registerModule.provideDatabaseConnection(),
    preResolve: true,
  );
  gh.lazySingleton<_i8.FlutterSecureStorage>(() => registerModule.storage());
  gh.lazySingleton<_i9.SecureStorage>(
      () => _i9.SecureStorage(get<_i8.FlutterSecureStorage>()));
  await gh.singletonAsync<_i10.SharedPreferences>(
    () => registerModule.prefs(),
    preResolve: true,
  );
  gh.lazySingleton<_i11.SwahiliDB>(
      () => registerModule.provideSwahiliDB(get<_i7.DatabaseConnection>()));
  gh.lazySingleton<_i12.WordDao>(() => _i12.WordDao(get<_i11.SwahiliDB>()));
  gh.lazySingleton<_i13.HistoryDao>(
      () => _i13.HistoryDao(get<_i11.SwahiliDB>()));
  gh.lazySingleton<_i14.IdiomDao>(() => _i14.IdiomDao(get<_i11.SwahiliDB>()));
  gh.lazySingleton<_i15.ProverbDao>(
      () => _i15.ProverbDao(get<_i11.SwahiliDB>()));
  gh.lazySingleton<_i16.SayingDao>(() => _i16.SayingDao(get<_i11.SwahiliDB>()));
  gh.lazySingleton<_i17.SearchDao>(() => _i17.SearchDao(get<_i11.SwahiliDB>()));
  gh.lazySingleton<_i6.SharedPreferenceStorage>(
      () => registerModule.sharedPreferences(get<_i10.SharedPreferences>()));
  gh.lazySingleton<_i6.SimpleKeyValueStorage>(
      () => registerModule.keyValueStorage(
            get<_i6.SharedPreferenceStorage>(),
            get<_i9.SecureStorage>(),
          ));
  gh.lazySingleton<_i18.AuthStorage>(
      () => _i18.AuthStorage(get<_i6.SimpleKeyValueStorage>()));
  gh.lazySingleton<_i19.DbRepository>(() => _i19.DbRepository(
        get<_i13.HistoryDao>(),
        get<_i14.IdiomDao>(),
        get<_i15.ProverbDao>(),
        get<_i16.SayingDao>(),
        get<_i17.SearchDao>(),
        get<_i12.WordDao>(),
      ));
  gh.lazySingleton<_i20.LocalStorage>(() => _i20.LocalStorage(
        get<_i18.AuthStorage>(),
        get<_i6.SharedPreferenceStorage>(),
      ));
  gh.factory<_i21.ProverbVm>(() => _i21.ProverbVm(
        get<_i19.DbRepository>(),
        get<_i20.LocalStorage>(),
      ));
  gh.factory<_i22.SayingVm>(() => _i22.SayingVm(
        get<_i19.DbRepository>(),
        get<_i20.LocalStorage>(),
      ));
  gh.factory<_i23.SettingsVm>(() => _i23.SettingsVm(
        get<_i19.DbRepository>(),
        get<_i20.LocalStorage>(),
      ));
  gh.factory<_i24.SplashVm>(() => _i24.SplashVm(get<_i20.LocalStorage>()));
  gh.factory<_i25.WordVm>(() => _i25.WordVm(
        get<_i19.DbRepository>(),
        get<_i20.LocalStorage>(),
      ));
  gh.factory<_i26.DataInitVm>(() => _i26.DataInitVm(
        get<_i3.AppWebService>(),
        get<_i19.DbRepository>(),
        get<_i20.LocalStorage>(),
      ));
  gh.singleton<_i27.GlobalVm>(_i27.GlobalVm(get<_i20.LocalStorage>()));
  gh.singleton<_i28.HomeVm>(_i28.HomeVm(
    get<_i19.DbRepository>(),
    get<_i20.LocalStorage>(),
  ));
  gh.factory<_i29.IdiomVm>(() => _i29.IdiomVm(
        get<_i19.DbRepository>(),
        get<_i20.LocalStorage>(),
      ));
  gh.factory<_i30.InfoVm>(() => _i30.InfoVm(get<_i20.LocalStorage>()));
  return get;
}

class _$RegisterModule extends _i31.RegisterModule {}
