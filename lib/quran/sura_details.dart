import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_anwar/quran/sura_details_item.dart';
import 'package:provider/provider.dart';

import '../my_theme.dart';
import '../providers/provider.dart';

class SuraDetails extends StatefulWidget {
  static const String Route_Name = 'suraDetails';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    var provider = Provider.of<AppConfigProvider>(context);
    loadFile(args.index);

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
              args.name,
            ),
          ),
          body: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: MyThemeData.goldColor,
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return SuraDetailsItem(text: verses[index], index: index);
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: provider.appTheme == ThemeMode.light
                          ? MyThemeData.goldColor
                          : MyThemeData.yellowColor,
                      thickness: 2,
                    );
                  },
                  itemCount: verses.length),
        ),
      ],
    );
  }

  loadFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = fileContent.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
