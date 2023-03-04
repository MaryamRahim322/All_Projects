import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class NetworkVideoScreen extends StatefulWidget {
  const NetworkVideoScreen({super.key});

  @override
  State<NetworkVideoScreen> createState() => _NetworkVideoScreenState();
}

class _NetworkVideoScreenState extends State<NetworkVideoScreen> {
  VideoPlayerController? controller;
  String dataSource = "https://www.pexels.com/video/autumn-season-1580455/";

  @override
  void initState() {
    super.initState();
    // controller = VideoPlayerController.network(dataSource)..initialize().then((_) => setState(){});
    controller = VideoPlayerController.network(dataSource)
      ..initialize().then((_) {
        setState(() {});
      });
    controller!.play();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Network Video')),
      body: Column(
        children: [
          controller!.value.isInitialized
              ? AspectRatio(
                  aspectRatio: controller!.value.aspectRatio,
                  child: VideoPlayer(controller!),
                )
              : const SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
          FloatingActionButton(
            onPressed: () {
              if (controller!.value.isPlaying) {
                controller!.pause();
              } else {
                controller!.play();
              }
            },
            child: Icon(
                controller!.value.isPlaying ? Icons.pause : Icons.play_arrow),
          )
        ],
      ),
    );
  }
}
