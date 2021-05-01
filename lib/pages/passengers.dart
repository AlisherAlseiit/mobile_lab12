import 'package:flutter/material.dart';
import 'package:mobile_lab12/modalBottomSheet/new_transaction.dart';
import 'package:mobile_lab12/model/passenger.dart';
import 'package:mobile_lab12/navigationDrawer/navigationDrawer.dart';

class Passengers extends StatefulWidget {
  static const String routeName = '/passengers';

  @override
  _PassengersState createState() => _PassengersState();
}

class _PassengersState extends State<Passengers> {
  List<Passenger> passengers = [
    Passenger(id: '1',
        name: 'Aigerim', place: '0 A', type: 'OFFLINE', surface: 'верхний'),
    Passenger(id: '2',name: 'Arlan', place: '0 B', type: 'OFFLINE', surface: 'верхний'),
    Passenger(id: '3',name: 'ASSEL', place: '1', type: 'ONLINE', surface: 'нижний'),
    Passenger(id: '4',name: 'TEMIRLAN', place: '1', type: 'ONLINE', surface: 'верхний'),
    Passenger(id: '5',
        name: 'Нет имени', place: '0 A', type: 'no type', surface: 'нижний'),
    Passenger(id: '6',
        name: 'Нет имени', place: '0 B', type: 'no type', surface: 'нижний'),
    Passenger(id: '7',
        name: 'Нет имени', place: '2', type: 'no type', surface: 'нижний'),
    Passenger(id: '8',
        name: 'Нет имени', place: '2', type: 'no type', surface: 'верхний'),
  ];

  void _startAddNewTransaction(BuildContext ctx, Passenger ps) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(
            ps
            ,_deleteTransaction
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      passengers.removeWhere((tx) => tx.id == id);
    });
  }

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
                  SizedBox(
                    height: 10,
                  ),
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
              )
            ],
          ),
        ),
      ),
    );
  }

  _geBody() {
    return passengers.map((ps) => ps.type != 'no type'
        ? Container(
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
                    height: 40,
                    width: 115,
                    child: RaisedButton(
                      child: Text(
                        ps.type,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () => _startAddNewTransaction(context, ps),
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      color: ps.type == "OFFLINE" ? Colors.grey : Colors.green,
                    ),
                  ),

              ],
            ),
          )
        : SizedBox());
  }

  _getFree() {
    return passengers.map((ps) => ps.type == 'no type'
        ? Container(
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
          )
        : SizedBox());
  }
}
