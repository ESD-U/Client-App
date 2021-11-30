import 'dart:convert';
import 'package:esdu/pages/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final idText = TextEditingController();
  final passwordText = TextEditingController();

  bool _isLoading = null;

  send() {
    signIn(idText.text, passwordText.text);
  }

  signIn(String id, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'id': id,
      'password': password,
    };
    var jsonResponse = null;
    var response = await http
        .post(Uri.parse("https://esdu.herokuapp.com/login"), body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => null),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            SizedBox(height: 130),
            Center(
              child: SvgPicture.asset(
                'assets/logo.svg',
                width: 150,
                height: 150,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(color: Colors.white),
                  child: TextFormField(
                    controller: idText,
                    decoration: InputDecoration(
                      filled: true,
                      border: InputBorder.none,
                      labelText: '아이디를 입력하세요',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(color: Colors.white),
                  child: TextFormField(
                    controller: passwordText,
                    decoration: InputDecoration(
                      filled: true,
                      border: InputBorder.none,
                      labelText: '비밀번호를 입력하세요',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            ButtonTheme(
              minWidth: 350,
              height: 55,
              child: RaisedButton(
                onPressed: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                },
                child: Icon(
                  Icons.lock_open,
                  color: Colors.white,
                  size: 40,
                ),
                color: Color(0xffFB7B4A),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
