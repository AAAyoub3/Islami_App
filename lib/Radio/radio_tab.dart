import 'package:flutter/material.dart';
import 'package:islami_app/MyCustomTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class radio_tab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset("assets/images/radio_image.png"),
        Text(AppLocalizations.of(context)!.quran_kareem_radio,style: provider.appTheme == ThemeMode.dark ?
        MyCustomTheme().mediumText.copyWith(color: MyCustomTheme.whiteColor) :
        MyCustomTheme().mediumText,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.skip_previous),color: provider.appTheme == ThemeMode.dark ? MyCustomTheme.yellowColor:MyCustomTheme.primaryLightColor,iconSize: 50,),
          IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow),color: provider.appTheme == ThemeMode.dark ? MyCustomTheme.yellowColor:MyCustomTheme.primaryLightColor,iconSize: 50,),
          IconButton(onPressed: (){}, icon: Icon(Icons.skip_next),color: provider.appTheme == ThemeMode.dark ? MyCustomTheme.yellowColor:MyCustomTheme.primaryLightColor,iconSize: 50,),
        ],)
      ],
    );
  }

}