import 'package:assignment/core/network/dio_client.dart';
import 'package:assignment/data/datasources/local/auth_datasource.dart';
import 'package:assignment/data/datasources/local/theme_datasource.dart';
import 'package:assignment/data/datasources/remote/crypto_remote_datasource.dart';

import 'package:assignment/data/repository_impl/auth_repo_impl.dart';
import 'package:assignment/data/repository_impl/crypto_repository_impl.dart';
import 'package:assignment/data/repository_impl/theme_repository_impl.dart';
import 'package:assignment/domain/repository/auth_repository.dart';
import 'package:assignment/domain/repository/crypto_repository.dart';
import 'package:assignment/domain/repository/theme_repository.dart';
import 'package:assignment/domain/usecases/auth_usecase.dart';
import 'package:assignment/domain/usecases/get_market_list_usecase.dart';
import 'package:assignment/domain/usecases/theme_usecase.dart';
import 'package:assignment/presentation/auth/bloc/sign_up_bloc/signup_bloc.dart';
import 'package:assignment/presentation/auth/bloc/signin_bloc/signin_bloc.dart';
import 'package:assignment/presentation/discover/bloc/discover_bloc.dart';
import 'package:assignment/presentation/theme/bloc/theme_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

GetIt di = GetIt.instance;

Future<void> initDependencies() async {
  di.registerLazySingleton<Box>(() => Hive.box('usersBox'));

  di.registerLazySingleton<AuthDataSource>(() => AuthDataSource(di<Box>()));

  di.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(di<AuthDataSource>()),
  );

  di.registerLazySingleton<AuthUsecase>(
    () => AuthUsecase(repository: di<AuthRepository>()),
  );

  di.registerFactory<SigninBloc>(() => SigninBloc(di<AuthUsecase>()));
  di.registerFactory<SignupBloc>(() => SignupBloc(di<AuthUsecase>()));

  di.registerLazySingleton<DioClient>(
    () => DioClient(apiKey: "YOUR_REAL_API_KEY_HERE"),
  );

  di.registerLazySingleton<CryptoRemoteDataSourceImpl>(
    () => CryptoRemoteDataSourceImpl(di<DioClient>()),
  );

  di.registerLazySingleton<CryptoRepository>(
    () => CryptoRepositoryImpl(di<CryptoRemoteDataSourceImpl>()),
  );

  di.registerLazySingleton<GetMarketListUseCase>(
    () => GetMarketListUseCase(di<CryptoRepository>()),
  );

  di.registerFactory<DiscoverBloc>(
    () => DiscoverBloc(di<GetMarketListUseCase>()),
  );

  di.registerLazySingleton<ThemeDataSource>(() => ThemeDataSource(di<Box>()));

  di.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(di<ThemeDataSource>()),
  );

  di.registerLazySingleton(() => ThemeUsecase(di<ThemeRepository>()));

  di.registerFactory(() => ThemeBloc(di<ThemeUsecase>()));
}
