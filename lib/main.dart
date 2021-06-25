import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int first = 1;
  int second = 2;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Fun Dice Game',
                style: TextStyle(fontSize: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/$first.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/$second.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  AssetsAudioPlayer.newPlayer().open(
                    Audio("assets/sounds/dice_roll.mp3"),
                    autoStart: true,
                    showNotification: true,
                  );
                  setState(() {
                    first = Random().nextInt(5);
                    second = Random().nextInt(5);
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(300, 50),
                ),
                child: Text(
                  'Roll',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
