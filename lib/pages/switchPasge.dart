import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthid/pages/bottomBar.dart';
import 'package:healthid/pages/welcome/welcomeScreen.dart';

import 'doctor/bottomBar_Doctor.dart';


class switchPage extends StatefulWidget {
  const switchPage({super.key});

  @override
  State<switchPage> createState() => _switchPageState();
}

class _switchPageState extends State<switchPage> {
  User? _user;
  User? user =  FirebaseAuth.instance.currentUser;

  Future<void> _checkCourentUser() async {
    _updateuser(user);
  }
  var switchlogin='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkCourentUser();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .snapshots()
        .listen((datasnapshot) {
      setState(() {
        switchlogin = datasnapshot.data()!['account'];
      });
    });

  }

  void _updateuser(User? user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return welcomeScreen(
       );
    }else {
      if (switchlogin == 'patient') {

        return BottomBar();
      }else if (switchlogin == 'doctor') {
        return BottomBar_Doctor();
      }

      return BottomBar();
  //    return BottomBar();
    }
  }
}
