import 'package:flutter/foundation.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void play() async {
    _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.play(AssetSource('/_assets/music.mp3'));
    notifyListeners();
  }

  void pause() async {
    await _audioPlayer.pause();
    notifyListeners();
  }

  void resume() async {
    await _audioPlayer.resume();
    notifyListeners();
  }

  void stop() async {
    await _audioPlayer.stop();
    notifyListeners();
  }
}

class OnHoverSound {
  final AudioPlayer _onHover = AudioPlayer();
  OnHoverSound() {
    _onHover.setPlayerMode(PlayerMode.lowLatency);
    _onHover.setSource(AssetSource("/_assets/hover.mp3"));
  }
  void play() {
    _onHover.resume();
  }
}
