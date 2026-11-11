import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'package:news_app/core/result.dart';
import 'package:news_app/data/api_service/articles_response/Article.dart';
import 'package:news_app/data/api_service/articles_response/ArticleResponse.dart';
import 'package:news_app/data/api_service/sources_response/Source.dart';
import 'package:news_app/data/api_service/sources_response/SourcesResponse.dart';
import 'package:news_app/feathers/models/CategoryModel.dart';

@singleton
class APIService {
  ///https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
  static const String baseURL = "newsapi.org";
  static const String sourcesEndPoint = "/v2/top-headlines/sources";
  static const String articlesEndPoint = "/v2/everything";
  static const String APIKEY = "de8156bd7ba945b490524260ce69352d";

   Future<Result<List<Source>>> getSources(CategoryModel category) async {
    Uri url = Uri.https(baseURL, sourcesEndPoint, {
      "apiKey": APIKEY,
      "category": category.id,
    });
    try {
      http.Response serverResponse = await http.get(url);
      var json = jsonDecode(serverResponse.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      if (sourcesResponse.status == 'error') {
        return ServerError(
          code: sourcesResponse.code ?? '',
          message: sourcesResponse.message ?? '',
        );
      } else {
        return Success(data: sourcesResponse.sources ?? []);
      }
    } catch (exception) {
      if (exception is SocketException) {
        return Error(message: "No Internet connection. Please check your network.");
      }
      if (exception is TimeoutException) {
        return Error(message: "The connection timed out. Please try again.");
      }
      if (exception is FormatException) {
        return Error(message: "Bad response format from server.");
      }
      return Error(message: "An unexpected error occurred: ${exception.toString()}");
    }
  }

   Future<Result<List<Article>>> getArticles(Source source) async {
    Uri url = Uri.https(baseURL, articlesEndPoint, {
      "apiKey": APIKEY,
      "sources": source.id,
    });
    try {
      http.Response serverResponse = await http.get(url);
      var json = jsonDecode(serverResponse.body);
      ArticleResponse articleResponse = ArticleResponse.fromJson(json);
      if (articleResponse.status == 'error') {
        return ServerError(
          code: articleResponse.code ?? '',
          message: articleResponse.message ?? '',
        );
      } else {
        return Success(data: articleResponse.articles ?? []);
      }
    } catch (exception) {
      if (exception is SocketException) {
        return Error(message: "No Internet connection. Please check your network.");
      }
      if (exception is TimeoutException) {
        return Error(message: "The connection timed out. Please try again.");
      }
      if (exception is FormatException) {
        return Error(message: "Bad response format from server.");
      }
      return Error(message: "An unexpected error occurred: ${exception.toString()}");
    }
  }
}
