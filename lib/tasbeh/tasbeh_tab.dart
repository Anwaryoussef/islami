import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../my_theme.dart';
import '../providers/provider.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter = 0;

  List<String> tasbeh = [
    'سبحان الله',
    'الحمد لله',
    'لا اله الا الله',
    'الله اكبر',
    'لا حول ولا قوه الا بالله',
  ];

  int index = 0;

  double angle = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                provider.appTheme == ThemeMode.light
                    ? Image.asset('assets/images/head_of_sebha.png')
                    : Image.asset('assets/images/head_of_sebha_dark.png'),
                GestureDetector(
                  onTap: () {
                    onClicked();
                  },
                  child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .07),
                      child: Transform.rotate(
                          angle: angle,
                          child: provider.appTheme == ThemeMode.light
                              ? Image.asset('assets/images/body_of_sebha.png')
                              : Image.asset(
                                  'assets/images/body_of_sebha_dark.png'))),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              AppLocalizations.of(context)!.numberTasbeh,
              style: TextStyle(
                color: provider.appTheme == ThemeMode.light
                    ? MyThemeData.darkColor
                    : MyThemeData.whiteColor,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: provider.appTheme == ThemeMode.light
                  ? MyThemeData.goldColor
                  : MyThemeData.darkColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$counter',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: provider.appTheme == ThemeMode.light
                    ? MyThemeData.darkColor
                    : MyThemeData.whiteColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
              color: provider.appTheme == ThemeMode.light
                  ? MyThemeData.goldColor
                  : MyThemeData.yellowColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${tasbeh[index]}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: provider.appTheme == ThemeMode.light
                      ? MyThemeData.whiteColor
                      : MyThemeData.darkColor),
            ),
          ),
        ],
      ),
    );
  }

  void onClicked() {
    counter++;
    if (counter % 33 == 0) {
      index++;
    }
    if (index == tasbeh.length) {
      index = 0;
    }
    angle += 2 / 33;
    setState(() {});
  }
}
