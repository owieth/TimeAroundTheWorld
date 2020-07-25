import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String baseUrl = 'http://worldtimeapi.org/api/timezone';
  String location;
  String time;
  String url;
  bool isDayTime;

  WorldTime({this.location, this.url});

  Future<void> getTime() async {
    try {
      // Get Time of specific city
      Response response = await get('$baseUrl/$url');
      Map data = jsonDecode(response.body);

      // Props from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);

      // Parsing time
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.Hm().format(now);
    } catch (e) {
      print('Could not get Time! Exception \'$e\'');
      time = '00:00';
    }
  }
}
