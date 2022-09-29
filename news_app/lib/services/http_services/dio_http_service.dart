import 'package:dio/dio.dart';
import 'package:news_app/app_constants/app_constants.dart';
import 'package:news_app/services/exceptions/exceptions.dart';
import 'package:news_app/services/services.dart';

class DioHttpService implements HttpService {
  late final Dio _dio;

  DioHttpService({
    Dio? dioOverride,
  }) {
    final innerDio = Dio(baseOptions);
    _dio = dioOverride ?? innerDio
      ..interceptors.add(
        InterceptorsWrapper(
          onError: (DioError e, handler) => handler.resolve(e.response!),
        ),
      );
  }

  @override
  String get baseUrl => AppConfigs.baseUrl;

  @override
  Map<String, String> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
        'Authorization': AppConfigs.newsApiKey,
      };

  /// The Dio base options
  BaseOptions get baseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
        responseType: ResponseType.json,
      );

  @override
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(endpoint, queryParameters: queryParameters);

    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: AppStrings.httpExceptionTitle,
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response.data;
  }
}
