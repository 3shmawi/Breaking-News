import 'package:c3/mostafa_mohamed_l2/youtube_clone/home/widgets.dart';
import 'package:flutter/material.dart';

import '../components/functions.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  int calculateCrossAxisCount(BuildContext context) {
    final screenWidth = Dimensions.screenWidth(context);

    if (screenWidth > 1200) {
      return 4;
    } else if (screenWidth > 768) {
      return 3;
    } else {
      return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: calculateCrossAxisCount(context),
          mainAxisSpacing: Dimensions.heightPercentage(context, 1),
          crossAxisSpacing: Dimensions.widthPercentage(context, 1),
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) => const YoutubeItem(),
        itemCount: 10,
      ),
    );
  }
}
