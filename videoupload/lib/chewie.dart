import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class ChewieScreen extends StatefulWidget {
  const ChewieScreen({super.key});

  @override
  State<ChewieScreen> createState() => _ChewieScreenState();
}

class _ChewieScreenState extends State<ChewieScreen> {
  late VideoPlayerController controller;
  ChewieController? chewieController;

  Future<void> loadVideoPlayer() async {
    controller = VideoPlayerController.network(
        'https://www.pexels.com/video/autumn-season-1580455/');
    await Future.wait([controller.initialize()]);
  }

  @override
  void initState() {
    super.initState();
    loadVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
