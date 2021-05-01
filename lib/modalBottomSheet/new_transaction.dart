import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobile_lab12/model/passenger.dart';

class NewTransaction extends StatefulWidget {
  final Passenger ps;
  final Function delete;

  NewTransaction(this.ps, this.delete) {
    print('Constructor NewTransaction Widget');
  }

  @override
  _NewTransactionState createState() {
    print('CreateState  NewTransaction Widget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.65,
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Информация о пассажире',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 35,
              ),
              Divider(
                height: 2,
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              Material(
                elevation: 5,
                shadowColor: Colors.white,
                borderRadius: BorderRadius.circular(20),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      labelText: widget.ps.name,
                      labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Material(
                elevation: 5,
                shadowColor: Colors.white,
                borderRadius: BorderRadius.circular(20),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      labelText: '77079282498',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Material(
                elevation: 5,
                shadowColor: Colors.white,
                borderRadius: BorderRadius.circular(20),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      labelText: 'Почта',
                      labelStyle: TextStyle(color: Colors.green, fontSize: 20),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Место',
                    style: TextStyle(fontSize: 19, color: Colors.grey),
                  ),
                  Text(
                    'Цена',
                    style: TextStyle(fontSize: 19, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 55,
                    width: 115,
                    child: Material(
                      elevation: 5,
                      shadowColor: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText:
                                widget.ps.place + ' ' + widget.ps.surface,
                            labelStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 1)),
                      ),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 110,
                    child: Material(
                      elevation: 5,
                      shadowColor: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: '3000',
                            labelStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.only(
                                left: 35, bottom: 11, top: 11, right: 1)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    height: 60,
                    width: 148,
                    child: RaisedButton(
                      onPressed: () => widget.delete(widget.ps.id),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0)),
                      textColor: Colors.white,
                      child: Text(
                        'ИЗМЕНИТЬ',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 60,
                    width: 190,
                    child: RaisedButton(
                      onPressed: () => widget.delete(widget.ps.id),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0)),
                      textColor: Colors.white,
                      child: Text(
                        'ОТПРАВИТЬ ЧЕК',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 60,
                width: 320,
                child: RaisedButton(
                  onPressed: () {
                    widget.delete(widget.ps.id);
                    Navigator.pop(context);
                  },
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0)),
                  textColor: Colors.white,
                  child: Text(
                    'Отменить покупку Билета',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
