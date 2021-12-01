import 'dart:convert';

import 'package:esdu/widgets/list_widget.dart';
import 'package:flutter/material.dart';

import 'package:sse_client/sse_client.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  SseClient channel;

  double temp;
  double humi;
  var currentData;
  var a;

  @protected
  @mustCallSuper
  void initState() {
    super.initState();

    channel = SseClient.connect(Uri.parse("https://esdu.herokuapp.com/value"));
    channel.stream.listen((event) {
      this.setState(() {
        currentData = event;
        a = jsonDecode(currentData);
        temp = a["temperature"];
        humi = a["himidity"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          color: const Color(0xffEBEBEB),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.1), BlendMode.dstATop),
            image: NetworkImage(
                'https://mecaluxcom.cdnwm.com/software/header-servicio-hardware.1.2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Icon(
                Icons.poll,
                color: Colors.black,
                size: 50,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[
              SizedBox(height: 30),
              Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '''
  Welcome,
  ESD''',
                    style: TextStyle(
                      fontFamily: 'sen',
                      fontSize: 40,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: 20),
              new Expanded(
                child: temp == null
                    ? new Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListWidget(temp, humi),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
