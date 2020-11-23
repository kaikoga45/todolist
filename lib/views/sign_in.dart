import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:todolist/authentication_service.dart';
import 'package:todolist/views/task_screen.dart';
import 'package:todolist/widgets/custom_button.dart';
import 'package:todolist/widgets/input_field.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF00C0F13),
      body: Container(
        padding:
            EdgeInsets.only(top: 30.0, bottom: 30.0, right: 25.0, left: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Let\'s sign you in.',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 40.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Welcome back.\nYou\'ve been missed!',
                    style: TextStyle(
                      color: Color(0xb3FFFFFF),
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: InputField(
                      textEditingController: _emailController,
                      hintText: 'Email',
                      obscureText: false,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: InputField(
                      textEditingController: _passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
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
                    onTap: () async {
                      var checkSignedIn = await context
                          .read<AuthenticationService>()
                          .signIn(_emailController.text.trim(),
                              _passwordController.text.trim());
                      if (checkSignedIn == 'Signed In Completed') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TasksScreen()),
                        );
                      } else {
                        Alert(
                          style: AlertStyle(backgroundColor: Color(0xFFFFFFFF)),
                          context: context,
                          title: "Error!",
                          desc: checkSignedIn,
                        ).show();
                      }
                    },
                    buttonTitle: 'Sign In',
                    buttonColor: Color(0xffFFFFFF),
                    titleColor: Color(0xff333333),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
