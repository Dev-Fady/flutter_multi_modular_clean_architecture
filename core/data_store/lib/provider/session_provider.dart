abstract class SessionProvider {
  String getSessionId();

  String getUserId();

  String getClientId();
  String getAccessToken();
  String getRefreshToken();
}
