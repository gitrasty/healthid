import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthid/component/next_screen.dart';
import 'package:healthid/pages/signup/login.dart';
import 'package:healthid/pages/signup/signup.dart';

import '../../component/config.dart';
import 'DelayedAnimation.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({super.key});

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen>
    with SingleTickerProviderStateMixin {
  final int delayedAmount = 100;
  double? _scale;
  AnimationController? _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    _scale = 1 - _controller!.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor://Color(0xFF106F95),
          backgroundColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
                         'assets/logo.png',// 'assets/images/heart.png',
                          fit: BoxFit.cover,
                          height: 80,
                          width: 80,
                        )),
                        radius: 60.0,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                DelayedAnimation(
                  child: Text(
                    "Hi There",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: color),
                  ),
                  delay: delayedAmount + 800,
                ),
                DelayedAnimation(
                  child: Text(
                    "Health ID",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: color),
                  ),
                  delay: delayedAmount + 1500,
                ),
                SizedBox(
                  height: 30.0,
                ),
                // DelayedAnimation(
                //   child: Text(
                //     "",
                //     style: TextStyle(fontSize: 20.0, color: color),
                //   ),
                //   delay: delayedAmount + 3000,
                // ),
                DelayedAnimation(
                  child: Text(
                    "I was created for your safety",
                    style: TextStyle(fontSize: 20.0, color: color),
                  ),
                  delay: delayedAmount + 2500,
                ),
                SizedBox(
                  height: 50.0,
                ),
                // DelayedAnimation(
                //   child: GestureDetector(
                //     onTap: () {
                //       nextScreen(context, signup());
                //     },
                //     // onTapDown: _onTapDown,
                //     // onTapUp: _onTapUp,
                //     child: Transform.scale(
                //       scale: _scale,
                //       child: _animatedButtonUI,
                //     ),
                //   ),
                //   delay: delayedAmount + 3500,
                // ),
                DelayedAnimation(
                  delay: delayedAmount + 3500,
                  child: Column(
                    children: [
                      Text(
                        "Sign Up like",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: color,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              nextScreen(context, signup(account: 'doctor'));
                            },
                            // onTapDown: _onTapDown,
                            // onTapUp: _onTapUp,
                            child: Transform.scale(
                              scale: _scale,
                              child: signupButton('Doctor'),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              nextScreen(context, signup(account: 'resercher'));
                            },
                            // onTapDown: _onTapDown,
                            // onTapUp: _onTapUp,
                            child: Transform.scale(
                              scale: _scale,
                              child: signupButton('Resercher'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          nextScreen(
                              context,
                              signup(
                                account: 'patient',
                              ));
                        },
                        // onTapDown: _onTapDown,
                        // onTapUp: _onTapUp,
                        child: Transform.scale(
                          scale: _scale,
                          child: signupButton('Patient'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                DelayedAnimation(
                  child: GestureDetector(
                    onTap: () {
                      nextScreen(context, login()
                      );
                    },
                    child: Text(
                      "I Already have An Account".toUpperCase(),
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: color),
                    ),
                  ),
                  delay: delayedAmount + 4500,
                ),
              ],
            ),
          )
          //  Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text('Tap on the Below Button',style: TextStyle(color: Colors.grey[400],fontSize: 20.0),),
          //     SizedBox(
          //       height: 20.0,
          //     ),
          //      Center(

          //   ),
          //   ],

          // ),
          ),
    );
  }

  Widget signupButton(String name) => Container(
        height: 60,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: backgroundColor //Color(0xFF8185E2),
                ),
          ),
        ),
      );
  Widget get _animatedButtonUI => Container(
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            'Signup',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: backgroundColor //Color(0xFF8185E2),
                ),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller!.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller!.reverse();
  }
}
