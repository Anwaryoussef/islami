import 'package:flutter/material.dart';
import 'package:islami_anwar/quran/sura_details.dart';

import '../../my_theme.dart';

class SuraItem extends StatelessWidget {
  String text;

  int index;

  SuraItem({required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetails.Route_Name,
            arguments: SuraDetailsArgs(name: text, index: index));
      },
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
