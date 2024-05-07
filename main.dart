import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          centerTitle: true,
          title: Text("LUCK GAME"),
          backgroundColor: Colors.lightBlue,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;
  int count = 1;
  String win = "Winner";
  String lose = "Game Over";
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void diceChange() {
      setState(() {
        leftDiceNumber = Random().nextInt(6) + 1;
        rightDiceNumber = Random().nextInt(6) + 1;
        if (leftDiceNumber == rightDiceNumber && count != 4) {
          count++;
          if (count == 4) {
            myController.text = win;
            count = 1;
          }
        }
        else if (leftDiceNumber != rightDiceNumber) {
          count++;
          if (count >= 4) {
            myController.text = lose;
            count = 1;
          }
        }
      });
    };

    return Center(
      child: Column(
        children: [
          Container(
            height: 100,
            margin: EdgeInsets.only(top: 100),
            child: Text(myController.text, style: TextStyle(fontSize: 40)),
          ),
          Container(

            child: Text(count.toString(), style: TextStyle(fontSize: 40)),
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                    child: Image.asset('assets/images/dice$leftDiceNumber.png'),
                    onPressed: () {
                      diceChange();
                    }),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    diceChange();
                  },
                  child: Image.asset('assets/images/dice$rightDiceNumber.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  }