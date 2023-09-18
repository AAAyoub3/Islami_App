import 'package:flutter/material.dart';
import 'package:islami_app/Hadeth/hadeth_tab.dart';
import 'package:islami_app/MyCustomTheme.dart';
import 'package:islami_app/Providers/app_config_provider.dart';
import 'package:islami_app/Quran/quran_tab.dart';
import 'package:islami_app/Radio/radio_tab.dart';
import 'package:islami_app/Tasbeh/tasbeh_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'Settings/settings_tab.dart';

class Home_Screen extends StatefulWidget{
  static const String routeName = 'HomeScreen';
  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int selectedIndex=4;
  List<Widget> tabs = [settings_tab(),radio_tab(),tasbeh_tab(),hadeth_tab(),quran_tab()];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
        children: [
          provider.appTheme == ThemeMode.dark ? MyCustomTheme.darkBackground : MyCustomTheme.lightBackground,
          Scaffold(
            appBar: AppBar(title: Text(AppLocalizations.of(context)!.app_title,
            style: provider.appTheme == ThemeMode.dark ?
            MyCustomTheme().mediumText.copyWith(color: MyCustomTheme.whiteColor) :
            MyCustomTheme().mediumText,),),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index){
                setState(() {
                  selectedIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),label: AppLocalizations.of(context)!.settings),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/radio.png")),label:AppLocalizations.of(context)!.radio
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/sebha.png")),label: AppLocalizations.of(context)!.sebha
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/quran-quran-svgrepo-com.png")),label: AppLocalizations.of(context)!.hadeth
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/quran.png")),label:AppLocalizations.of(context)!.quran,
                ),
              ],
            ),
            body:tabs[selectedIndex] ,
          )
        ],
      );
  }
}

