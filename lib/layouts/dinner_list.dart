import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'package:nibblr_client/models/dinner.dart';
import 'package:nibblr_client/helpers/network_helper.dart';

BuildContext _context;
void routesDinnerList() {
  Navigator.of(_context).pushReplacementNamed("/dinner-list");
}

void routesDinnerAdd() {
  Navigator.of(_context).pushReplacementNamed("/dinner-add");
}

void routesLoginEdit() {
  Navigator.of(_context).pushReplacementNamed("/login-edit");
}

void routesLogout() {
  Navigator.of(_context).pushReplacementNamed("/logout");
}

class _DinnerListState extends State<DinnerList> {
  Drawer generateDrawerItem() {
    return Drawer(
        child: ListView(children: const <Widget>[
      DrawerHeader(child: Text('Navigation')),
      ListTile(onTap: routesDinnerList, title: Text('Home')),
      ListTile(onTap: routesDinnerAdd, title: Text('Add Dinner')),
      ListTile(onTap: routesLoginEdit, title: Text('Edit Profile')),
      ListTile(onTap: routesLogout, title: Text('Logout')),
    ]));
  }

  @override
  Widget build(BuildContext context) {
    _context = context;

    //var dinners = DinnerNetworker.fetchDinners();
    return new Scaffold(
      drawer: Drawer(child: generateDrawerItem()),
      appBar: new AppBar(
        title: new Text('Nibblr Client'),
      ),
      body: new Container(
        child: new ListView(),
        padding: const EdgeInsets.all(0.0),
        alignment: Alignment.center,
      ),
    );
  }
}

class DinnerList extends StatefulWidget {
  final dinners;
  DinnerList({Key key, @required this.dinners}) : super(key: key);
  @override
  _DinnerListState createState() => new _DinnerListState();
}
