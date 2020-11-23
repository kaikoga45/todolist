import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final bool obscureText;

  InputField(
      {@required this.hintText,
      @required this.textEditingController,
      @required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: textEditingController,
        style: TextStyle(color: Colors.white),
        obscureText: obscureText,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Color(0xff888995)),
          focusColor: Colors.white,
          hintText: hintText,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Color(0xFF2C2B34),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Color(0xFF1D1E33),
            ),
          ),
        ),
      ),
    );
  }
}
