
import 'package:news_app/core/baseViewModel.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/core/state.dart';
import 'package:news_app/data/api_service/api_Service.dart';
import 'package:news_app/data/api_service/articles_response/Article.dart';
import 'package:news_app/data/api_service/sources_response/Source.dart';
import 'package:news_app/data/repository/articles_repository.dart';

class ArticlesViewModel extends BaseViewModel<List<Article>> {
  ArticlesRepository repository;
  ArticlesViewModel({required this.repository});
  void loadArticles(Source source) async {
    emit(LoadingState());
    var result = await repository.getArticles(source);
    switch (result) {
      case Success<List<Article>>():
        {
          emit(SuccessState(data: result.data));
        }
      case ServerError<List<Article>>():
        {
          emit(ErrorState(message: result.message));
        }
      case Error<List<Article>>():
        {
          emit(ErrorState(message: result.message));
        }
    }
  }
}
