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
           'اذاعة القرأن الكريم',
          style: TextStyle(
            color: Colors.black,
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
                Icons.skip_previous,
                color:  Color(0xFFB7935F)

              ),
            ),
            const SizedBox(
              width: 8,
            ),
            IconButton(
              onPressed: pause,
              icon: Icon(
                  Icons.play_arrow_sharp,
                  color: Color(0xFFB7935F)


              ),
            ),

            const SizedBox(
              width: 8,
            ),
            IconButton(
              onPressed: pause,
              icon: Icon(
                Icons.skip_next,
                color: Color(0xFFB7935F)


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
