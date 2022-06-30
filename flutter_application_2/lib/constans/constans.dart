import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constans/audio_list.dart';
import 'package:percent_indicator/percent_indicator.dart';

//vars
final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
double screenHeight = 0;
double screenWidth = 0;
const Color mainColor = Color(0xff181c27);
const Color inactiveColor = Color(0xff5d6169);
//vars

// Widget bottomNavigationBar() {
//   return BottomNavigationBar(
//     currentIndex: currentIndex,
//     onTap: (index) {
//       currentIndex = index;
//     },
//     items: const <BottomNavigationBarItem>[
//       BottomNavigationBarItem(
//         icon: Icon(
//           Icons.home,
//         ),
//         label: 'Home',
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(
//           Icons.favorite,
//         ),
//         label: 'Love',
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(
//           Icons.developer_mode_outlined,
//         ),
//         label: 'about us',
//       ),
//       // BottomNavigationBarItem(
//       //   icon: Icon(
//       //     Icons.search,
//       //   ),
//       //   label: 'Search',
//       // ),
//       // BottomNavigationBarItem(
//       //   icon: Icon(
//       //     Icons.library_music_rounded,
//       //   ),
//       //   label: 'Library',
//       // ),
//       // BottomNavigationBarItem(
//       //   icon: Icon(
//       //     Icons.local_fire_department_rounded,
//       //   ),
//       //   label: 'Hotlist',
//       // ),
//     ],
//     type: BottomNavigationBarType.fixed,
//     backgroundColor: mainColor,
//     selectedItemColor: Colors.white,
//     unselectedItemColor: inactiveColor,
//     iconSize: screenWidth * 0.07,
//   );
// }

// Widget playlistImage() {
//   return SizedBox(
//     height: screenHeight * 0.25,
//     width: screenHeight * 0.25,
//     child: ClipRRect(
//       borderRadius: BorderRadius.circular(20),
//       child: Image.asset(
//         'assets/main_image.jpg',
//         fit: BoxFit.cover,
//       ),
//     ),
//   );
// }

Widget playlistTitle() {
  return const Text(
    'القرأن الكريم',
    style: TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget playButton() {
  return SizedBox(
    width: screenWidth * 0.25,
    child: TextButton(
      onPressed: () => audioPlayer.playlistPlayAtIndex(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.play_circle_outline_rounded,
            color: mainColor,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Play',
            style: TextStyle(
              color: mainColor,
            ),
          ),
        ],
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => Colors.white,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
  );
}

Widget playlist(RealtimePlayingInfos realtimePlayingInfos) {
  return Container(
    height: screenHeight * 0.485,
    alignment: Alignment.bottomLeft,
    child: ListView.builder(
      itemBuilder: (context, index) {
        return playlistItem(index);
      },
      shrinkWrap: true,
      itemCount: audioList.length,
    ),
  );
}

Widget playlistItem(int index) {
  return InkWell(
    onTap: () => audioPlayer.playlistPlayAtIndex(index),
    splashColor: Colors.transparent,
    highlightColor: mainColor,
    child: SizedBox(
      height: screenHeight * 0.07,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Row(
          children: [
            Text(
              '0${index + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.04,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    audioList[index].metas.title!,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.005,
                  ),
                  Text(
                    audioList[index].metas.artist!,
                    style: const TextStyle(
                      fontSize: 13,
                      color: inactiveColor,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.menu_rounded,
              color: inactiveColor,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget bottomPlayContainer(RealtimePlayingInfos realtimePlayingInfos) {
  return Container(
    height: screenHeight * 0.26,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        top: 8.0,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: screenHeight * 0.08,
                width: screenHeight * 0.08,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    realtimePlayingInfos.current!.audio.audio.metas.image!.path,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.03,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      realtimePlayingInfos.current!.audio.audio.metas.title!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    Text(
                      realtimePlayingInfos.current!.audio.audio.metas.artist!,
                      style: const TextStyle(
                        color: mainColor,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          slider(realtimePlayingInfos),
          // linearProgressBar(
          //   realtimePlayingInfos.currentPosition,
          //   realtimePlayingInfos.duration,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: screenWidth * 0.05,
              ),
              getTimeText(realtimePlayingInfos.currentPosition),
              const Spacer(),
              IconButton(
                  icon: const Icon(Icons.skip_previous_rounded),
                  onPressed: () => audioPlayer.previous(),
                  iconSize: 50,
                  color: mainColor),
              IconButton(
                onPressed: () => audioPlayer.playOrPause(),
                icon: Icon(
                  realtimePlayingInfos.isPlaying
                      ? Icons.pause_circle_rounded
                      : Icons.play_circle_fill_rounded,
                ),
                iconSize: screenHeight * 0.07,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                color: mainColor,
              ),
              IconButton(
                icon: const Icon(Icons.skip_next_rounded),
                onPressed: () => audioPlayer.next(),
                iconSize: 50,
                color: mainColor,
              ),
              const Spacer(),
              getTimeText(realtimePlayingInfos.duration),
              SizedBox(
                width: screenWidth * 0.05,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget getTimeText(Duration seconds) {
  return Text(
    transformString(seconds.inSeconds),
    style: const TextStyle(color: mainColor),
  );
}

String transformString(int seconds) {
  String minuteString =
      '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
  String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
  return '$minuteString:$secondString'; // Returns a string with the format mm:ss
}

Widget linearProgressBar(Duration currentPosition, Duration duration) {
  return Padding(
    padding: const EdgeInsets.only(left: 40, right: 40),
    child: LinearPercentIndicator(
      width: 300,
      backgroundColor: mainColor,
      percent: currentPosition.inSeconds / duration.inSeconds,
      progressColor: Colors.grey,
    ),
  );
}

//------------
class CustomTrackShape extends RoundedRectSliderTrackShape {
  /// Removes side padding of slider
  /// Credit goes to @clocksmith, https://github.com/flutter/flutter/issues/37057
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

Widget slider(RealtimePlayingInfos realtimePlayingInfos) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
    child: Stack(
      children: [
        Positioned.fill(
            child: Container(
          height: screenHeight * 0.03,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white
          ], stops: [
            0.0,
            0.55,
            0.55,
            1.0
          ], end: Alignment.bottomCenter, begin: Alignment.topCenter)),
        )),
        SliderTheme(
          data: SliderThemeData(
              trackShape: CustomTrackShape(),
              thumbColor: mainColor,
              activeTrackColor: Colors.teal,
              inactiveTrackColor: mainColor,
              overlayColor: Colors.transparent),
          child: Slider.adaptive(
            value: realtimePlayingInfos.currentPosition.inSeconds.toDouble(),
            max: realtimePlayingInfos.duration.inSeconds.toDouble() + 3,
            min: -3,
            onChanged: (value) {
              if (value <= 0) {
                audioPlayer.seek(
                  const Duration(seconds: 0),
                );
              } else if (value >= realtimePlayingInfos.duration.inSeconds) {
                audioPlayer.seek(realtimePlayingInfos.duration);
              } else {
                audioPlayer.seek(
                  Duration(
                    seconds: value.toInt(),
                  ),
                );
              }
            },
          ),
        ),
      ],
    ),
  );
}
