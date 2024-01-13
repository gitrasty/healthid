

import 'package:flutter/material.dart';


class profile_patient extends StatefulWidget {
  const profile_patient({super.key});

  @override
  State<profile_patient> createState() => _profile_patientState();
}

class _profile_patientState extends State<profile_patient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(

      backgroundColor: Colors.white,
      elevation: 0,
    ),
    body: Column(children: [
      CircleAvatar(backgroundColor: Colors.blueAccent,),

      Text('Name'),

      Divider(),

      ListTile(title: Text('Edite Profile'),
      trailing: Icon(Icons.account_circle),
      ),
      Divider(),

      ListTile(title: Text('Language'),
        trailing: Icon(Icons.language),
      ),

    ],),

    );
  }
}
