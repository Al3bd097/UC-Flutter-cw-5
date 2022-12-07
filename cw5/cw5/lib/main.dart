// ignore_for_file: prefer_const_constructors

import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  String name1 = "assets/images/paper.png";
  String name2 = "assets/images/rock.png";
  int counter1 = 0;
  int counter2 = 0;
  String winner = "...";

  void play() {
    var n = Random().nextInt(3) + 1;
    setState(() {
      if (n == 1) {
        name1 = "assets/images/rock.png";
        name2 = "assets/images/paper.png";
        counter2 += 1;
      } else if (n == 2) {
        name1 = "assets/images/paper.png";
        name2 = "assets/images/rock.png";
        counter1 += 1;
      } else {
        name1 = "assets/images/scissor.png";
        name2 = "assets/images/scissor.png";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Rock Paper Scissors"),
            backgroundColor: Colors.amber,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          "${name1}",
                          width: 150,
                          height: 150,
                        ),
                        Text(
                          "Player 1",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text("Points: ${counter1}")
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          "${name2}",
                          width: 130,
                          height: 150,
                        ),
                        Text(
                          "Player 2",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text("Points: ${counter2}"),
                      ],
                    )
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    play();
                    setState(() {
                      if (counter1 == 5) {
                        winner = "Player 1";
                        counter1 = 0;
                        counter2 = 0;
                      } else if (counter2 == 5) {
                        winner = "Player 2";
                        counter1 = 0;
                        counter2 = 0;
                      }
                    });
                  },
                  child: Text("Play")),
              Text("Winner is: ${winner}")
            ],
          )),
    );
  }
}
