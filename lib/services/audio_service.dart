import 'package:audioplayers/audioplayers.dart';

class AudioService {
  AudioService._();

  static final AudioService instance = AudioService._();

  final AudioPlayer _bgmPlayer = AudioPlayer();
  final AudioPlayer _sfxPlayer = AudioPlayer();

  bool _initialized = false;
  bool _musicStarted = false;
  bool _soundEnabled = true;

  Future<void> init() async {
    if (_initialized) return;

    await _bgmPlayer.setReleaseMode(ReleaseMode.loop);
    await _sfxPlayer.setReleaseMode(ReleaseMode.stop);

    await _bgmPlayer.setVolume(0.35);
    await _sfxPlayer.setVolume(0.9);

    _initialized = true;
  }

  Future<void> startBackgroundMusic() async {
    await init();

    if (!_soundEnabled || _musicStarted) return;

    await _bgmPlayer.play(
      AssetSource('audio/kaden_cook-8-bit-dungeon-251388.mp3'),
    );

    _musicStarted = true;
  }

  Future<void> stopBackgroundMusic() async {
    await _bgmPlayer.stop();
    _musicStarted = false;
  }

  Future<void> pauseBackgroundMusic() async {
    await _bgmPlayer.pause();
  }

  Future<void> resumeBackgroundMusic() async {
    await init();

    if (!_soundEnabled) return;

    await _bgmPlayer.resume();
    _musicStarted = true;
  }

  Future<void> setSoundEnabled(bool enabled) async {
    _soundEnabled = enabled;

    if (!enabled) {
      await _bgmPlayer.pause();
    } else {
      if (_musicStarted) {
        await _bgmPlayer.resume();
      } else {
        await startBackgroundMusic();
      }
    }
  }

  Future<void> playClick() async {
    if (!_soundEnabled) return;
    await init();

    try {
      await _sfxPlayer.stop();
      await _sfxPlayer.play(AssetSource('audio/ui_click.wav'));
    } catch (_) {}
  }

  Future<void> playContinue() async {
    if (!_soundEnabled) return;
    await init();

    try {
      await _sfxPlayer.stop();
      await _sfxPlayer.play(AssetSource('audio/ui_continue.wav'));
    } catch (_) {}
  }

  Future<void> dispose() async {
    await _bgmPlayer.dispose();
    await _sfxPlayer.dispose();
  }
}