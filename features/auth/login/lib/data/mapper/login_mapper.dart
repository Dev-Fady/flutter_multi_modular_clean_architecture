import 'package:extensions/constant/constant.dart';
import 'package:extensions/extensions.dart';
import 'package:login/domain/model/login_model.dart';

import '../response/login_response.dart';

extension LoginResponseMapper on LoginResponse? {
  LoginModel toDomain() {
    return LoginModel(
      name: this?.name.orEmpty() ?? Constant.empty,
      phone: this?.phone.orEmpty() ?? Constant.empty,
      age: this?.age.orEmpty() ?? Constant.empty,
    );
  }
}
