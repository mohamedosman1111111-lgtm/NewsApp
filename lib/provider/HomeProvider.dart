import 'package:flutter/material.dart';
import 'package:news_app/feathers/main_layout/CategoryScreen/CategoryScreen.dart';
import 'package:news_app/feathers/main_layout/sources/SourcesScreen.dart';
import 'package:news_app/feathers/models/CategoryModel.dart';

class HomeProvider extends ChangeNotifier{
Widget selectedWidget=CategoryScreen();
String appBarTitle = "Home";

void changeToHome(){
  selectedWidget=CategoryScreen();
  appBarTitle = "Home";
  notifyListeners();
}
void changeToSources(CategoryModel category){
  selectedWidget=SourcesScreen(category: category,);
  appBarTitle = category.name;
  notifyListeners();
}

}