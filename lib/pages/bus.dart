import 'package:flutter/material.dart';
import 'package:mobile_lab12/model/busline.dart';
import 'package:mobile_lab12/navigationDrawer/navigationDrawer.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class Bus extends StatefulWidget {
  static const String routeName = '/bus';

  @override
  _BusState createState() => _BusState();
}

class _BusState extends State<Bus> {
  static const String routeName = '/main';
  List<BusLine> busList = [
    BusLine(
        name: 'YUTONG',
        from: 'Асыката',
        to: 'Алматы',
        fromDateTime: DateTime.parse("2020-02-06 18:39:00"),
        toDateTime: DateTime.parse("2020-02-07 06:10:00"),
        seats: '32 мест',
        carNumber: 'KZ 888 KN02',
        icon: 'bus1.jpg'),
    BusLine(
        name: 'End2End Test',
        from: 'Город X',
        to: 'Сарыагаш',
        fromDateTime: DateTime.parse("2020-02-06 19:30:00"),
        toDateTime: DateTime.parse("2020-02-07 18:36:00"),
        seats: '53 мест',
        carNumber: 'KZ 123 ABC',
        icon: 'bus2.jpg'),
    BusLine(
        name: 'YUTONG',
        from: 'Сарыагаш',
        to: 'Алматы',
        fromDateTime: DateTime.parse("2020-02-06 18:39:00"),
        toDateTime: DateTime.parse("2020-02-07 06:10:00"),
        seats: '32 мест',
        carNumber: 'KZ 888 KN02',
        icon: 'bus3.jpg'),
  ];

  Widget _textTemp(text, [fontSize = 18.0, weight = FontWeight.normal]) {
    return Container(
        child: Text(text,
            style: GoogleFonts.roboto(
              textStyle: Theme
                  .of(context)
                  .textTheme
                  .headline4,
              fontSize: fontSize,
              fontWeight: weight,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            )));
  }

  Widget cardTemplate(bus) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            'assets/${bus.icon}',
                            fit: BoxFit.fitHeight,
                            width: 150,
                            height: 200,
                          )),
                      SizedBox(height: 5),
                      _textTemp(bus.name, 20.0),
                      SizedBox(height: 5),
                      _textTemp(bus.carNumber, 18.0),
                      SizedBox(height: 5),
                      _textTemp(bus.seats, 18.0)
                    ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _textTemp(bus.from + ' -', 24.0),
                          _textTemp(bus.to, 24.0),
                          SizedBox(height: 15),
                          _textTemp('Отправление', 20.0, FontWeight.bold),
                          SizedBox(height: 5),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _textTemp(
                                    'Дата  -  ' +
                                        DateFormat('dd.MM.yyyy E')
                                            .format(bus.fromDateTime),
                                    18.0),
                                SizedBox(height: 5),
                                _textTemp(
                                    'Время  -  ' +
                                        DateFormat('HH:mm')
                                            .format(bus.fromDateTime),
                                    18.0)
                              ]),
                          SizedBox(height: 15),
                          _textTemp('Прибытие', 20.0, FontWeight.bold),
                          SizedBox(height: 5),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _textTemp(
                                    'Дата  -  ' +
                                        DateFormat('dd.MM.yyyy E')
                                            .format(bus.toDateTime),
                                    18.0),
                                SizedBox(height: 5),
                                _textTemp(
                                    'Время  -  ' +
                                        DateFormat('HH:mm')
                                            .format(bus.toDateTime),
                                    18.0)
                              ])
                        ])
                  ])),
          FlatButton(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              onPressed: () {
                Widget cancelButton = FlatButton(
                    child: Text("НЕТ",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    });
                Widget continueButton = FlatButton(
                    child: Text("ДА",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0)),
                    onPressed: () =>
                        setState(() {
                          busList.remove(bus);
                          Navigator.of(context).pop();
                        }));

                AlertDialog alert = AlertDialog(
                    content: Text("Вы хотите удалить этот рейс?",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 21.0)),
                    actions: [cancelButton, continueButton]);
                showDialog(context: context, builder: (context) => alert);
              },
              color: Colors.white,
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.green),
                      borderRadius: BorderRadius.circular(7)),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: _textTemp('Удалить рейс')))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
            toolbarHeight: 65.0,
            title: Align(
                alignment: Alignment.bottomLeft,
                child: Text('Расписание',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 25.0))),
            centerTitle: true,
            backgroundColor: Colors.green),
        body: ListView(
          children: busList.map((bus) => cardTemplate(bus)).toList(),
        ),
        floatingActionButton: FlatButton(
            onPressed: () {},
            child: Container(
                margin: EdgeInsets.fromLTRB(0, 00, 0, 50),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(vertical: 17, horizontal: 105),
                child: Text('Добавить рейс',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400)))),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        drawer: NavigationDrawer());
  }
}



