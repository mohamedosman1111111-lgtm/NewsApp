import 'package:news_app/core/result.dart';
import 'package:news_app/data/api_service/sources_response/Source.dart';
import 'package:news_app/feathers/models/CategoryModel.dart';

abstract class SourcesDataSource {
  Future<Result<List<Source>>> getSources(CategoryModel category);
}