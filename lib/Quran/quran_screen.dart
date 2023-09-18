import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/MyCustomTheme.dart';
import 'package:islami_app/Providers/app_config_provider.dart';
import 'package:islami_app/Quran/SwrList.dart';
import 'package:provider/provider.dart';

class ayat_screen extends StatefulWidget {
  static const String routeName = 'Ayat';

  @override
  State<ayat_screen> createState() => _ayat_screenState();
}

class _ayat_screenState extends State<ayat_screen> {
  List<String> lines = [];

  void LoadSurah(int index) async {
    String content =
        await rootBundle.loadString('assets/content/${index + 1}.txt');
    lines = content.split("\n");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetails;

    if (lines.isEmpty) {
      LoadSurah(args.index);
    }
    /// to avoid recursion

    return Container(
      child: Stack(
        children: [
          provider.appTheme == ThemeMode.dark ? MyCustomTheme.darkBackground : MyCustomTheme.lightBackground,
          Scaffold(
            appBar: AppBar(
              title: Text(" سورة ${args.Name}", style: provider.appTheme == ThemeMode.dark ?
              MyCustomTheme().largeText.copyWith(color: MyCustomTheme.yellowColor)
                  :
              MyCustomTheme().largeText,
              ),
              backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color:provider.appTheme == ThemeMode.dark ?MyCustomTheme.whiteColor:MyCustomTheme.blackColor ),
              elevation: 0.0,
              centerTitle: true,
            ),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical:60 ),
              decoration: BoxDecoration(
                color: provider.appTheme == ThemeMode.dark ?MyCustomTheme.secondaryColor:MyCustomTheme.whiteColor,
                borderRadius: BorderRadius.circular(30)
              ),
              child: lines.length == 0
                  ? Center(
                      child: CircularProgressIndicator(
                      color: MyCustomTheme.primaryLightColor,
                    ))
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Center(
                            child: Text("${lines[index]} (${index + 1})",
                                style: provider.appTheme == ThemeMode.dark ?
                                MyCustomTheme().smallText.copyWith(color: MyCustomTheme.yellowColor)
                                    :
                                MyCustomTheme().smallText));
                      },
                      itemCount: lines.length,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
