import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../my_theme.dart';
import '../providers/provider.dart';

class SuraDetailsItem extends StatelessWidget {
  String text ;
  int index ;
  SuraDetailsItem({required this.text , required this.index});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: provider.appTheme == ThemeMode.light ? MyThemeData.blackColor:MyThemeData.yellowColor
      ),
      textAlign: TextAlign.center,
    );
  }
}
