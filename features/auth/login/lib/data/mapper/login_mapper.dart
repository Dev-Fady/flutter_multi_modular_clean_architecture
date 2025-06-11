import 'package:login/domain/model/login_model.dart';

import '../response/login_response.dart';

extension loginResponseMapper on LoginResponse {
  LoginModel toDomain() {
    return LoginModel(
      name: name ?? 'nullName',
      phone: phone ?? 'NullPhone',
      age: age ?? 'NullAge',
    );
  }
}
