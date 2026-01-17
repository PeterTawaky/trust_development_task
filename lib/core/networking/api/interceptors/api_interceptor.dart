import 'dart:convert';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    const String username = 'testapp';
    const String password = '5S0Q YjyH 4s3G elpe 5F8v u8as';

    final String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';

    options.headers.addAll({'Authorization': basicAuth});

    super.onRequest(options, handler);
  }
}
