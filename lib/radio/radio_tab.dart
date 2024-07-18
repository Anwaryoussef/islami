import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:islami_anwar/radio/radio_item.dart';

import '../models/RadiosResponse.dart';


class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  late Future<RadiosResponse> radiosResponseFuture;
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    radiosResponseFuture = getRadios();
    audioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return FutureBuilder<RadiosResponse>(
        future: radiosResponseFuture,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            var radios = snapShot.data?.radios ?? [];
            return Column(
              children: [
                Expanded(
                    flex: 6, child: Image.asset('assets/images/radio.png')),
                Expanded(
                  flex: 4,
                  child: ListView.builder(
                    physics: const PageScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: width,
                        child: Center(
                          child: SizedBox(
                            width: width * .9,
                            child: RadioItem(
                              radios: radios[index],
                              audioPlayer: audioPlayer,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: radios.length,
                  ),
                )
              ],
            );
          } else if (snapShot.hasError) {
            return Center(
              child: Column(
                children: [
                  Text(snapShot.error.toString()),
                  const SizedBox(
                    height: 4,
                  ),
                  IconButton(
                      onPressed: () {
                        radiosResponseFuture = getRadios();
                      },
                      icon: const Icon(Icons.refresh_outlined))
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

Future<RadiosResponse> getRadios() async {

  String baseUrl = 'mp3quran.net';
  try {
    var url = Uri.https(baseUrl, '/api/v3/radios');
    var response = await http.get(url);
    String bodyString = response.body;
    var json = jsonDecode(bodyString);
    var radiosResponse = RadiosResponse.fromJson(json);
    return radiosResponse;
  } catch (error) {
    throw error.toString();
  }
}
