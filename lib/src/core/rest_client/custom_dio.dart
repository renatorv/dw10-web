import '../storage/storage.dart';
import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

import '../env/env.dart';
import 'interceptors/auth_interceptors.dart';

class CustomDio extends DioForBrowser {
  late AuthInterceptors _authInterceptor;
  CustomDio(Storage storage)
      : super(
          BaseOptions(
            baseUrl: Env.instance.get('backend_base_url'),
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
    _authInterceptor = AuthInterceptors(storage);
  }
  CustomDio auth() {
    if (!interceptors.contains(_authInterceptor)) {
      interceptors.add(_authInterceptor);
    }

    return this;
  }

  CustomDio umauth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}
