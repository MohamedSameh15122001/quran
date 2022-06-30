import 'package:flutter/material.dart';
import 'package:flutter_application_2/modules/main_screen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final Color mainColor = const Color(0xff181c27);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splashScreen(),
    );
  }

  Widget splashScreen() => SplashScreenView(
        navigateRoute: const MainScreen(),
        duration: 3000,
        imageSize: 120,
        imageSrc: "assets/images/quran.png",
        text: "القرأن الكريم",
        textType: TextType.ScaleAnimatedText,
        textStyle: const TextStyle(
          fontSize: 38.0,
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),
        backgroundColor: mainColor,
      );
}
