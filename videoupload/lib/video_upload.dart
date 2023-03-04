import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoUploadScreen extends StatefulWidget {
  const VideoUploadScreen({super.key});

  @override
  State<VideoUploadScreen> createState() => _VideoUploadScreenState();
}

class _VideoUploadScreenState extends State<VideoUploadScreen> {
  File? video;
  VideoPlayerController? videocontoller;

  VideoPlayerController? controller;
  String dataSource = "";
//From GALLERY
  Future<void> pickvideofromgallery() async {
    final videopicked =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (videopicked != null) {
      video = File(videopicked.path);
      videocontoller = VideoPlayerController.file(video!)
        ..initialize().then((_) {
          setState(() {});
          videocontoller!.play();
          videocontoller!.setLooping(true);
        });
    }
  }

  //FROM CAMERA

  Future<void> pickvideofromcamera() async {
    final videopicked = await ImagePicker().pickVideo(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.rear,
        maxDuration: const Duration(seconds: 60));

    if (videopicked != null) {
      video = File(videopicked.path);
      videocontoller = VideoPlayerController.file(video!)
        ..initialize().then((_) {
          setState(() {});
          videocontoller!.play();
          videocontoller!.setLooping(true);
        });
    }
  }

//for network image
  @override
  void initState() {
    super.initState();
    // controller = VideoPlayerController.network(dataSource)..initialize().then((_) => setState(){});
    controller = VideoPlayerController.network(dataSource)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    videocontoller!.dispose();
    controller!.dispose();

    super.dispose();
  }

  // late VideoPlayerController _controller;
  // late Future<void> _video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Video Upload App')),
        backgroundColor: const Color.fromARGB(255, 6, 153, 153),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            video == null
                ? const SizedBox(
                    height: 400,
                    width: 900,
                    child: Placeholder(),
                  )
                : ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxHeight: 490, maxWidth: 500),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                        videocontoller!.value.isPlaying
                            ? videocontoller!.pause()
                            : videocontoller!.play();
                      },
                      child: AspectRatio(
                        aspectRatio: videocontoller!.value.aspectRatio,
                        child: Stack(children: [
                          VideoPlayer(videocontoller!),
                          Center(
                            child: videocontoller!.value.isPlaying
                                ? const SizedBox()
                                : const SizedBox.square(
                                    dimension: 90,
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: Colors.black,
                                    )),
                          )
                        ]),
                      ),
                    ),
                  ),
            const SizedBox(
              height: 26,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  pickvideofromgallery();
                },
                style: ButtonStyle(
                  minimumSize: const MaterialStatePropertyAll(Size(220, 50)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.yellow),
                ),
                icon: const SizedBox.square(
                  dimension: 35,
                  child: Icon(Icons.picture_in_picture_sharp),
                ),
                label: const Text(
                  'Pick Video from Gallery',
                  style: TextStyle(fontSize: 20),
                )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  pickvideofromcamera();
                },
                style: ButtonStyle(
                  minimumSize: const MaterialStatePropertyAll(Size(220, 50)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor: const MaterialStatePropertyAll(
                      Color.fromARGB(255, 6, 153, 153)),
                ),
                icon: const SizedBox.square(
                  dimension: 35,
                  child: Icon(Icons.video_camera_back),
                ),
                label: const Text(
                  'Record Video from Camera',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
