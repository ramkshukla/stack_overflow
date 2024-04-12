import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:retry/retry.dart';
import 'package:stack_overflow/_util/api_response.dart';
import 'package:stack_overflow/_util/app_constant.dart';
import 'package:stack_overflow/_util/enum.dart';
import 'package:stack_overflow/_util/extensions.dart';

class ApiCall<T> {
  final Dio dio = Dio();

  final retryOption =
      const RetryOptions(maxAttempts: 50, maxDelay: Duration(seconds: 8));

  Future<Either<Failure, T>> handleAPI({
    required String endpoint,
    dynamic body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    APICallType callType = APICallType.GET,
    required Future<Either<Failure, T>> Function(dynamic responseBody)
        handleSuccess,
  }) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      "No Internet Connection".logIt;
    }
    if (isConnected) {
      Map<String, dynamic> headers = {
        "Accept": "application/json",
        "Content-Type": "application/json"
      };

      Options options = Options(
        headers: headers,
        receiveTimeout: const Duration(milliseconds: 10000),
        sendTimeout: const Duration(milliseconds: 10000),
      );

      try {
        late Response<dynamic> response;
        final uri = Uri.parse(endpoint);

        if (body != null) {
          body = jsonEncode(body);
        }

        if (callType == APICallType.GET) {
          response = await retryOption.retry(
            () => dio.get(
              uri.toString(),
              queryParameters: queryParams,
              options: options,
            ),
            onRetry: (e) => e is SocketException || e is TimeoutException,
          );
        }
        if (callType == APICallType.POST) {
          response = await retryOption.retry(
            () => dio.post(
              uri.toString(),
              data: body,
              options: options,
            ),
            onRetry: (e) => e is SocketException || e is TimeoutException,
          );
        }
        if (callType == APICallType.PUT) {
          response = await retryOption.retry(
            () => dio.put(
              uri.toString(),
              data: body,
              queryParameters: queryParams,
              options: options,
            ),
            onRetry: (e) => e is SocketException || e is TimeoutException,
          );
        }
        if (callType == APICallType.DELETE) {
          response = await retryOption.retry(
            () => dio.delete(
              uri.toString(),
              queryParameters: queryParams,
              data: body,
              options: options,
            ),
            onRetry: (e) => e is SocketException || e is TimeoutException,
          );
        }

        final responseBody = response.data as dynamic;

        switch (response.statusCode) {
          case 200:
            final result = await handleSuccess(responseBody);
            return result;

          default:
            return left(
              Failure(
                code: response.statusCode ?? 500,
                response: "Server Error",
              ),
            );
        }
      } on SocketException catch (_) {
        "Socket Error: 601 ${_.message}".logIt;
        return left(
          Failure(code: 601, response: "Please try again"),
        );
      } on DioException catch (_) {
        "Dio Status Code: ${_.message}".logIt;
        if (_.response!.statusCode == 201) {
          "You have successfully logged out from the app".logIt;
        }
        return left(
          Failure(
            code: _.response!.statusCode,
            response: "Some Error Occurred",
          ),
        );
      } on Exception catch (e, stack) {
        "Exception $e".logIt;
        "Stack Trace: $stack".logIt;
        return left(
          Failure(code: 601, response: e.toString()),
        );
      }
    } else {
      "No Internet Connection".logIt;
      return left(
        Failure(code: 601, response: "Please try again"),
      );
    }
  }
}
