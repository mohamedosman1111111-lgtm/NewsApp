import 'package:flutter/material.dart';
import 'package:news_app/config/theme/AppTheme.dart';
import 'package:news_app/provider/HomeProvider.dart';
import 'package:news_app/utils/AppRoutes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomeProvider(),),
    ],
      child: const NewsApp()));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
   // HomeProvider homeProvider=Provider.of<HomeProvider>(context);

    return MaterialApp(
     debugShowCheckedModeBanner: false,
     initialRoute:AppRoutes.mainLayout,
     routes: AppRoutes.routes,
     theme: AppTheme.light,
     darkTheme: AppTheme.dark ,
     themeMode:ThemeMode.light,
     locale:Locale("en") ,
     supportedLocales: [
       Locale("en"),
       Locale("ar"),
     ],

    );
  }
}
