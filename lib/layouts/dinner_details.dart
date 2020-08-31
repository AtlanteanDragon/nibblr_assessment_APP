import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DinnerDetails extends StatefulWidget {
  DinnerDetails({Key key}) : super(key: key);
  @override
  _DinnerDetailsState createState() => new _DinnerDetailsState();
}

class _DinnerDetailsState extends State<DinnerDetails> {
  String _title;
  String _description;
  String _maxGuests;
  String _currentGuests;
  String _beginDate;
  String _endDate;

  @override
  Widget build(BuildContext contexts) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text(
                  _title,
                  style: new TextStyle(
                      fontSize: 22.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Roboto"),
                ),
                new Text(
                  _description,
                  style: new TextStyle(
                      fontSize: 12.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                ),
                new Text(
                  _maxGuests,
                  style: new TextStyle(
                      fontSize: 12.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                ),
                new Text(
                  _currentGuests,
                  style: new TextStyle(
                      fontSize: 12.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                ),
                new Text(
                  _beginDate,
                  style: new TextStyle(
                      fontSize: 12.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                ),
                new Text(
                  _endDate,
                  style: new TextStyle(
                      fontSize: 12.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                ),
                new RaisedButton(
                    key: null,
                    onPressed: buttonPressed,
                    color: const Color(0xFFe0e0e0),
                    child: new Text(
                      "Join Dinner",
                      style: new TextStyle(
                          fontSize: 12.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto"),
                    ))
              ]),
        ),
        padding: const EdgeInsets.all(0.0),
        alignment: Alignment.center,
      ),
    );
  }

  void buttonPressed() {}
}
