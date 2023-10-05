import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  final _player = AudioPlayer();

  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  double _volume = 20.0;
  SongsEnum _currentSong = SongsEnum.see;

  @override
  void initState() {
    _init();
    setAudio();
    super.initState();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _init() {
    _player.onPlayerStateChanged.listen((event) {
      setState(() {
        _isPlaying = event == PlayerState.playing;
      });
    });

    _player.onDurationChanged.listen((event) {
      setState(() {
        _duration = event;
      });
    });

    _player.onPositionChanged.listen((event) {
      setState(() {
        _position = event;
      });
    });
  }

  Future setAudio() async {
    await _player.setVolume(0.2);
    await _player.setSource(AssetSource(SongsEnum.see.value));
  }

  void _playOrStop() => _isPlaying ? _player.pause() : _player.resume();

  void nextSong() async {
    _player.pause();
    if (_currentSong == SongsEnum.fractions) {
      setState(() {
        _currentSong = SongsEnum.see;
      });
      await _player.setSource(AssetSource(SongsEnum.see.value));
      _player.resume();
      return;
    }

    setState(() {
      _currentSong = SongsEnum.fractions;
    });
    await _player.setSource(AssetSource(SongsEnum.fractions.value));
    _player.resume();
  }

  void setVolume(double value) async {
    await _player.setVolume(value / 100);
    setState(() {
      _volume = value;
    });
  }

  @override
  Widget build(BuildContext context) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        height: 50,
        color: Colors.redAccent,
        child: Row(
          children: [
            Expanded(child: _leftContent()),
            const SizedBox(width: 60),
            Expanded(child: _rightContent()),
          ],
        ),
      );

  Widget _leftContent() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _playButton(),
          const SizedBox(width: 8),
          _nextButton(),
          const SizedBox(width: 8),
          Text(
            formatDuration(_duration - _position),
            style: const TextStyle(color: Colors.white),
          ),
        ],
      );

  Widget _rightContent() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            child: _slider(),
          ),
        ],
      );

  Widget _playButton() => IconButton(
        onPressed: _playOrStop,
        color: Colors.white,
        icon: _icon,
      );

  Widget _nextButton() => IconButton(
        onPressed: nextSong,
        color: Colors.white,
        icon: const Icon(Icons.skip_next_rounded),
      );

  Widget _slider() => Slider(
        activeColor: Colors.white,
        inactiveColor: Colors.white,
        min: 0,
        max: 100,
        value: _volume,
        onChanged: ((value) async {
          setVolume(value);
        }),
      );

  String formatDuration(Duration duration) =>
      '${duration.inMinutes.remainder(60)}:${duration.inSeconds.remainder(60)}';

  Widget get _icon => Icon(_isPlaying ? Icons.pause : Icons.play_arrow);
}

class SongsEnum {
  const SongsEnum._(this.value);

  final String value;

  static SongsEnum get fractions => const SongsEnum._('songs/fractions.wav');
  static SongsEnum get see => const SongsEnum._('songs/see.wav');

  SongsEnum fromString(String value) {
    final map = {
      'songs/fractions.wav': fractions,
      'songs/see.wav': see,
    };

    if (map[value] == null) see;

    return map[value]!;
  }
}
