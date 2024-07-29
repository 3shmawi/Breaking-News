import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetailsView extends StatefulWidget {
  const VideoDetailsView(this.item, {super.key});

  final Map<String, dynamic> item;

  @override
  State<VideoDetailsView> createState() => _VideoDetailsViewState();
}

class _VideoDetailsViewState extends State<VideoDetailsView> {
  late final YoutubePlayerController _controller;

  _initializeVideo() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.item["videoId"],
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item["title"]),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          Icon(Icons.share, color: Colors.white),
        ],
      ),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
        onReady: () {
          // _controller.addListener(listener);
        },
      ),
    );
  }

  //get youtube video id
//https://www.youtube.com/watch?v=yjsN2Goe_po
//https://youtu.be/-f217L2m8qY?si=H32CLRVeTv2v6JVn
}
