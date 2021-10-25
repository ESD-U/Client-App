import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
            elevation: 0.0, // appbar 그림자 농도
            leading: Icon(
              Icons.poll,
              color: Colors.black,
              size: 50,
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
