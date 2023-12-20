import 'package:flutter/cupertino.dart';
import 'package:prayercounter/page/recorder.dart';
import 'package:prayercounter/model/goal.dart';
import 'package:prayercounter/widget/prayer_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final goals = <Goal>[
    Goal(1,
        title: "pray to EV red",
        target: Duration(hours: 40),
        start: DateTime.now(),
        deadline: DateTime(2024, 3, 16)),
    Goal(2,
        title: "pray to EV my family",
        target: Duration(hours: 70),
        start: DateTime(2024, 3, 16),
        deadline: DateTime(2025, 1, 1))
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(),
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
              PrayerList(goals),
              CupertinoButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => RecorderPage(),
                    ),
                  );
                },
                child: const Text("Start Recording"),
              )
            ])));
  }
}
