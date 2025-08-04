import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:medicare_pharmacy/core/services/shared_preferences_service.dart';
import 'package:medicare_pharmacy/data/remote_data_source.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import '../core/base_dio/base_dio.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  _initDio();
  await _initSharedPreferencesService();
  _initBaseDio();
  _initRemoteDataSource();
  _initRepository();
}

void _initDio() {
  getIt.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: "",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          "charset": "utf-8",
          "Accept-Charset": "utf-8",
        },
        responseType: ResponseType.plain,
        connectTimeout: const Duration(seconds: 7),
      ),
    ),
  );
}

Future<void> _initSharedPreferencesService() async {
  final sharedPrefsService = SharedPreferencesService();
  await sharedPrefsService.init();
  getIt.registerSingleton(sharedPrefsService);
}

void _initBaseDio() {
  getIt.registerLazySingleton(
    () => BaseDio(
      dioProject: getIt<Dio>(),
      sharedPreferencesService: getIt<SharedPreferencesService>(),
    ),
  );
}

void _initRemoteDataSource() {
  getIt.registerLazySingleton(
    () => RemoteDataSource(baseDio: getIt<BaseDio>()),
  );
}

void _initRepository() {
  getIt.registerLazySingleton(
    () => Repository(remoteDataSource: getIt<RemoteDataSource>()),
  );
}
