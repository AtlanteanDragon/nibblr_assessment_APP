import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:nibblr_client/models/dinner.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String BASEURL = "http://10.0.2.2:8000/api/";

class NetworkHelper {
  //if you are using android studio emulator, change localhost to 10.0.2.2
  String token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
  }

  authData(data, apiUrl) async {
    var fullUrl = "http://10.0.2.2:8000/api/" + apiUrl;
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = "http://10.0.2.2:8000/api/" + apiUrl;
    await _getToken();
    return await http.get(fullUrl, headers: _setHeaders());
  }

  _setHeaders() => {
        HttpHeaders.authorizationHeader:
            "sAZ72ORiXAdHo6BMEw7Gvh6K7DseFhUX5U8S6L8F",
        //'gjOMOrDHXMZvcwuHi6fZdWFPm1Ss47oqn2GkKvwj',
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}

class AuthHelper {
  static Future authenticate(email, password) async {
    return await http.post("http://10.0.2.2:8000/api/" + "login",
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));
  }

  static Future<dynamic> buttonPressed(email, password) async {
    var response = await authenticate(email, password);
    var body = response.body;
    var decoded = json.decode(body);
    var token = decoded['token'];
    var errors = decoded['errors'];
    if (token != null) {
      return decoded['token'];
    } else {
      return errors;
    }
  }

  static Future checkIfAuthenticated(String apiToken) async {
    var result = await http.get(
        "http://10.0.2.2:8000/api/" + "user/authenticated",
        headers: {HttpHeaders.authorizationHeader: apiToken});
    return result;
  }
}

class DinnerNetworker {
  static List<Dinner> parseDinners(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Dinner>((json) => Dinner.fromJson(json)).toList();
  }

  static Future<List<Dinner>> fetchDinners(String apiToken) async {
    final response = await http.get(
        "http://10.0.2.2:8000/api/" + 'dinners/list',
        headers: {HttpHeaders.authorizationHeader: apiToken});
    if (response.statusCode == 200 || apiToken != "") {
      return parseDinners(response.body);
    } else {
      throw Exception("Could not retrieve dinners");
    }
  }
}
