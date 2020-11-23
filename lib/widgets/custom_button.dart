import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;
  final Color buttonColor;
  final Color titleColor;

  CustomButton(
      {@required this.onTap,
      @required this.buttonTitle,
      @required this.buttonColor,
      @required this.titleColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.all(10.0),
        width: double.infinity,
        height: 60.0,
      ),
    );
  }
}
