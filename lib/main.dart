import 'package:flutter/material.dart';
import 'package:timearoundtheworldapp/pages/choose_location.dart';
import 'package:timearoundtheworldapp/pages/home.dart';
import 'package:timearoundtheworldapp/pages/loading.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Hide Android Statusbar
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'RobotoMono'),
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation()
    },
  ));
}
