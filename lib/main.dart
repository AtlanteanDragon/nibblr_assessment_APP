import 'package:flutter/material.dart';
//import 'dart:convert';
import 'package:nibblr_client/helpers/network_helper.dart';
import 'package:nibblr_client/layouts/user_login.dart';
import 'package:nibblr_client/layouts/dinner_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nibblr_client/layouts/user_register.dart';
//import 'package:nibblr_client/layouts/user_edit.dart';
//import 'package:nibblr_client/layouts/user_logout.dart';
import 'package:nibblr_client/layouts/dinner_add.dart';
import 'package:nibblr_client/layouts/dinner_details.dart';
//import 'package:nibblr_client/layouts/dinner_join.dart';

final routes = {
  //'/': (BuildContext context) => new UserLogin(),
  '/login': (BuildContext context) => new CheckAuth(),
  '/login-register': (BuildContext context) => new UserRegister(),
  //'/login-edit': (BuildContext context) => new UserEdit(),
  //'/logout': (BuildContext context) => new UserLogout(),
  '/dinner-list': (BuildContext context) => new DinnerList(),
  '/dinner-add': (BuildContext context) => new DinnerAdd(),
  '/dinner-details': (BuildContext context) => new DinnerDetails(),
  //'/dinner-join': (BuildContext context) => new DinnerJoin(),
};
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nibblr Client',
      //debugShowCheckedModeBanner: false,
      home: CheckAuth(),
    );
  }
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  void setNextView() async {
    var dinners = await NetworkHelper().getData("dinners/list");
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => DinnerList(dinners: dinners)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (isAuth) {
      setNextView();
      return DinnerList(dinners: []);
    } else {
      return Login();
    }
    return Scaffold(
      body: child,
    );
  }
}
