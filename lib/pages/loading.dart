import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time = 'loading';

  void setUpWorldTime() async {
    WorldTime instance =
        WorldTime(location: "Kolkata", flag: "india.png", url: "Asia/Kolkata");
    await instance.getTime();

    // The screen underneath will be replaced.
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay,
    });

    // print(wt.time);

    // setState(() {
    //   time = wt.time;
    // });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Padding(
      //   padding: EdgeInsets.all(50.0),
      //   child: Text("Loading"),
      // ),
      backgroundColor: Colors.blue[900],
      body: const  Center(
        // child: SpinKitRotatingCircle (
        // child: SpinKitCubeGrid (
        child: SpinKitFadingCube (
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
