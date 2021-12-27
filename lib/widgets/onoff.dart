import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:esdu/models/model.dart';

on() async {
  print('LED is on.');
  var response = await http.post(
    Uri.parse('https://esdu.herokuapp.com/light/on'),
    headers: {
      'Content-type': 'application/json',
      HttpHeaders.authorizationHeader: "Bearer " + Data.accessToken
    },
  );
  print(response.statusCode.toString());
}

off() async {
  print('LED is off.');
  var response = await http.post(
    Uri.parse('https://esdu.herokuapp.com/light/off'),
    headers: {
      'Content-type': 'application/json',
      HttpHeaders.authorizationHeader: "Bearer " + Data.accessToken
    },
  );
  print(response.statusCode.toString());
}
