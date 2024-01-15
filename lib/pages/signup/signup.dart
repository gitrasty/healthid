import 'package:avatar_glow/avatar_glow.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthid/bloc/signup.dart';
import 'package:healthid/component/config.dart';
import 'package:healthid/component/next_screen.dart';
import 'package:healthid/pages/HomePage.dart';
import 'package:healthid/pages/bottomBar.dart';
import 'package:healthid/pages/signup/login.dart';
import 'package:healthid/windget/textfild.dart';

import '../../windget/textfildPassword.dart';
import '../welcome/DelayedAnimation.dart';

class signup extends StatefulWidget {
  final String account;
  const signup({super.key, required this.account});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final List<String> listcity = ["sulaymaniyah", "erbil", "duhok", 'halabja'];
  String? selectcity;
  var city;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: new DateTime(1900),
        lastDate: new DateTime(2025)
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      // appBar: AppBar(),
      body: SingleChildScrollView(
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
                    backgroundColor: Colors.white,//Colors.grey[100],
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'SignUp',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        CustomTextField(
                          controller: name,
                          hintText: 'Username',
                          prefixIcon: Icons.person,
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
                                  borderSide:
                                      BorderSide(color: backgroundColor)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: backgroundColor)),
                            ),
                          ),
                        ),
                        textfildPassword(
                          controller: password,
                          hintText: 'Password',
                          prefixIcon: Icons.password,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: DropdownButtonHideUnderline(
                            child:
                                // Form(
                                //   key: shar1,
                                //   child:
                                DropdownButtonFormField<String>(
                              value: selectcity,
                              onChanged: (value) {
                                setState(() {
                                  selectcity = value;

                                  if (value == "sulaymaniyah") {
                                    city = 'sulaymaniyah';
                                  } else if (value == "erbil") {
                                    city = 'erbil';
                                  } else if (value == "duhok") {
                                    city = 'duhok';
                                  } else if (value == "halabja") {
                                    city = 'halabja';
                                  }

                                  //selectedSubject = value;
                                });
                              },
                              validator: (String? value) {
                                if (value == null) {
                                  return "شارەکەت دیاری بکە";
                                }
                              },
                              decoration: InputDecoration(
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  filled: true,
                                  //  fillColor: Color(0xff161d27),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color:
                                              Colors.lightBlueAccent.shade700)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color:
                                              Colors.lightBlueAccent.shade700)),
                                  fillColor: Colors.white),
                              hint: Text('Select your city'),
                              icon: Icon(
                                // Add this
                                Icons.arrow_drop_down, // Add this
                                color: Colors.blue, size: 35, // Add this
                              ),
                              items: listcity
                                  .map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem(
                                  child: Text(value),
                                  value: value,
                                );
                              }).toList(),
                            ),
                            // ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Birthday',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  _selectDate(context);
                                },
                                child: Text(
                                  "${selectedDate.toLocal()}".split(' ')[0],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
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
                              child: new Text('SignUp',
                                  style: new TextStyle(
                                      fontSize: 18.0, color: Colors.white)),
                              onPressed: () async {
                                FirebaseAuth auth = FirebaseAuth.instance;
                                User? user;

                                try {
                                  if (_formKey.currentState!.validate()) {
                                    UserCredential userCredential = await auth
                                        .createUserWithEmailAndPassword(
                                      email: email.text,
                                      password: password.text,
                                    );

                                    user = userCredential.user;
                                    await user!
                                        .updateProfile(displayName: name.text);
                                    await user.reload();
                                    user = auth.currentUser;
                                    FirebaseAuthHelper.usersFirestore(user:
                                        user!,account:  widget.account,Birthday: selectedDate,city: city);

                                    if (user != null) {
                                      nextScreen(context, HomePage());
                                    }
                                  } else if (selectedDate.toLocal() ==
                                      DateTime.now()) {
                                    setState(() {
                                      _errorMessage = 'Plase choase birtdayt';
                                    });
                                  } else {
                                    setState(() {
                                      _errorMessage = ' ';
                                    });
                                  }
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    print('The password provided is too weak.');
                                  } else if (e.code == 'email-already-in-use') {
                                    print(
                                        'The account already exists for that email.');
                                  }
                                } catch (e) {
                                  print(e);
                                }

                                // try {
                                //   if (!_formKey.currentState!.validate()) {
                                //     setState(() {
                                //       _errorMessage = 'invaild';
                                //     });
                                //   } else if (selectedDate.toLocal() ==
                                //       DateTime.now()) {
                                //     setState(() {
                                //       _errorMessage = 'Plase choase birtdayt';
                                //     });
                                //   } else {
                                //     setState(() {
                                //       _errorMessage = ' ';
                                //     });
                                //
                                //   }
                                // } catch (e) {}
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Text(
                            _errorMessage,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            nextScreen(context, BottomBar());
                          },
                          child: Row(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              nextScreen(context, login());
                            },
                            child: Text(
                              "I Already have An Account",
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "Email can not be empty";
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    } else {
      setState(() {
        _errorMessage = "";
      });
    }
  }
}
