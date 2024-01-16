import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthid/pages/welcome/welcomeScreen.dart';

class profile_patient extends StatefulWidget {
  const profile_patient({super.key});

  @override
  State<profile_patient> createState() => _profile_patientState();
}

class _profile_patientState extends State<profile_patient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,  ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CircleAvatar(
            backgroundColor: Colors.blueAccent,
            backgroundImage: AssetImage('assets/images/user.png'),
            radius: 50,
          ),
          SizedBox(height: 10,),
          Text('Rastgo abubakr',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          SizedBox(
            height: 30,
          ),
          Divider(),
          ListTile(
            title: Text('Edite Profile'),
            trailing: Icon(Icons.account_circle_outlined),
          ),
          Divider(),
          ListTile(
            title: Text('Language'),
            trailing: Icon(Icons.language),
          ),
          ListTile(
            title: Text('About'),
            trailing: Icon(Icons.info_outline),
          ),
          ListTile(
            title: Text('contact us'),
            trailing: Icon(Icons.email_outlined),
          ),
          ListTile(
            title: Text('Log out'),
            trailing: Icon(Icons.login),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                    'are you sure logout'),
                actions: [
                  TextButton(
                      onPressed: () => _signOut(),
                      child: Text('yes')),
                  TextButton(
                      onPressed: () =>
                          Navigator.of(context).pop(),
                      child: Text('no'))
                ],
              ),
            );
            },
          ),
        ],
      ),
    );
  }
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => welcomeScreen(
            ),
          ));
      // print("logOut");
    } catch (e) {
      // print(e.toString());
    }
  }
}
