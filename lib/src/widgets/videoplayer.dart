import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';

class Videoplayer extends StatelessWidget {
  final String link;
  const Videoplayer({Key? key, required this.link}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    late final PodPlayerController controller;
    controller = PodPlayerController(
        playVideoFrom: PlayVideoFrom.youtube(link),
        podPlayerConfig: const PodPlayerConfig(
            autoPlay: false,
            isLooping: false,
            videoQualityPriority: [720, 360]))
      ..initialise();
    return PodVideoPlayer(
      controller: controller,
      videoThumbnail: const DecorationImage(
        image: AssetImage('assets/icons/blancos/iconlogo.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}
