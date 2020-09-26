import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(Xylophone());
}

class Xylophone extends StatelessWidget {
  static const keyboards = ['1', '2', '3', '4', '5', '6', '7'];
  static const colorMap = {
    '1': Colors.red,
    '2': Colors.orange,
    '3': Colors.yellow,
    '4': Colors.green,
    '5': Colors.teal,
    '6': Colors.blue,
    '7': Colors.purple,
  };
  static final audioplayer = AudioCache();

  Xylophone() {
    audioplayer.loadAll([
      'note1.wav',
      'note2.wav',
      'note3.wav',
      'note4.wav',
      'note5.wav',
      'note6.wav',
      'note7.wav',
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: keyboards.fold([], (acc, keyboard) {
              acc.add(Expanded(
                child: FlatButton(
                  child: null,
                  color: colorMap[keyboard],
                  onPressed: () {
                    audioplayer.play('note$keyboard.wav');
                  },
                ),
              ));

              return acc;
            }),
          ),
        ),
      ),
    );
  }
}
