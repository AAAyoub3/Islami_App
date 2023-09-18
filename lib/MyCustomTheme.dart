import 'package:flutter/material.dart';

class MyCustomTheme{
  static Color primaryLightColor =const Color(0xFFB7935F);
  static Color secondaryColor =const Color(0xFF141A2E);
  static Color blackColor =const Color(0xFF242424);
  static Color whiteColor =const Color(0xFFF8F8F8);
  static Color yellowColor = const Color(0xFFFACC1D);
  static Image lightBackground = Image.asset(
    "assets/images/background.png",
    fit: BoxFit.fill,height: double.infinity,width: double.infinity,);
  static Image darkBackground = Image.asset(
    "assets/images/bg.png",
    fit: BoxFit.fill,height: double.infinity,width: double.infinity,);

  ThemeData mylightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primaryLightColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: blackColor),
      titleTextStyle: TextStyle(color: Colors.black,fontSize: 24) ,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: MyCustomTheme.whiteColor,
        selectedItemColor: MyCustomTheme.blackColor,
      backgroundColor: primaryLightColor
    )

  );

  ThemeData mydarkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: secondaryColor,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: whiteColor),
        titleTextStyle: TextStyle(color: Colors.black,fontSize: 24) ,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: MyCustomTheme.whiteColor,
          selectedItemColor: MyCustomTheme.yellowColor,
          backgroundColor: secondaryColor
      )

  );

  TextStyle smallText = const TextStyle(fontSize: 20,);
  TextStyle boldMediumText = const TextStyle(fontSize: 25,fontWeight: FontWeight.bold);
  TextStyle mediumText = const TextStyle(fontSize: 25);
  TextStyle largeText = const TextStyle(fontSize: 30,fontWeight: FontWeight.bold);
}