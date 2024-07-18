import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/provider.dart';
import 'hadeth_details_item.dart';
import 'hadeth_tab.dart';

class HadethDetails extends StatelessWidget {
  static const String Route_Name = 'hadethDetails';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as Hadeth;
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.appTheme==ThemeMode.light ? Image.asset(
          'assets/images/background_image.png',
          fit: BoxFit.fill,
          width: double.infinity,
        )
            :
        Image.asset(
          'assets/images/dark_bg.png',
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('${args.title}',
            ),
          ),
          body: HadethDetailsItem( content: args.content),
        ),
      ],
    );
  }
}
