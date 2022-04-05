import 'dart:async';

import 'package:flutter/material.dart';

class ElapsedTime extends StatefulWidget {
  const ElapsedTime({Key? key}) : super(key: key);

  @override
  _ElapsedTimeState createState() => _ElapsedTimeState();
}

class _ElapsedTimeState extends State<ElapsedTime> {
  late Stopwatch _stopwatch;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    _stopwatch.start();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String formatTime(int milliseconds) {
  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');

  return "$hours:$minutes:$seconds";
}

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(formatTime(_stopwatch.elapsedMilliseconds),
                style: const TextStyle(fontSize: 36.0)),
          ],
        ),
    );
  }
}