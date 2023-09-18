import 'package:flutter/material.dart';
import 'package:islami_app/MyCustomTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Providers/app_config_provider.dart';
import 'package:islami_app/Settings/Language_sheet_list.dart';
import 'package:islami_app/Settings/theme_sheet_list.dart';
import 'package:provider/provider.dart';

class settings_tab extends StatefulWidget{
  @override
  State<settings_tab> createState() => _settings_tabState();
}

class _settings_tabState extends State<settings_tab> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Row(children: [Text(AppLocalizations.of(context)!.language,style: provider.appTheme == ThemeMode.dark ?
          MyCustomTheme().mediumText.copyWith(color: MyCustomTheme.whiteColor) :
          MyCustomTheme().mediumText,)]),
          SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
              color: provider.appTheme == ThemeMode.dark ? MyCustomTheme.secondaryColor:MyCustomTheme.primaryLightColor,
              borderRadius: BorderRadius.circular(10)
            ),

           child: InkWell(
             onTap: (){
                showLanguageSheet();
             },
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Icon(Icons.arrow_drop_down),
                   Text(provider.appLanguage == "en" ?AppLocalizations.of(context)!.english :AppLocalizations.of(context)!.arabic,
                     style: provider.appTheme == ThemeMode.dark ?
                     MyCustomTheme().mediumText.copyWith(color: MyCustomTheme.whiteColor) :
                     MyCustomTheme().mediumText,)
                 ],
               ),
             ),
           ),
          ),
          SizedBox(height: 10,),
          Row(children: [Text(AppLocalizations.of(context)!.theme,style: provider.appTheme == ThemeMode.dark ?
          MyCustomTheme().mediumText.copyWith(color: MyCustomTheme.whiteColor) :
          MyCustomTheme().mediumText,)]),
          SizedBox(height: 10,),
          Container(
        decoration: BoxDecoration(
            color: provider.appTheme == ThemeMode.dark ? MyCustomTheme.secondaryColor:MyCustomTheme.primaryLightColor,
            borderRadius: BorderRadius.circular(10)
        ),

        child: InkWell(
          onTap: (){
            showThemeSheet();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_drop_down),
                Text(provider.appTheme == ThemeMode.light ?AppLocalizations.of(context)!.lightTheme:AppLocalizations.of(context)!.darkTheme,
                style: provider.appTheme == ThemeMode.dark ?
                MyCustomTheme().mediumText.copyWith(color: MyCustomTheme.whiteColor) :
                MyCustomTheme().mediumText,),
              ],
            ),
          ),
        ),
      ),
        ],
      ),
    );
  }
  void showLanguageSheet() {
    showModalBottomSheet(
        context: context, builder:(context)=> Language_sheet_list());
  }
  void showThemeSheet() {
    showModalBottomSheet(
        context: context, builder:(context)=> theme_sheet_list());
  }
}

