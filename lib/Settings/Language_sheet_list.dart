import 'package:flutter/material.dart';
import 'package:islami_app/MyCustomTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class Language_sheet_list extends StatefulWidget {


  @override
  State<Language_sheet_list> createState() => _Language_sheet_listState();
}

class _Language_sheet_listState extends State<Language_sheet_list> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      color: provider.appTheme == ThemeMode.dark ? MyCustomTheme.secondaryColor:MyCustomTheme.whiteColor ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              provider.changeLanguage("ar");
            },
            child: provider.appLanguage == 'ar' ? getSelectedItemWidget(AppLocalizations.of(context)!.arabic):
            getUnSelectedItemWidget(AppLocalizations.of(context)!.arabic)
          ),





          InkWell(
            onTap: (){
              provider.changeLanguage("en");
            },
            child: provider.appLanguage == 'en' ? getSelectedItemWidget(AppLocalizations.of(context)!.english):
            getUnSelectedItemWidget(AppLocalizations.of(context)!.english)
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String language){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(language,style: MyCustomTheme().mediumText.copyWith(color: MyCustomTheme.primaryLightColor),),
          Icon(Icons.check,color: MyCustomTheme.primaryLightColor)
        ],
      ),
    );
  }
  Widget getUnSelectedItemWidget(String language){
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(language,style: provider.appTheme == ThemeMode.dark ? MyCustomTheme().mediumText.copyWith(color: MyCustomTheme.whiteColor):MyCustomTheme().mediumText),
        ],
      ),
    );
  }

}
