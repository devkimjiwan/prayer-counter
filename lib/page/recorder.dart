import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:prayercounter/main.dart';
import 'package:prayercounter/model/goal.dart';
import 'package:provider/provider.dart';

class RecorderPage extends StatelessWidget {
  const RecorderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemGrey3,
        navigationBar: CupertinoNavigationBar(),
        child: Recorder());
  }
}

class Recorder extends StatefulWidget {
  Recorder({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RecordState();
  }
}

class _RecordState extends State<Recorder> {
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;
  String elapsed = "0:00:00.00";

  void start() {
    stopwatch.start();
    timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        elapsed = stopwatch.elapsed.toString().substring(0, 10);
      });
    });
  }

  void stop() {
    stopwatch.stop();
    timer?.cancel();
  }

  void reset() {
    stopwatch.reset();
    setState(() {
      elapsed = '0:00:00.00';
    });
  }

  @override
  void dispose() {
    stopwatch.stop();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          elapsed,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: CupertinoColors.black,
              fontSize: 70),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CupertinoButton(
              onPressed: start,
              child: Text("Start"),
            ),
            CupertinoButton(onPressed: stop, child: Text("Stop")),
            CupertinoButton(onPressed: reset, child: Text("Reset"))
          ],
        ),
        CupertinoButton(
            onPressed: () {
              state.sessions.add(Session(1, 1, stopwatch.elapsed));
              state.notifyListeners();
            },
            child: Text("Save")),
        ...state.sessions.map((e) => Text(e.duration.toString()))
      ],
    ));
  }
}
