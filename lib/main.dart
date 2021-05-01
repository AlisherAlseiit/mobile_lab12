import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:mobile_lab12/model/busline.dart';
import 'package:mobile_lab12/pages/bus.dart';
import 'package:mobile_lab12/navigationDrawer/navigationDrawer.dart';
import 'package:mobile_lab12/pages/passengers.dart';
import 'package:mobile_lab12/routes/pageRoute.dart';

void main() => runApp(new MyApp() );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Bus(),
      routes:  {
        pageRoutes.passengers: (context) => Passengers(),
        pageRoutes.bus: (context) => Bus(),
      },
    );
  }
}