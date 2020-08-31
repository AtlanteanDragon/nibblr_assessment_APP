import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nibblr_client/helpers/network_helper.dart';
import 'package:nibblr_client/layouts/user_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLogout extends StatefulWidget {
  @override
  _UserLogout createState() => _UserLogout();
}

class _UserLogout extends State<UserLogout> {
  String name;
  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if (user != null) {
      setState(() {
        name = user['fname'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    logout();
    return Scaffold();
  }

  void logout() async {
    var res = await NetworkHelper().getData('/logout');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}
