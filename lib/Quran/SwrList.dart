import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/MyCustomTheme.dart';
import 'package:islami_app/Providers/app_config_provider.dart';
import 'package:islami_app/Quran/quran_screen.dart';
import 'package:provider/provider.dart';

class SwrList extends StatefulWidget{
  @override
  State<SwrList> createState() => _SwrListState();
}

class _SwrListState extends State<SwrList> {
  var numberOfVersesEachSurah=[];
  List<String> lines =[];
  List<String> ELSWR =[
    "الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
    ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
    ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
    ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
    ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
    ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
    ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
    ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
    ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
    "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"
  ];

  void LoadAllSwr()async {
    for (int i = 0; i < ELSWR.length; i++) {
      String content = await rootBundle.loadString('assets/content/${i + 1}.txt');
      setState(() {
        lines = content.split("\n");
        numberOfVersesEachSurah.add(lines.length);

      });
    }
  } /// this function to calculate the number of verses for each surah

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if(numberOfVersesEachSurah.isEmpty){
      LoadAllSwr();
    } /// to avoid recursion

    return numberOfVersesEachSurah.length == ELSWR.length? Expanded(

      child: ListView.builder(itemBuilder: (context,index){

        return IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(flex: 5,child: InkWell(child: Text("${ELSWR[index]}",textAlign: TextAlign.center ,style: provider.appTheme == ThemeMode.dark ? MyCustomTheme().boldMediumText.copyWith(color: MyCustomTheme.whiteColor):MyCustomTheme().boldMediumText),
                  onTap: (){
                  Navigator.of(context).pushNamed(ayat_screen.routeName,arguments:
                  SuraDetails(Name: ELSWR[index], index: index));}),),
              Expanded(child: VerticalDivider(color: provider.appTheme == ThemeMode.dark ? MyCustomTheme.yellowColor :MyCustomTheme.primaryLightColor,thickness: 3,)),
              Expanded(flex: 5,child: Text("${numberOfVersesEachSurah[index]}",textAlign: TextAlign.center ,style: provider.appTheme == ThemeMode.dark ? MyCustomTheme().boldMediumText.copyWith(color: MyCustomTheme.whiteColor):MyCustomTheme().boldMediumText)),

            ],
          ),
        );
      },itemCount: ELSWR.length,),
    ):
    Center(child: CircularProgressIndicator(color: MyCustomTheme.primaryLightColor,))
    ;

  }
}
class SuraDetails {
  String Name;
  int index;
  SuraDetails({required this.Name,required this.index});
}
