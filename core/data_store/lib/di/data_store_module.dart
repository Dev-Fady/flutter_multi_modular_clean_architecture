import 'package:data_store/provider/preferences_provider.dart';
import 'package:data_store/provider/preferences_provider_impl.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DataStoreModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  PreferencesProvider providePreferencesProviderImpl(SharedPreferences prefs) =>
      PreferencesProviderImpl(prefs);
}
