import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/constans/audio_list.dart';
import 'package:flutter_application_2/constans/constans.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    setupPlaylist();
  }

  void setupPlaylist() async {
    await audioPlayer.open(
      Playlist(audios: audioList),
      autoStart: false,
      loopMode: LoopMode.playlist,
    );
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mainColor,
      // bottomNavigationBar: Container(
      //   height: screenHeight * 0.1,
      //   color: Colors.white,
      //   child: ClipRRect(
      //     borderRadius: const BorderRadius.only(
      //       topLeft: Radius.circular(20),
      //       topRight: Radius.circular(20),
      //     ),
      //     child: bottomNavigationBar(),
      //   ),
      // ),
      body: audioPlayer.builderRealtimePlayingInfos(
        builder: (context, realtimePlayingInfo) {
          // ignore: unnecessary_null_comparison
          if (realtimePlayingInfo != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // playlistImage(),
                // SizedBox(
                //   height: screenHeight * 0.02,
                // ),
                playlistTitle(),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                playButton(),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                playlist(realtimePlayingInfo),
                bottomPlayContainer(realtimePlayingInfo),
              ],
            );
          } else {
            return Column(
              children: const [],
            );
          }
        },
      ),
    );
  }
}
