// Packages
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HTTPService {
  final Dio dio = Dio();
  late String? _baseApiUrl;
  late String? _apiKey;

  HTTPService() {
    final Map<String, String> env = dotenv.env;
    _baseApiUrl = env['BASE_API_URL'];
    _apiKey = env['API_KEY'];
  }

  Future<Response> get(String _path, { Map<String, dynamic>? query}) async {
    try {
      String _url = '$_baseApiUrl$_path';
      Map<String, dynamic> _query = {
        'api_key': _apiKey,
        'language': 'en-US',
      };

      if (query != null) {
        _query.addAll(query);
      }

      return await dio.get(_url, queryParameters: _query);

    } on DioError catch(e) {
      print('Unable to perform get request.');
      print('Dio error: $e');
      rethrow;
    }

  }
}
