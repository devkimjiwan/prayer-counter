class Goal {
  final int id;
  String title;
  Duration target;
  DateTime start;
  DateTime deadline;

  Goal(this.id,
      {required this.title,
      required this.target,
      required this.start,
      required this.deadline});
}

class Session {
  final int goalID;
  final int index; // this session is (index)th of the goal.
  Duration duration;

  Session(this.goalID, this.index, this.duration);
}
