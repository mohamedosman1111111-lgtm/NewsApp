import 'package:news_app/core/result.dart';
import 'package:news_app/data/api_service/articles_response/Article.dart';
import 'package:news_app/data/api_service/sources_response/Source.dart';

abstract class ArticlesRepository {
  Future<Result<List<Article>>> getArticles(Source sources);
}