import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthid/pages/bottomBar.dart';
import 'package:healthid/pages/welcome/welcomeScreen.dart';


class switchPage extends StatefulWidget {
  const switchPage({super.key});

  @override
  State<switchPage> createState() => _switchPageState();
}

class _switchPageState extends State<switchPage> {
  User? _user;

  Future<void> _checkCourentUser() async {
    User? user = await FirebaseAuth.instance.currentUser;
    _updateuser(user);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkCourentUser();
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
    }
    return BottomBar();

    // home_page(onSignOut: () => _updateuser(null));
  }
}
