import 'package:audioplayers/audioplayers.dart';

class PlaySound {
  static AudioPlayer? _player;

  static void play_sound({required String soundSource}) async {
    if (_player != null) {
      await _player!.stop();
    }
    _player = AudioPlayer();
    await _player!.play((AssetSource(soundSource)));
  }

  static void stop_sound({required String soundSource}) async {
    if (_player != null) {
      await _player!.stop();
      _player = null; // استخدامها مرة أخرى في المستقبل
    }
  }
}
