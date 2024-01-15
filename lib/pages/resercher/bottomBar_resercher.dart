import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthid/pages/HomePage.dart';
import 'package:healthid/pages/patients/profile.dart';
import 'package:healthid/pages/resercher/homeResercher.dart';
import 'package:healthid/pages/service/servicePage.dart';


class BottomBar_resercher extends StatefulWidget {
  const BottomBar_resercher({super.key});

  @override
  State<BottomBar_resercher> createState() => _BottomBar_resercherState();
}

class _BottomBar_resercherState extends State<BottomBar_resercher> {

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    homeResercher(),
    servicePage(),
    profile_patient()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Service',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            label: 'Profile',
          ),
          // BottomNavigationBarItem(
          //
          //   icon:  Icon(Icons.account_circle),
          //   label: 'Profile',
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
