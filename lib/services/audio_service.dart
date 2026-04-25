import 'package:audioplayers/audioplayers.dart';

class AudioService {
  AudioService._();

  static final AudioService instance = AudioService._();

  final AudioPlayer _player = AudioPlayer();
  bool _isReady = false;

  Future<void> _ensureReady() async {
    if (_isReady) return;
    await _player.setReleaseMode(ReleaseMode.stop);
    _isReady = true;
  }

  Future<void> _play(String assetPath) async {
    try {
      await _ensureReady();
      await _player.stop();
      await _player.play(AssetSource(assetPath));
    } catch (_) {
      // Ignore missing audio errors during development.
    }
  }

  Future<void> playClick() => _play('audio/ui_click.wav');

  Future<void> playContinue() => _play('audio/ui_continue.wav');
}