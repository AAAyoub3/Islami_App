import 'package:flutter/material.dart';
import 'package:islami_app/Hadeth/hadeth_screen.dart';
import 'package:islami_app/Home_Screen.dart';
import 'package:islami_app/MyCustomTheme.dart';
import 'package:islami_app/Providers/app_config_provider.dart';
import 'package:islami_app/Quran/quran_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(),
      child: Islami_App()));
}
class Islami_App extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      initialRoute: Home_Screen.routeName,

      theme: MyCustomTheme().mylightTheme ,
      darkTheme: MyCustomTheme().mydarkTheme,

      themeMode: provider.appTheme,

      routes: {
       Home_Screen.routeName : (context) => Home_Screen(),
       ayat_screen.routeName : (context) => ayat_screen(),
       hadeth_screen.routeName : (context) => hadeth_screen(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage)
    );
  }

}