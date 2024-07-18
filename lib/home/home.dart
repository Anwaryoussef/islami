import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../hadeth/hadeth_tab.dart';
import '../my_theme.dart';
import '../providers/provider.dart';
import '../quran/quran_tab.dart';
import '../radio/radio_tab.dart';
import '../setting/setting_tab.dart';
import '../tasbeh/tasbeh_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String Route_Name = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.appTheme == ThemeMode.light
            ? Image.asset(
                'assets/images/background_image.png',
                fit: BoxFit.fill,
                width: double.infinity,
              )
            : Image.asset(
                'assets/images/dark_bg.png',
                fit: BoxFit.fill,
                width: double.infinity,
              ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.islami,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: provider.appTheme == ThemeMode.light
                    ? MyThemeData.goldColor
                  : MyThemeData.darkColor,
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                currentIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage('assets/images/quran.png'),
                    ),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage('assets/images/ic_hadeth.png'),
                    ),
                    label: AppLocalizations.of(context)!.hadeth),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage('assets/images/ic_radio.png'),
                    ),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage('assets/images/ic_sebha.png'),
                    ),
                    label: AppLocalizations.of(context)!.sebha),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.setting),
              ],
            ),
          ),
          body: tabs[currentIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    RadioTab(),
    TasbehTab(),
    SettingTab()
  ];
}
