import 'package:flutter/cupertino.dart';
import 'package:news_app/feathers/main_layout/mainlayout.dart';

class AppRoutes {
  static const String mainLayout='/mainLayout';


  static Map<String,WidgetBuilder> routes={
mainLayout:(_)=>MainLayout(),

  };
}