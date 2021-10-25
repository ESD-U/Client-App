import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        child: LoginPage(),
      ),
    );
  }
}
