import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gadwelha/constanc.dart';
import 'package:gadwelha/pages/home.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/gadwlha_logo.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });

    Future.delayed(Duration(seconds: 5), () {
      _opacity = 1.0;
      setState(() {});
    });

    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double? _opacity = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 600,
            height: 240,
            child: VideoPlayer(_controller),
          ),
          AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: _opacity!,
            child: Text(
              'إنـــسي تنــــسي',
              style: TextStyle(color: Constanc.kColor, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
