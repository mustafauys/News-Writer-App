import 'package:dio/dio.dart';
import 'package:newsapp/model/source_response.dart';

class NewsRepository {
  static String mainUrl = "https://newsapi.org/v2/";
  final String apiKey = "97322a16fa4e474797dfd4f8eece3371";

  final Dio _dio = Dio();

  var getSourcesUrl = "$mainUrl/sources";
  var getTopHeadlinesUrl = "$mainUrl/top-headlines";
  var everythingUrl = "$mainUrl/everything";

  Future<SourceResponse> getSources() async {
    var params = {
      "apiKey" : apiKey,
      "language" : "en",
      "country" : "us",
    };

    try{
      Response response = await _dio.get(getSourcesUrl, queryParameters: params);
      return SourceResponse.fromJson(response.data);
    }
     catch (error, stacktrace) {
       print("Exception occured : $error stackTrace: $stacktrace");
       return SourceResponse.withError(error);
     }
  }
}