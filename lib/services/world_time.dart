import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String location; // ? used to ignore non-nullable error
  String flag;
  String url;
  late String time; // late used to ignore non-nullable error
  late bool isDay;

  WorldTime({required this.location, required this.flag, required this.url});

  // Future is like a placeholder until the function is complete.
  // Like a thing that will happen but not happened yet
  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      // print(data);

      String datetime = data["utc_datetime"];
      String offsetHr = data["utc_offset"].substring(1, 3);
      String offsetMin = data["utc_offset"].substring(4, 6);
      // print(datetime);
      // print(offsetHr);

      DateTime now = DateTime.parse(datetime);
      now = now.add(
          Duration(hours: int.parse(offsetHr), minutes: int.parse(offsetMin)));
      // print(now);

      // time = now.toString();
      isDay = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);

    } catch (error) {
      print("Error: $error");
      time = 'Could Not Get Time Data';
    }
  }
}
