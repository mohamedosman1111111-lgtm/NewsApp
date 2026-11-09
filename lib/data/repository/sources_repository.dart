import 'package:news_app/core/result.dart';
import 'package:news_app/data/api_service/sources_response/Source.dart';
import 'package:news_app/feathers/models/CategoryModel.dart';

abstract class SourcesRepository {
  Future<Result<List<Source>>> getSources (CategoryModel category);
}