import 'package:flutter/material.dart';
import 'package:islami_app/MyCustomTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class theme_sheet_list extends StatefulWidget {


  @override
  State<theme_sheet_list> createState() => _Language_sheet_listState();
}

class _Language_sheet_listState extends State<theme_sheet_list> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      color: provider.appTheme == ThemeMode.dark ? MyCustomTheme.secondaryColor:MyCustomTheme.whiteColor ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell( /// light
              onTap: (){
                provider.changeTheme(ThemeMode.light);
              },
              child: provider.appTheme == ThemeMode.light ? getSelectedWidget(AppLocalizations.of(context)!.lightTheme):
              getUnSelectedWidget(AppLocalizations.of(context)!.lightTheme)
          ),



          InkWell( /// dark
              onTap: (){
                provider.changeTheme(ThemeMode.dark);
              },
              child: provider.appTheme == ThemeMode.dark ? getSelectedWidget(AppLocalizations.of(context)!.darkTheme):
              getUnSelectedWidget(AppLocalizations.of(context)!.darkTheme)
          ),
        ],
      ),
    );
  }

  Widget getSelectedWidget(String text){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,style: MyCustomTheme().mediumText.copyWith(color: MyCustomTheme.primaryLightColor),),
          Icon(Icons.check,color: MyCustomTheme.primaryLightColor)
        ],
      ),
    );
  }
  Widget getUnSelectedWidget(String text){
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,style: provider.appTheme == ThemeMode.dark ? MyCustomTheme().mediumText.copyWith(color: MyCustomTheme.whiteColor):MyCustomTheme().mediumText),
        ],
      ),
    );
  }

}
