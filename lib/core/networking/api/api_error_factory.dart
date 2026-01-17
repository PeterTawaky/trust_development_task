import 'package:flutter/material.dart';
import 'api_error_model.dart';
import 'local_status_codes.dart';
import 'package:trust_development_task/locale_keys.dart';

class ApiErrorFactory {
  static ApiErrorModel get defaultError => ApiErrorModel(
    message: LocaleKeys.somethingWentWrong,
    icon: Icons.error,
    statusCode: LocalStatusCodes.defaultError,
  );
  static ApiErrorModel get badResponseWithoutCode => ApiErrorModel(
    //when the server doesn't send status code in the response
    message: LocaleKeys.somethingWentWrong,
    icon: Icons.error,
    statusCode: LocalStatusCodes.badResponse,
  );
  static ApiErrorModel get noInternetConnection => ApiErrorModel(
    message: LocaleKeys.serverConnectionError,
    icon: Icons.wifi_off,
    statusCode: LocalStatusCodes.connectionError,
  );
  static ApiErrorModel get connectionTimeout => ApiErrorModel(
    message: LocaleKeys.connectionTimeout,
    icon: Icons.timer_off,
    statusCode: LocalStatusCodes.connectionTimeout,
  );
  static ApiErrorModel get sendTimeout => ApiErrorModel(
    message: LocaleKeys.sendTimeout,
    icon: Icons.send,
    statusCode: LocalStatusCodes.sendTimeout,
  );
  static ApiErrorModel get receiveTimeout => ApiErrorModel(
    message: LocaleKeys.receiveTimeout,
    icon: Icons.downloading,
    statusCode: LocalStatusCodes.receiveTimeout,
  );
  static ApiErrorModel get badCertificate => ApiErrorModel(
    message: LocaleKeys.badCertificate,
    icon: Icons.security,
    statusCode: LocalStatusCodes.badCertificate,
  );
}
