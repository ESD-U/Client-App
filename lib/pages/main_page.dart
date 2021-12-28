import 'dart:convert';
import 'package:esdu/widgets/list_widget.dart';
import 'package:flutter/material.dart';

import 'package:sse_client/sse_client.dart';
import 'package:esdu/models/model.dart';
import 'package:http/http.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  SseClient channel;
  SseClient channel2;

  var currentData;
  var a, b;
  var currentData2;

  Future<String> getData() async {
    var response =
        await get(Uri.parse('https://esdu.herokuapp.com/value/recent'));
    this.setState(() {
      String data = response.body;
      var currentData = jsonDecode(data);
      Data.recentTemp = currentData['temperature'];
      Data.recentHumi = currentData['humidity'];
    });

    var response1 =
        await get(Uri.parse('https://esdu.herokuapp.com/light/recent'));
    this.setState(() {
      String data1 = response1.body;
      var currentData1 = jsonDecode(data1);
      Data.recentInfo = currentData1['info'];
    });
  }

  @protected
  @mustCallSuper
  Future<void> initState() {
    super.initState();
    getData();
    channel = SseClient.connect(Uri.parse("https://esdu.herokuapp.com/value"));
    channel.stream.listen((event) {
      this.setState(() {
        currentData = event;
        a = jsonDecode(currentData);
        Data.temp = a["temperature"];
        Data.humi = a["humidity"];
      });
    });

    channel2 = SseClient.connect(Uri.parse("https://esdu.herokuapp.com/light"));
    channel2.stream.listen((event1) {
      this.setState(() {
        currentData2 = event1;
        b = jsonDecode(currentData2);
        Data.info = b["info"];
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
                child: ListWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
