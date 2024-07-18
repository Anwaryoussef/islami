import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../my_theme.dart';
import '../providers/provider.dart';
import 'hadeth_details.dart';
import 'hadeth_tab.dart';

class HadethItem extends StatelessWidget {
  Hadeth hadeth;

  HadethItem({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(HadethDetails.Route_Name,
            arguments: Hadeth(title: hadeth.title, content: hadeth.content));
      },
      child: Text(
        hadeth.title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: provider.appTheme == ThemeMode.light
                ? MyThemeData.blackColor
                : MyThemeData.whiteColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
