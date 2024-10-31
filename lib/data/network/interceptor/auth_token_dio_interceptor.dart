import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String kAccessTokenKey = 'acessToken';

class AuthTokenDioInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  AuthTokenDioInterceptor({required this.storage});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    log('[Dio REQ] [${options.method}] ${options.uri}');

    if (options.headers['authorization'] == 'true') {
      // 헤더 삭제
      options.headers.remove('authorization');

      // 실제 토큰 대체
      // final token = await storage.read(key: ACCESS_TOKEN_KEY);
      options.headers.addAll({'authorization': 'Bearer tester1'});
    }

    super.onRequest(options, handler);
  }
}
