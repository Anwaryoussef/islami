import 'package:flutter/material.dart';
import 'package:islami_anwar/providers/provider.dart';
import 'package:islami_anwar/quran/sura_details.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'hadeth/hadeth_details.dart';
import 'home/home.dart';
import 'my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    getSharedPref();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.Route_Name: (context) => HomeScreen(),
        SuraDetails.Route_Name: (context) => SuraDetails(),
        HadethDetails.Route_Name: (context) => HadethDetails(),
      },
      initialRoute: HomeScreen.Route_Name,
      theme: MyThemeData.lightMode,
      darkTheme: MyThemeData.darkMode,
      themeMode: provider.appTheme,
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }

  void getSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    String language = prefs.getString('lang') ?? 'en';
    provider.appLanguage = language;
    if (prefs.getString('theme') == 'dark') {
      provider.appTheme = ThemeMode.dark;
    } else {
      provider.appTheme = ThemeMode.light;
    }
  }
}
