import 'package:flutter/material.dart';
import 'package:todolist/views/register_account.dart';
import 'package:todolist/widgets/custom_button.dart';
import 'package:todolist/views/sign_in.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color(0xFF00C0F13),
        body: Container(
          padding:
              EdgeInsets.only(top: 30.0, bottom: 30.0, right: 25.0, left: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/check_mark.png'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Remembering task never being easier\n with the help of Todolist',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      buttonTitle: 'Sign In',
                      buttonColor: Color(0xffFFFFFF),
                      titleColor: Color(0xff333333),
                    ),
                    CustomButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterAccount()));
                      },
                      buttonTitle: 'Register',
                      buttonColor: Color(0xff3B3A41),
                      titleColor: Color(0xffFFFFFF),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
