import 'package:data_store/provider/session_provider.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SessionProvider, env: [Environment.prod])
class ProdSessionImplProvider extends SessionProvider {
  @override
  String getAccessToken() {
    return 'access_token_prod';
  }

  @override
  String getClientId() {
    return 'client_id_prod';
  }

  @override
  String getRefreshToken() {
    return 'refresh_token_prod';
  }

  @override
  String getSessionId() {
    return 'session_id_prod';
  }

  @override
  String getUserId() {
    return 'user_id_prod';
  }
}

@Injectable(as: SessionProvider, env: [Environment.dev])
class DevSessionImplProvider extends SessionProvider {
  @override
  String getAccessToken() {
    return 'access_token_dev';
  }

  @override
  String getClientId() {
    return 'client_id_dev';
  }

  @override
  String getRefreshToken() {
    return 'refresh_token_dev';
  }

  @override
  String getSessionId() {
    return 'session_id_dev';
  }

  @override
  String getUserId() {
    return 'user_id_dev';
  }
}
