import 'package:injectable/injectable.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/data/api_service/api_Service.dart';
import 'package:news_app/data/api_service/sources_response/Source.dart';
import 'package:news_app/data/data_source/sources_datasource.dart';
import 'package:news_app/feathers/models/CategoryModel.dart';
@Singleton(as: SourcesDataSource)
class SourcesApiDataSource implements SourcesDataSource{
  APIService apiService;
  SourcesApiDataSource(this.apiService);
  @override
  Future<Result<List<Source>>> getSources(CategoryModel category) async{
 var result =await apiService.getSources(category);
 return result;
  }

}