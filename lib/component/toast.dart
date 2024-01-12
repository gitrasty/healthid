

import 'package:flutter/material.dart';

//sort length
void openToast(context, message){
  final snackBar = SnackBar(
    content: Text(message,style: TextStyle(color: Colors.black),),
    backgroundColor: Colors.white,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(50),
    elevation: 30,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // Toast.show(message, textStyle: context, webTexColor: Colors.white, backgroundRadius: 20, duration: Toast.lengthShort);
  }

//long length
void openToast1(context, message){
  final snackBar = SnackBar(
    content: Text(message,style: TextStyle(color: Colors.black),),
    backgroundColor: Colors.white,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(50),
    elevation: 30,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // Toast.show(message, textStyle: context, webTexColor: Colors.white, backgroundRadius: 20, duration: Toast.lengthLong);
  }