import 'package:flutter/cupertino.dart';
import 'package:prayercounter/model/goal.dart';

class PrayerList extends StatelessWidget {
  final List<Goal> goals;
  late List<CupertinoListTile> items;

  PrayerList(this.goals, {super.key}) {
    items = goals
        .map(
          (e) => CupertinoListTile(
            title: Text(e.title),
            subtitle: Text(e.start.toString()),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection(header: Text("Prayer List"), children: items);
  }
}
