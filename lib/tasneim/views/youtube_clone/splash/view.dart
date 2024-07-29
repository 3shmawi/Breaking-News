import 'package:c3/tasneim/views/youtube_clone/layout/view.dart';
import 'package:flutter/material.dart';

class YoutubeSplashScreen extends StatefulWidget {
  const YoutubeSplashScreen({super.key});

  @override
  State<YoutubeSplashScreen> createState() => _YoutubeSplashScreenState();
}

class _YoutubeSplashScreenState extends State<YoutubeSplashScreen> {
  bool isDark = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => YoutubeLayoutView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            setState(() {});
            isDark = !isDark;
          },
          icon: Icon(
            isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              'lib/tasneim/assets/youtube.png',
              height: 400,
              width: 400,
            ),
            const Spacer(),
            Text(
              "@CopyWrite Tasneim",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
