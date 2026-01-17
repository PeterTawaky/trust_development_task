import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api_error_factory.dart';
import 'api_error_model.dart';
import 'local_status_codes.dart';
import 'package:trust_development_task/locale_keys.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic e) {
    switch (e) {
      case DioException(:final DioExceptionType type):
        return switch (type) {
          DioExceptionType.connectionError =>
            ApiErrorFactory.noInternetConnection,
          DioExceptionType.connectionTimeout =>
            ApiErrorFactory.connectionTimeout,
          DioExceptionType.sendTimeout => ApiErrorFactory.sendTimeout,
          DioExceptionType.receiveTimeout => ApiErrorFactory.receiveTimeout,
          DioExceptionType.badCertificate => ApiErrorFactory.badCertificate,
          DioExceptionType.badResponse when e.response?.statusCode != null =>
            switch (e.response!.statusCode) {
              400 => ApiErrorModel(
                message: LocaleKeys.somethingWentWrong,
                icon: Icons.error_outline,
                statusCode: 400,
              ),
              401 => ApiErrorModel(
                message: LocaleKeys.unauthorized,
                icon: Icons.lock_outline,
                statusCode: 401,
              ),
              403 => ApiErrorModel(
                message: LocaleKeys.forbidden,
                icon: Icons.block,
                statusCode: 403,
              ),
              404 => ApiErrorModel(
                message: LocaleKeys.notFound,
                icon: Icons.search_off,
                statusCode: 404,
              ),
              422 => ApiErrorModel(
                message: LocaleKeys.unprocessableEntity,
                icon: Icons.warning_amber,
                statusCode: 422,
              ),
              429 => ApiErrorModel(
                message: LocaleKeys.tooManyRequests,
                icon: Icons.timelapse,
                statusCode: 429,
              ),
              500 => ApiErrorModel(
                message: LocaleKeys.internalServerError,
                icon: Icons.dangerous,
                statusCode: 500,
              ),
              502 => ApiErrorModel(
                message: LocaleKeys.badGateway,
                icon: Icons.cloud_off,
                statusCode: 502,
              ),
              503 => ApiErrorModel(
                message: LocaleKeys.serviceUnavailable,
                icon: Icons.engineering,
                statusCode: 503,
              ),
              504 => ApiErrorModel(
                message: LocaleKeys.gatewayTimeout,
                icon: Icons.timer_off,
                statusCode: 504,
              ),
              _ => ApiErrorFactory.badResponseWithoutCode,
            },
          DioExceptionType.badResponse => ApiErrorModel(
            message: LocaleKeys.somethingWentWrong,
            icon: Icons.warning,
            statusCode: LocalStatusCodes.badResponse,
          ),
          DioExceptionType.cancel => ApiErrorModel(
            message: LocaleKeys.requestCancelled,
            icon: Icons.cancel,
            statusCode: LocalStatusCodes.cancel,
          ),
          DioExceptionType.unknown => ApiErrorModel(
            message: LocaleKeys.somethingWentWrong,
            icon: Icons.error_outline,
            statusCode: LocalStatusCodes.unknown,
          ),
        };
      case Exception _:
        return ApiErrorFactory.defaultError;
      default:
        return ApiErrorFactory.defaultError;
    }
  }
}
