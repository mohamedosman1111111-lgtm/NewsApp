import 'package:flutter/material.dart';
import 'package:news_app/core/state.dart';

class BaseViewModel<T> extends ChangeNotifier{
  MyState<T> state=InitialState();
  void emit(MyState<T> newState){
    state=newState;
    notifyListeners();
  }
}