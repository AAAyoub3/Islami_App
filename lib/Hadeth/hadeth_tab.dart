import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Hadeth/AhadethList.dart';
import 'package:islami_app/MyCustomTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class hadeth_tab extends StatefulWidget{

  @override
  State<hadeth_tab> createState() => _hadeth_tabState();
}

class _hadeth_tabState extends State<hadeth_tab> {
  List<String> titles=[];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(
      children: [
        Center(child: Image.asset("assets/images/ahadeth_image.png")),
        Divider(thickness: 3, color: provider.appTheme == ThemeMode.dark ? MyCustomTheme.yellowColor :MyCustomTheme.primaryLightColor),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(flex: 5,
                  child: Text(AppLocalizations.of(context)!.hadeth_number, textAlign: TextAlign.center,
                      style: provider.appTheme == ThemeMode.dark ? MyCustomTheme().mediumText.copyWith(color: MyCustomTheme.whiteColor):
                      MyCustomTheme().mediumText.copyWith(color: MyCustomTheme.blackColor))),
            ],
          ),
        ),
        Divider(thickness: 3, color: provider.appTheme == ThemeMode.dark ? MyCustomTheme.yellowColor :MyCustomTheme.primaryLightColor),
        AhadethList()

      ],
    );
  }
}