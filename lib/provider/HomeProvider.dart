import 'package:flutter/material.dart';
import 'package:news_app/feathers/main_layout/CategoryScreen/CategoryScreen.dart';
import 'package:news_app/feathers/main_layout/sources/SourcesScreen.dart';

class HomeProvider extends ChangeNotifier{
Widget selectedWidget=CategoryScreen();

void changeToHome(){
  selectedWidget=CategoryScreen();
  notifyListeners();
}
void changeToSources(){
  selectedWidget=SourcesScreen();
  notifyListeners();
}

}