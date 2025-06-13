// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_store/provider/session_provider.dart';
import 'package:data_store/provider/session_strings.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

@Injectable(as: SessionProvider, env: [Environment.prod])
class ProdSessionImplProvider extends SessionProvider {
  final SharedPreferences _sharedPreferences;
  ProdSessionImplProvider(this._sharedPreferences);

  @override
  String getAccessToken() {
    return _sharedPreferences.getString(SessionStrings.accessTokenKey) ?? "";
  }

  @override
  void setAccessToken(String accessToken) {
    _sharedPreferences.setString(SessionStrings.accessTokenKey, accessToken);
  }

  @override
  String getClientId() {
    return Uuid().v4();
  }

  @override
  String getRefreshToken() {
    return _sharedPreferences.getString(SessionStrings.accessTokenKey) ?? "";
  }

  @override
  void setRefreshToken(String refreshToken) {
    _sharedPreferences.setString(SessionStrings.refreshTokenKey, refreshToken);
  }

  @override
  String getSessionId() {
    return 'session_id_prod';
  }

  @override
  String getUserId() {
    return _sharedPreferences.getString(SessionStrings.userIdKey) ?? "";
  }

  @override
  void setUserId(String userId) {
    _sharedPreferences.setString(SessionStrings.userIdKey, userId);
  }
}

@Injectable(as: SessionProvider, env: [Environment.dev])
class DevSessionImplProvider extends SessionProvider {
  final SharedPreferences _sharedPreferences;

  DevSessionImplProvider(this._sharedPreferences);

  @override
  String getAccessToken() {
    return _sharedPreferences.getString(SessionStrings.accessTokenKey) ?? "";
  }

  @override
  void setAccessToken(String accessToken) {
    _sharedPreferences.setString(SessionStrings.accessTokenKey, accessToken);
  }

  @override
  String getClientId() {
    return Uuid().v4();
  }

  @override
  String getRefreshToken() {
    return _sharedPreferences.getString(SessionStrings.accessTokenKey) ?? "";
  }

  @override
  void setRefreshToken(String refreshToken) {
    _sharedPreferences.setString(SessionStrings.refreshTokenKey, refreshToken);
  }

  @override
  String getUserId() {
    return _sharedPreferences.getString(SessionStrings.userIdKey) ?? "";
  }

  @override
  void setUserId(String userId) {
    _sharedPreferences.setString(SessionStrings.userIdKey, userId);
  }

  @override
  String getSessionId() {
    return 'session_id_dev';
  }
}
