import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    String backgroundImage =
        data['isDayTime'] ? 'background_day.png' : 'background_night.png';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$backgroundImage'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20.0),
              Text(data['time'],
                  style: TextStyle(fontSize: 75.0, color: Colors.white)),
              FlatButton.icon(
                  onPressed: () async {
                    dynamic worldTime =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'location': worldTime['location'],
                        'time': worldTime['time'],
                        'isDayTime': worldTime['isDayTime']
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.white,
                    size: 36.0,
                  ),
                  label: Text(
                    data['location'],
                    style: TextStyle(fontSize: 36.0, color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
