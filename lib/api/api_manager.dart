import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constant.dart';
import 'package:news_app/api/endpoint.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/models/source_response.dart';

/**
 https://newsapi.org/v2/top-headlines/sources?apiKey=f0bc16111ea041a19d2d276c791c5dcd
 */
/**
 https://newsapi.org/v2/everything?q=bitcoin&apiKey=f0bc16111ea041a19d2d276c791c5dcd
 */
class ApiManager {
  static Future<SourceResponse?> getResponse({required String id}) async {
    Uri url = Uri.https(
        ApiConstant.baseUrl, Endpoint.endPoint, {
          'apiKey': ApiConstant.apiKey,
          'category' :id
          });
    try {
      var response = await http.get(url);
      return SourceResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> getNewsById(String id) async {
    Uri url = Uri.https(ApiConstant.baseUrl, Endpoint.newsApi,
        {'apiKey': ApiConstant.apiKey, 'sources': id});
    try {
      var response = await http.get(url);
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
}

