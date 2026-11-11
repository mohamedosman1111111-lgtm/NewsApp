import 'package:injectable/injectable.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/data/api_service/sources_response/Source.dart';
import 'package:news_app/data/data_source/sources_datasource.dart';
import 'package:news_app/data/repository/sources_repository.dart';
import 'package:news_app/feathers/models/CategoryModel.dart';
@Singleton(as: SourcesRepository)
class SourcesRepositoryImpl implements SourcesRepository{
  SourcesDataSource dataSource;
  SourcesRepositoryImpl({required this.dataSource});
  @override
  Future<Result<List<Source>>> getSources(CategoryModel category) {
   var result= dataSource.getSources(category);
   return result;
  }

}