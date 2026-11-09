import 'package:news_app/core/result.dart';
import 'package:news_app/data/api_service/api_Service.dart';
import 'package:news_app/data/api_service/articles_response/Article.dart';
import 'package:news_app/data/api_service/sources_response/Source.dart';
import 'package:news_app/data/data_source/articles_datasource.dart';

class ArticlesApiDataSource implements ArticlesDataSource{
  APIService apiService;
  ArticlesApiDataSource({required this.apiService});
  @override
  Future<Result<List<Article>>> getArticles(Source source) {
   var result= apiService.getArticles(source);
   return result;
  }

}