import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:news_app/core/baseViewModel.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/core/state.dart';
import 'package:news_app/data/api_service/articles_response/Article.dart';
import 'package:news_app/data/repository/articles_repository.dart';

@singleton
class SearchViewModel extends BaseViewModel<List<Article>> {
  final ArticlesRepository repository;
  SearchViewModel({required this.repository});

  Timer? _debounce;

  void search(String query) {
    _debounce?.cancel();
    final q = query.trim();
    if (q.isEmpty) {
      emit(InitialState());
      return;
    }
    _debounce = Timer(const Duration(milliseconds: 500), () => _load(q));
  }

  Future<void> _load(String q) async {
    emit(LoadingState());
    final result = await repository.searchArticles(q);
    switch (result) {
      case Success<List<Article>>():
        emit(SuccessState(data: result.data));
      case ServerError<List<Article>>():
        emit(ErrorState(message: result.message));
      case Error<List<Article>>():
        emit(ErrorState(message: result.message));
    }
  }

  void clear() {
    _debounce?.cancel();
    emit(InitialState());
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}