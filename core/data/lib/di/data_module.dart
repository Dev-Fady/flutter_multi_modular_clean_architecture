import 'package:data/di/data_module_keys.dart';
import 'package:data/factory/dio_factory.dart';
import 'package:data/network_info/network_info.dart';
import 'package:data/network_info/network_info_impl.dart';
import 'package:data_store/provider/preferences_provider.dart';
import 'package:data_store/provider/session_provider.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataModule {
  @lazySingleton
  NetworkInfo provideNetworkInfo() => NetworkInfoImpl();

  // provide base url
  @Named(DataModuleKeys.baseUrl) // a tag for this string
  String provideBaseUrl(PreferencesProvider preferencesProvider) =>
      preferencesProvider.getBaseUrl();

  @Named(DataModuleKeys.accessToken) // a tag for this string
  String provideAccessToken(SessionProvider sessionProvider) =>
      sessionProvider.getAccessToken();

  @Named(DataModuleKeys.language) // a tag for this string
  String provideLanguage(PreferencesProvider preferencesProvider) =>
      preferencesProvider.getAppLanguage();

  @lazySingleton
  Dio dio(
      @Named(DataModuleKeys.baseUrl) String baseUrl,
      @Named(DataModuleKeys.accessToken) String accessToken,
      @Named(DataModuleKeys.language) String language) {
    final dioFactory = DioFactory(
        baseUrl: baseUrl, accessToken: accessToken, language: language);

    return dioFactory.getDio();
  }
}
