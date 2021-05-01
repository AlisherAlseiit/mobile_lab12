import 'package:flutter/material.dart';
import 'package:mobile_lab12/model/passenger.dart';
import 'package:mobile_lab12/navigationDrawer/navigationDrawer.dart';

class Passengers extends StatelessWidget {
  static const String routeName = '/passengers';

  List<Passenger> passengers = [
    Passenger(
        name: 'Aigerim', place: '0 A', type: 'OFFLINE', surface: 'верхний'),
    Passenger(name: 'Arlan', place: '0 B', type: 'OFFLINE', surface: 'верхний'),
    Passenger(name: 'ASSEL', place: '1', type: 'ONLINE', surface: 'нижний'),
    Passenger(name: 'TEMIRLAN', place: '1', type: 'ONLINE', surface: 'верхний'),
    Passenger(name: 'Нет имени', place: '0 A', type: 'no type', surface: 'нижний'),
    Passenger(name: 'Нет имени', place: '0 B', type: 'no type', surface: 'нижний'),
    Passenger(name: 'Нет имени', place: '2', type: 'no type', surface: 'нижний'),
    Passenger(name: 'Нет имени', place: '2', type: 'no type', surface: 'верхний'),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          toolbarHeight: 65.0,
          title: Align(
              alignment: Alignment.bottomLeft,
              child: Text('Пассажиры',
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 25.0))),
          centerTitle: true,
          backgroundColor: Colors.green),
      drawer: NavigationDrawer(),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Имя',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Место',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Тип',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                ..._geBody(),
                Container(
                  padding: EdgeInsets.only(top: 25),
                    child: Text(
                  'Свободные места',
                  style: TextStyle(fontSize: 20),
                )),
                ..._getFree(),
              ],
            )],
          ),
        ),
      ),
    );
  }

  _geBody() {
    return passengers.map((ps)  => ps.type != 'no type' ? Container(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            width: 115,
            child: Text(
              ps.name,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                ps.place,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                ps.surface,
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: ps.type == "OFFLINE" ? Colors.grey : Colors.green,
              borderRadius: BorderRadius.circular(35),
            ),
            height: 40,
            width: 95,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              ps.type,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ) : SizedBox());
  }

  _getFree() {
     return passengers.map((ps)  => ps.type == 'no type' ? Container(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            width: 115,
            child: Text(
              ps.name,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                ps.place,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                ps.surface,
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: ps.type == "OFFLINE" ? Colors.grey : Colors.green,
              borderRadius: BorderRadius.circular(35),
            ),
            height: 40,
            width: 95,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              ps.type,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ) : SizedBox());
  }
}
