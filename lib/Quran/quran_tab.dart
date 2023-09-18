import 'package:flutter/material.dart';
import 'package:islami_app/MyCustomTheme.dart';
import 'package:islami_app/Providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'SwrList.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class quran_tab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Center(child: Image.asset("assets/images/quran_image.png")),
        Divider(thickness: 3,color: provider.appTheme == ThemeMode.dark ? MyCustomTheme.yellowColor :MyCustomTheme.primaryLightColor),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(flex: 5,child: Text(AppLocalizations.of(context)!.sura_name,textAlign: TextAlign.center ,
                  style: provider.appTheme == ThemeMode.dark ? MyCustomTheme().mediumText.copyWith(color: MyCustomTheme.whiteColor) :MyCustomTheme().mediumText)),
              Expanded(child: VerticalDivider(thickness: 3,color: provider.appTheme == ThemeMode.dark ? MyCustomTheme.yellowColor :MyCustomTheme.primaryLightColor)),
              Expanded(flex: 5,child: Text(AppLocalizations.of(context)!.ayat_number,textAlign: TextAlign.center ,
                  style: provider.appTheme == ThemeMode.dark ? MyCustomTheme().mediumText.copyWith(color: MyCustomTheme.whiteColor) :MyCustomTheme().mediumText)),
            ],
          ),
        ),
        Divider(thickness: 3,color: provider.appTheme == ThemeMode.dark ? MyCustomTheme.yellowColor :MyCustomTheme.primaryLightColor),
        SwrList(),
      ],
    );
  }

}