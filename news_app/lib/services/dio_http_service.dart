import 'package:dio/dio.dart';
import 'package:news_app/app_constants/app_constants.dart';
import 'package:news_app/services/services.dart';

class DioHttpService implements HttpService {
  late final Dio dio;

  DioHttpService({
    Dio? dioOverride,
  }) {
    dio = dioOverride ?? Dio(baseOptions);
  }

  @override
  // TODO: implement baseUrl
  String get baseUrl => 'Get from AppConfigs';

  @override
  Map<String, String> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  /// The Dio base options
  BaseOptions get baseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  @override
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    bool forceRefresh = false,
  }) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future put() {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
