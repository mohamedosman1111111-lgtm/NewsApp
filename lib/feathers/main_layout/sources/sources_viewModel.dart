
import 'package:injectable/injectable.dart';
import 'package:news_app/core/baseViewModel.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/core/state.dart';
import 'package:news_app/data/api_service/api_Service.dart';
import 'package:news_app/data/api_service/sources_response/Source.dart';
import 'package:news_app/data/repository/sources_repository.dart';
import 'package:news_app/feathers/models/CategoryModel.dart';
@singleton
class SourcesViewModel extends BaseViewModel<List<Source>> {
  SourcesRepository repository;
  SourcesViewModel({required this.repository});
  Future<void> loadSources(CategoryModel category) async {
    emit(LoadingState());
    var result = await repository.getSources(category);
    switch (result) {
      case Success<List<Source>>():
        {
          emit(SuccessState(data: result.data));
        }
      case ServerError<List<Source>>():
        {
          emit(ErrorState(message: result.message));
        }
      case Error<List<Source>>():
        {
          emit(ErrorState(message: result.message));
        }
    }
  }
}
