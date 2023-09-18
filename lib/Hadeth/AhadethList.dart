import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Hadeth/hadeth_screen.dart';
import 'package:islami_app/MyCustomTheme.dart';
import 'package:islami_app/Providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class AhadethList extends StatefulWidget {
  @override
  State<AhadethList> createState() => _AhadethListState();
}

class _AhadethListState extends State<AhadethList> {
  List<String> hadethList = [];
  List<String> lines = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (hadethList.isEmpty) {
      LoadAllAhadeth();
    }

    /// to stop recursion
    return (hadethList.isNotEmpty)
        ? Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                      child: Text(returnHadethTitle(index),
                          textAlign: TextAlign.center,
                          style: provider.appTheme == ThemeMode.dark
                              ? MyCustomTheme()
                                  .boldMediumText
                                  .copyWith(color: MyCustomTheme.whiteColor)
                              : MyCustomTheme()
                                  .boldMediumText
                                  .copyWith(color: MyCustomTheme.blackColor))),
                  onTap: () {
                    Navigator.of(context).pushNamed(hadeth_screen.routeName,
                        arguments: HadethDetails(
                            title: returnHadethTitle(index),
                            hadethList: lines));
                  },
                );
              },
              itemCount: hadethList.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(thickness: 3, color: provider.appTheme == ThemeMode.dark ?
                MyCustomTheme.yellowColor :MyCustomTheme.primaryLightColor);
              },
            ),
          )
        : Center(
            child: CircularProgressIndicator(
            color: MyCustomTheme.primaryLightColor,
          ));
  }

  void LoadAllAhadeth() async {
    String content = await rootBundle.loadString('assets/content/ahadeth.txt');
    hadethList = content.split("#\r\n");
    setState(() {});
  }

  String returnHadethTitle(int index) {
    lines = hadethList[index].split("\n");
    String title = lines[0];
    lines.removeAt(0);
    return title;
  }
}

class HadethDetails {
  String title;
  List<String> hadethList;
  HadethDetails({required this.title, required this.hadethList});
}
