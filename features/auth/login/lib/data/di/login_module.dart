import 'package:data/network_info/network_info.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:login/data/remote/login_remote_data_source.dart';
import 'package:login/data/remote/login_remote_data_source_impl.dart';
import 'package:login/data/repository/login_repo_impl.dart';
import 'package:login/data/service/login_service.dart';
import 'package:login/use_case/login_use_case.dart';
import '../../domain/repository/login_repository.dart';

@module
abstract class LoginModule {
  @lazySingleton
  LoginService provideLoginService(Dio dio) {
    return LoginService(dio);
  }

  @lazySingleton
  LoginRemoteDataSource provideLoginRemoteDataSource(
      LoginService loginService, NetworkInfo networkInfo) {
    return LoginRemoteDataSourceImpl(
        loginService: loginService, networkInfo: networkInfo);
  }

  @lazySingleton
  LoginRepository provideLoginRepository(
      LoginRemoteDataSource loginRemoteDataSource) {
    return LoginRepoImpl(loginRemoteDataSourcel: loginRemoteDataSource);
  }

  @lazySingleton
  LoginUseCase provideLoginUseCase(LoginRepository loginRepository) {
    return LoginUseCase(loginRepository: loginRepository);
  }
}
