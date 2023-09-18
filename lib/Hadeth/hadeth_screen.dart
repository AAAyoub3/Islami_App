import 'package:flutter/material.dart';
import 'package:islami_app/Hadeth/AhadethList.dart';
import 'package:islami_app/MyCustomTheme.dart';
import 'package:islami_app/Providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class hadeth_screen extends StatelessWidget{
  static const String routeName = 'hadeth_screen';
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as HadethDetails;

    return Container(
      child: Stack(
        children: [
          provider.appTheme == ThemeMode.dark ? MyCustomTheme.darkBackground : MyCustomTheme.lightBackground,
          Scaffold(
            appBar: AppBar(title:Text(args.title,style:provider.appTheme == ThemeMode.dark ?
            MyCustomTheme().largeText.copyWith(color: MyCustomTheme.yellowColor):
            MyCustomTheme().largeText.copyWith(color: MyCustomTheme.blackColor)
            ),iconTheme: IconThemeData(color:provider.appTheme == ThemeMode.dark ?MyCustomTheme.whiteColor:MyCustomTheme.blackColor )),
            body: Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical:60 ),
                decoration: BoxDecoration(
                    color: provider.appTheme == ThemeMode.dark ?MyCustomTheme.secondaryColor:MyCustomTheme.whiteColor,
                    borderRadius: BorderRadius.circular(30)
                ),
                child:SingleChildScrollView(
                        child: Text("${args.hadethList}",style: provider.appTheme == ThemeMode.dark ?
                        MyCustomTheme().smallText.copyWith(color: MyCustomTheme.yellowColor)
                            :
                        MyCustomTheme().smallText))
                ),
            ),
            ),
        ],
      ),
    );
  }

}