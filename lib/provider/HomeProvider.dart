import 'package:flutter/material.dart';
import 'package:news_app/feathers/main_layout/CategoryScreen/CategoryScreen.dart';
import 'package:news_app/feathers/main_layout/sources/SourcesScreen.dart';
import 'package:news_app/feathers/models/CategoryModel.dart';

class HomeProvider extends ChangeNotifier{
Widget selectedWidget=CategoryScreen();

void changeToHome(){
  selectedWidget=CategoryScreen();
  notifyListeners();
}
void changeToSources(CategoryModel category){
  selectedWidget=SourcesScreen(category: category,);
  notifyListeners();
}

}