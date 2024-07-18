import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../my_theme.dart';
import '../providers/provider.dart';

class HadethDetailsItem extends StatelessWidget {
List<String> content ;
HadethDetailsItem({required this.content});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Text('$content',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: provider.appTheme == ThemeMode.light
                      ? MyThemeData.blackColor
                      : MyThemeData.yellowColor),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
