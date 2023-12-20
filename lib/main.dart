import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prayercounter/model/goal.dart';
import 'package:prayercounter/page/home.dart';
import 'package:prayercounter/sample_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(PrayerCounterApp());
}

class PrayerCounterApp extends StatelessWidget {
  PrayerCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(goals: SampleData.goals),
      child: _PrayerCounterHome(),
    );
  }
}

class _PrayerCounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: HomePage(),
      theme: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
        textStyle: GoogleFonts.nanumGothicCoding(
            fontWeight: FontWeight.w700, fontSize: 20),
      )),
    );
  }
}

class AppState extends ChangeNotifier {
  AppState({required this.goals});

  List<Goal> goals;
  List<Session> sessions = <Session>[];
}
