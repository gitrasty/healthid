import 'dart:async';

import 'package:flutter/material.dart';
import 'package:healthid/pages/bottomBar.dart';
import 'package:healthid/pages/switchPasge.dart';
import 'package:healthid/pages/welcome/welcomeScreen.dart';
import 'package:provider/provider.dart';
import '../bloc/signInBloc.dart';
import '../component/next_screen.dart';
import 'login.dart';


class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin{
  void completed() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => switchPage()
        ));
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
