import 'package:app_settings/provider/app_settings_provider.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AppSettingsProvider, env: [Environment.prod])
class ProdAppSettingsProviderImpl extends AppSettingsProvider {
  @override
  String getAppLanguage() {
    return 'en';
  }

  @override
  String getThemeType() {
    return 'light';
  }
}

@Injectable(as: AppSettingsProvider, env: [Environment.dev])
class DevAppSettingsProviderImpl extends AppSettingsProvider {
  @override
  String getAppLanguage() {
    return 'ar';
  }

  @override
  String getThemeType() {
    return 'dark';
  }
}
