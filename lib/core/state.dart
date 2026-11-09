sealed class MyState<T> {}
class InitialState<T> extends MyState<T>{}
class SuccessState<T> extends MyState<T>{
  T data;
  SuccessState({required this.data});
}
class LoadingState<T> extends MyState<T>{}
class ErrorState<T> extends MyState<T>{
  String message;
  ErrorState({required this.message});
}