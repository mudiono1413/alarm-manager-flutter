import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';

class Seconds extends StatefulWidget {
  Seconds();
  @override
  _SecondsState createState() => _SecondsState();
}



class _SecondsState extends State<Seconds> {
  @override
  void printHello() {
  final DateTime now = DateTime.now();
  // final int isolateId = Isolate.current.hashCode;
  print("[$now] screen 2 Hello, world! unction='$printHello'");
}
  void initState()  {
    print("init sate");
    alamr();
    (()async{
final int helloAlarmID = 0;
  await AndroidAlarmManager.initialize();
  await AndroidAlarmManager.periodic(const Duration(seconds: 1), helloAlarmID, printHello);

    });
    // TODO: implement initState
    super.initState();
  }

  void alamr()async {
final int helloAlarmID = 0;
  await AndroidAlarmManager.initialize();
  await AndroidAlarmManager.periodic(const Duration(seconds: 1), helloAlarmID, printHello);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InkWell(
          onTap: (){
            runAlarm();
          },
          child: Text("apa")),
      ),
    );
  }
   void runAlarm() {
    AndroidAlarmManager.periodic(
      Duration(seconds: 10),
      0,
      printHello,
      wakeup: true,
    ).then((val) => print(val)).catchError((e) {
      print(e);
    });
  }
  static void alarmTest() {
    print("test");
  }
}