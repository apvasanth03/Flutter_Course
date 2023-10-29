import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildKey(color: Colors.red, soundNum: 1),
            buildKey(color: Colors.orange, soundNum: 2),
            buildKey(color: Colors.yellow, soundNum: 3),
            buildKey(color: Colors.green, soundNum: 4),
            buildKey(color: Colors.teal, soundNum: 5),
            buildKey(color: Colors.blue, soundNum: 6),
            buildKey(color: Colors.purple, soundNum: 7),
          ],
        )),
      ),
    );
  }

  Future<void> playSound({required String name}) async {
    final player = AudioPlayer();
    await player.setSource(AssetSource(name));
    await player.resume();
  }

  Widget buildKey({required Color color, required int soundNum}) {
    Widget keyWidget = Expanded(
      child: TextButton(
        onPressed: () async {
          await playSound(name: 'note$soundNum.wav');
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(color),
        ),
        child: SizedBox.shrink(),
      ),
    );
    return keyWidget;
  }
}
