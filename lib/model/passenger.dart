import 'package:flutter/foundation.dart';

class Passenger {
  final String id;
  final String name;
  final String place;
  final String type;
  final String surface;

  Passenger(
      { this.id,
        @required this.name,
        @required this.place,
        @required this.type,
        @required this.surface});
}