import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timearoundtheworldapp/service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'New York', url: 'America/New_York'),
    WorldTime(location: 'Los Angeles', url: 'America/Los_Angeles'),
    WorldTime(location: 'Tokyo', url: 'Asia/Tokyo'),
    WorldTime(location: 'Sydney', url: 'Australia/Sydney'),
    WorldTime(location: 'Melbourne', url: 'Australia/Melbourne'),
    WorldTime(location: 'Zurich', url: 'Europe/Zurich'),
    WorldTime(location: 'London', url: 'Europe/London'),
  ];

  void updateTime(index) async {
    WorldTime worldTime = locations[index];
    await worldTime.getTime();

    Navigator.pop(context, {
      'location': worldTime.location,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].location),
            ),
          );
        },
      ),
    );
  }
}
