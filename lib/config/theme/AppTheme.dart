import 'package:flutter/material.dart';
import 'package:news_app/utils/AppColors.dart';

class AppTheme {
  static ThemeData light=ThemeData(
    primaryColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.lightBg,

    appBarTheme: AppBarThemeData(
        backgroundColor: AppColors.lightBg,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.black
        )
    ),

    tabBarTheme: TabBarThemeData(
      labelColor: AppColors.black,
      labelStyle:TextStyle(fontSize: 18,fontWeight: FontWeight.w700) ,
      dividerColor: Colors.transparent,
        indicatorColor: AppColors.black,
        unselectedLabelStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.black)
    ),






    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: AppColors.white,
        shape: StadiumBorder()
    ),

    textTheme: TextTheme(
      labelLarge: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: AppColors.black),
      labelMedium: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: AppColors.black),


    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.borderSideLight,width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.borderSideLight,width: 1.5),

      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.errorRed,width: 1.5),

      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.errorRed,width: 1.5),

      ),

    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.all(12)
      ),
    ),
    iconTheme: IconThemeData(color: AppColors.black),

  );



  static ThemeData dark=ThemeData(
    primaryColor: AppColors.white,
    fontFamily: "Poppins",
    scaffoldBackgroundColor: AppColors.black,
    cardTheme: CardThemeData(
      color: AppColors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppColors.strokeDark,width: 1)
      ),
    ),
    appBarTheme: AppBarThemeData(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.white
        )
    ),



    tabBarTheme: TabBarThemeData(
        labelColor: AppColors.white,
        labelStyle:TextStyle(fontSize: 18,fontWeight: FontWeight.w700) ,
        dividerColor: Colors.transparent,
        indicatorColor: AppColors.white,
        unselectedLabelStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.white)
    ),




    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.mainTextdark,
        foregroundColor: AppColors.white,
        shape: StadiumBorder()
    ),

    textTheme: TextTheme(
      labelLarge: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: AppColors.white),
      labelMedium: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: AppColors.white),



    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkNavy,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.strokeDark,width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.strokeDark,width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.errorRed,width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.errorRed,width: 1.5),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainTextdark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.all(12)
      ),
    ),
    iconTheme: IconThemeData(color: AppColors.white),
  );


}