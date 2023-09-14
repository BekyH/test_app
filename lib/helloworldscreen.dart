import 'dart:math';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Helloworldscreen extends StatefulWidget {
  const Helloworldscreen({Key? key}) : super(key: key);

  @override
  _HelloworldscreenState createState() => _HelloworldscreenState();
}

class _HelloworldscreenState extends State<Helloworldscreen> {
  Color backgroundColor = Colors.white;
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream
        .listen((event) {}, onError: (Object e, StackTrace stackTrace) {});

    try {
      await _player
          .setAudioSource(AudioSource.asset("assets/music/background.mp3"));
      await _player.play();
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  void changeBackgroundColor() {
    const int max = 256;
    const double opacity = 0.1;

    setState(() {
      final random = Random();
      backgroundColor = Color.fromRGBO(random.nextInt(max), random.nextInt(max),
          random.nextInt(max), opacity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeBackgroundColor,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        color: backgroundColor,
        child: const Center(
          child: Text(
            'Hello there',
            style: TextStyle(fontSize: 24,decoration: TextDecoration.none),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
