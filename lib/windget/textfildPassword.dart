import 'package:flutter/material.dart';
import 'package:healthid/component/config.dart';

class textfildPassword extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? obscureCharacter;
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;

  const textfildPassword({Key? key,
    required this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.obscureCharacter = '*',
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return                       Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Invaild';
          }
        },
        controller: controller,
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        decoration: InputDecoration(fillColor: Colors.white,
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.red)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.red)),
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.black,
          ),
          hintText: hintText,
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
    );

  }
}