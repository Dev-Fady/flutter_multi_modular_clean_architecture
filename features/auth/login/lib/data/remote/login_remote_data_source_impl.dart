import 'package:dartz/dartz.dart';
import 'package:data/network/safe_api_call.dart';
import 'package:domain/model/failure.dart';
import 'package:login/data/remote/login_remote_data_source.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/data/response/login_response.dart';
import 'package:login/data/service/login_service.dart';
// import 'package:retrofit/dio.dart';

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final LoginService loginService;
  LoginRemoteDataSourceImpl({required this.loginService});

  @override
  Future<Either<Failure, LoginResponse>> login(
      {required LoginRequest loginRequest}) {
    return safeApiCall(
      () async {
        final response =
            await loginService.login(loginRequest.email, loginRequest.password);
        return response.data;
      },
    );
  }
}
