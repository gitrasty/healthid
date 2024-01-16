import 'package:flutter/material.dart';
import 'package:healthid/pages/resercher/chart_gender.dart';
import 'package:healthid/pages/resercher/disease.dart';

class homeResercher extends StatefulWidget {
  const homeResercher({super.key});

  @override
  State<homeResercher> createState() => _homeResercherState();
}

class _homeResercherState extends State<homeResercher> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(automaticallyImplyLeading: false,),
      body: ListView(children: [
        disease(),
        gender()
      ],),
    );
  }
  }