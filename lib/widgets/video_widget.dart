import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:auto_route/auto_route.dart';

class VideoScreen extends StatefulWidget {
  final String? link;

  const VideoScreen({Key? key, this.link}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late final VideoPlayerController videoPlayerController;
  late final ChewieController chewieController;
  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/reviews-24c05.appspot.com/o/Allure%20Academy%20Intro.mp4?alt=media&token=c53bd315-38dd-4a34-b102-abb89ab05d0a');

    // videoPlayerController.setLooping(true);
    videoPlayerController.initialize().then((_) {
      setState(() {
        chewieController = ChewieController(
            videoPlayerController: videoPlayerController,
            autoPlay: true,
            looping: true,
            materialProgressColors: ChewieProgressColors(
              playedColor: const Color.fromRGBO(255, 0, 0, 0.7),
              bufferedColor: const Color.fromRGBO(30, 30, 200, 0.2),
              handleColor: const Color.fromRGBO(200, 200, 200, 1.0),
              backgroundColor: const Color.fromRGBO(200, 200, 200, 0.5),
            ));
      });
      //   setState(() {
      //     videoPlayerController.value.isPlaying
      //         ? videoPlayerController.pause()
      //         : videoPlayerController.play();
      //   });
    });
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accent.withOpacity(.9),
      body: Stack(
        children: [
          InteractiveViewer(
            child: Center(
              child: videoPlayerController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: videoPlayerController.value.aspectRatio,
                      child: Chewie(controller: chewieController),
                    )
                  : spinkit,
            ),
          ),
          Positioned(
              top: 35,
              left: 5,
              child: IconButton(
                icon: const Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  context.router.pop();
                },
              )),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _controller.value.isPlaying
      //           ? _controller.pause()
      //           : _controller.play();
      //     });
      //   },
      //   child: Icon(
      //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
      //   ),
      // ),
    );
  }
}
