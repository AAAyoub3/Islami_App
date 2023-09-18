import 'package:flutter/material.dart';
import 'package:islami_app/MyCustomTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class tasbeh_tab extends StatefulWidget {
  @override
  State<tasbeh_tab> createState() => _tasbeh_tabState();
}

class _tasbeh_tabState extends State<tasbeh_tab> {
  int counter = 0;
  double angle = 0;
  String text = "";

  void tasbeh() {
    setState(() {
      angle += 2;
      counter = counter + 1;

      if (counter == 99) {
        counter = 0;
        text = AppLocalizations.of(context)!.subhanAllah;
      } else if (counter == 33) {
        text = AppLocalizations.of(context)!.allhamdullah;
      } else if (counter == 66) {
        text = AppLocalizations.of(context)!.allahAkbar;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if(text == ""){
      text = AppLocalizations.of(context)!.subhanAllah;
    }
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      InkWell(
        onTap: tasbeh,
        child: Stack(
          children: [
            Container(
              child: Align(
                  child: Image.asset(
                    provider.appTheme == ThemeMode.dark ?
                    "assets/images/dark_head_of_seb7a.png":"assets/images/head_of_seb7a.png",
                  ),
                  alignment: Alignment.topCenter),
              margin: EdgeInsets.only(left: 40),
            ),
            Container(
              child: Align(
                  child: Transform.rotate(
                      angle: angle,
                      child: Image.asset(provider.appTheme == ThemeMode.dark ?
                      "assets/images/dark_body_of_seb7a.png":"assets/images/body_of_seb7a.png",)),
                  alignment: Alignment.bottomCenter),
              margin: EdgeInsets.only(top: 80),
            ),
          ],
        ),
      ),
      Text(
        AppLocalizations.of(context)!.tasbeh_times,
        style: provider.appTheme == ThemeMode.dark ? MyCustomTheme().mediumText.copyWith(color: MyCustomTheme.whiteColor):
        MyCustomTheme().mediumText.copyWith(color: MyCustomTheme.blackColor),
      ),
      Container(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child:
          Text(counter.toString(), style: provider.appTheme == ThemeMode.dark ?
          MyCustomTheme().boldMediumText.copyWith(color: MyCustomTheme.whiteColor) :
          MyCustomTheme().boldMediumText),
        ),
        decoration: BoxDecoration(
            color: provider.appTheme == ThemeMode.dark ? MyCustomTheme.secondaryColor.withOpacity(0.5):MyCustomTheme.primaryLightColor.withOpacity(0.5) ,
            borderRadius: BorderRadius.circular(20)),
      ),
      Container(
          color: provider.appTheme == ThemeMode.dark ? MyCustomTheme.yellowColor:MyCustomTheme.primaryLightColor,
          child: Text(
            text,
            style: provider.appTheme == ThemeMode.dark ?
            MyCustomTheme().mediumText.copyWith(color: MyCustomTheme.blackColor) :
            MyCustomTheme().mediumText,
          ))
    ]);
  }
}
