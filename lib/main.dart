import 'package:flutter/material.dart';
import 'package:news_app/config/theme/AppTheme.dart';
import 'package:news_app/core/DI/di.dart';
import 'package:news_app/provider/HomeProvider.dart';
import 'package:news_app/provider/ThemeProvider.dart';
import 'package:news_app/utils/AppRoutes.dart';
import 'package:provider/provider.dart';

void main()async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  final themeProvider=AppThemeProvider();
  await themeProvider.initTheme();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomeProvider(),),
      ChangeNotifierProvider(create: ((context) => AppThemeProvider())),

    ],
      child: const NewsApp()));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider=Provider.of<HomeProvider>(context);
    AppThemeProvider themeProvider=Provider.of<AppThemeProvider>(context);

    return MaterialApp(
     debugShowCheckedModeBanner: false,
     initialRoute:AppRoutes.mainLayout,
     routes: AppRoutes.routes,
     theme: AppTheme.light,
     darkTheme: AppTheme.dark ,
     themeMode:themeProvider.appTheme,
     locale:Locale("en") ,
     supportedLocales: [
       Locale("en"),
       Locale("ar"),
     ],

    );
  }
}
