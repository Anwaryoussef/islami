import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/RadiosResponse.dart';
import '../my_theme.dart';
import '../providers/provider.dart';


class RadioItem extends StatefulWidget {
  Radios radios;

  AudioPlayer audioPlayer;

  RadioItem({required this.radios, required this.audioPlayer});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Text(
          widget.radios.name ?? '',
          style: TextStyle(
            color: provider.appTheme == ThemeMode.light
                ? MyThemeData.blackColor
                : MyThemeData.whiteColor,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: play,
              icon: Icon(
                Icons.play_circle_outline_outlined,
                color: provider.appTheme == ThemeMode.light
                    ? MyThemeData.goldColor
                    : MyThemeData.yellowColor,
                size: 40,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            IconButton(
              onPressed: pause,
              icon: Icon(
                Icons.pause_circle_outline_outlined,
                color: provider.appTheme == ThemeMode.light
                    ? MyThemeData.goldColor
                    : MyThemeData.yellowColor,
                size: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> play() async {
    await widget.audioPlayer.play(UrlSource(widget.radios.url!));
  }

  Future<void> pause() async {
    await widget.audioPlayer.pause();
  }
}
