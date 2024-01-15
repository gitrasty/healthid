import 'dart:async';

import 'package:flutter/material.dart';
import 'package:healthid/pages/switchPasge.dart';


class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  void completed() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => switchPage()));
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), completed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/logo.png'),
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ));
  }
}
