import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FileHelper {
  static String _encrypt(input) {
    List<int> bytes = utf8.encode(input);
    return bytes.toString();
  }

  static String _decrypt(bytesString) {
    var bytes = json.decode(bytesString).toList();
    return utf8.decode(bytes.cast<int>());
  }

  static void write(data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('accessToken', _encrypt(data));
  }

  static Future<String> _read() async {
    final prefs = await SharedPreferences.getInstance();
    return _decrypt(prefs.getString('accessToken')) ?? "";
  }

  static Future<String> read() async {
    var val = await _read();
    return val;
  }
}
