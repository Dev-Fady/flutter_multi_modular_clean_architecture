abstract class SessionProvider {
  String getSessionId();

  String getUserId();

  String getClientId();
  String getAccessToken();
  String getRefreshToken();

  void setUserId(String userId);

  void setAccessToken(String accessToken);

  void setRefreshToken(String refreshToken);
}
