import 'package:injectable/injectable.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/data/api_service/articles_response/Article.dart';
import 'package:news_app/data/api_service/sources_response/Source.dart';
import 'package:news_app/data/data_source/articles_datasource.dart';
import 'package:news_app/data/repository/articles_repository.dart';
@Singleton(as: ArticlesRepository)

class ArticlesRepositoryImpl implements ArticlesRepository{
  ArticlesDataSource dataSource;
  ArticlesRepositoryImpl({required this.dataSource});
  @override
  Future<Result<List<Article>>> getArticles(Source source) {
    var result=dataSource.getArticles(source);
    return result;
  }

}