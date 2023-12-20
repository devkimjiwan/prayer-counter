import 'package:prayercounter/model/goal.dart';

class SampleData {
  static List<Goal> goals = [
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
}
