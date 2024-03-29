import 'package:avatar_glow/avatar_glow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthid/component/config.dart';
import 'package:healthid/pages/welcome/welcomeScreen.dart';

import '../../component/next_screen.dart';
import '../../windget/textfildPassword.dart';
import '../switchPasge.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String errormessage='' ;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,

          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              AvatarGlow(
                // endRadius: 90,
                duration: Duration(seconds: 2),
                glowColor: Colors.white24,
                repeat: true,
                // repeatPauseDuration: Duration(seconds: 2),
                startDelay: Duration(seconds: 1),
                child: Material(
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.white, //Colors.grey[100],
                      child: Center(
                          child: Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.cover,
                        height: 70,
                        width: 70,
                      )),
                      radius: 50.0,
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Container(
                    height: size.height / 1,
                    width: size.width / 1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                        // BorderRadius.only(
                        //   topLeft: Radius.circular(20),
                        //   topRight: Radius.circular(20),
                        // ),
                        ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 90,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Invaild Email';
                              }
                            },
                            controller: email,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.red)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.red)),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: backgroundColor)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: backgroundColor)),
                            ),
                          ),
                        ),
                        textfildPassword(
                          controller: password,
                          hintText: 'Password',
                          prefixIcon: Icons.password,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                          child: Material(
                            //Wrap with Material
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.0)),
                            elevation: 18.0,
                            color: backgroundColor,
                            clipBehavior: Clip.antiAlias, // Add This
                            child: MaterialButton(
                              minWidth: 200.0,
                              height: 35,
                              elevation: 0,
                              color: backgroundColor,
                              child: new Text('Login',
                                  style: new TextStyle(
                                      fontSize: 18.0, color: Colors.white)),
                              onPressed: () async {

                                FirebaseAuth auth = FirebaseAuth.instance;
                                User? user;
                                if(_formKey.currentState!.validate()){


                                try {
                                  UserCredential userCredential =
                                      await auth.signInWithEmailAndPassword(
                                    email: email.text,
                                    password: password.text,
                                  );
                                  user = userCredential.user;
                                  if (user != null) {
                                    nextScreen(context, switchPage());
                                  }else{
                                    setState(() {
                                      errormessage =
                                      'Wrong Email or password ';
                                    });
                                  }
                                } on FirebaseAuthException catch (e) {
                                  print(e.code+'>>>>');

                                  if (e.code == 'user-not-found') {
                                    print('No user found for that email.');
                                    setState(() {
                                      errormessage =
                                      'No user found for that email.';
                                    });

                                  } else if (e.code == 'wrong-password') {
                                    print('Wrong password provided.');
                                    setState(() {
                                      errormessage = 'Wrong password provided.';
                                    });

                                  }else if(e.code=='invalid-email'){
                                    setState(() {
                                      errormessage='invalid-email';                                    });
                                  }else if(e.code=='invalid-credential'){
                                    setState(() {
                                      errormessage='invalid-credential';                                    });
                                  }
                                }}
                                // FirebaseAuthHelper.signInUsingEmailPassword(
                                //     email: email.text,
                                //     password: password.text,
                                //     context: context);
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        errormessage==""
                            ? Container()
                            : Center(
                                child: Text(
                                  errormessage,
                                  style:
                                      TextStyle(color: Colors.red, fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                width: size.width / 2.2,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(1000),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          offset: Offset(0, 0.1))
                                    ]),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.google,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Sign In with Google',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                width: size.width / 2.2,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(1000),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          offset: Offset(0, 0.1))
                                    ]),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.apple,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Sign In with Google',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              nextScreen(context, welcomeScreen());
                            },
                            child: Text(
                              "I dont have Account",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: backgroundColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
