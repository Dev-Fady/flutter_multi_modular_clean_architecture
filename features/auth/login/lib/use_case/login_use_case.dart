import 'package:dartz/dartz.dart';
import 'package:domain/model/failure.dart';
import 'package:domain/use_case/base_use_case.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/domain/model/login_model.dart';
import 'package:login/domain/repository/login_repository.dart';

class LoginUseCase implements BaseUseCase<LoginRequest, LoginModel> {
  final LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});

  @override
  Future<Either<Failure, LoginModel>> execute(LoginRequest input) async {
    return await loginRepository.login(loginRequest: input);
  }
}
