import 'dart:async';
import 'package:flutter/material.dart';
import '../cc/helpers/Constants.dart';
import '../cc/sports menu/poseIntro.dart';
import '../cc/sports menu/undoneList.dart';

void main() {
  runApp(const RestTime());
}

class RestTime extends StatefulWidget {
  const RestTime({Key? key}) : super(key: key);

  @override
  State<RestTime> createState() => _RestTimeState();
}

class _RestTimeState extends State<RestTime> {
  int count = 0;
  bool a = false;
  late Timer timer;

  Future<int> _getTime() async {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (count > 0) {
        setState(() {
          count -= 1;
        });
      } else {
        timer.cancel();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PoseIntro()));
      }
    });
    return count;
  }

  @override
  void initState() {
    super.initState();
    count = 5;
    _getTime();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 360,
              height: 360,
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 15.0,
                  style: BorderStyle.solid,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "δΌζ―ζι",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Text(
                    count.toString(),
                    style: TextStyle(fontSize: 80, color: Colors.white),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  iconSize: 90,
                  highlightColor: Colors.yellow,
                  padding: const EdgeInsets.all(0),
                  icon: Icon(Icons.arrow_left, size: 90.0, color: Colors.brown),
                  onPressed: () {
                    debugPrint('Start Timer');
                  },
                ),
                Text(
                  "δΈδΈεεδ½:\n" + UndoneList().getrecord().poseName ,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                IconButton(
                  iconSize: 90,
                  highlightColor: Colors.yellow,
                  padding: const EdgeInsets.all(0),
                  icon:
                      Icon(Icons.arrow_right, size: 90.0, color: Colors.brown),
                  onPressed: () {
                    debugPrint('Start Timer');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

//εθθ³ζ:
//https://medium.com/flutter-taipei/flutter-ε©η¨timerθchangenotifierproviderε―¦ηΎbackground-timer-a761f700b419
