import 'package:flutter/material.dart';
import 'package:todolist/authentication_service.dart';
import 'package:todolist/views/task_screen.dart';
import 'package:todolist/widgets/custom_button.dart';
import 'package:todolist/widgets/input_field.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegisterAccount extends StatefulWidget {
  @override
  _RegisterAccountState createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Let\'s register you in.',
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
                    'Hello there.\nYou\'ve been glad using Todolist!',
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
                      textEditingController: emailController,
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
                      textEditingController: passwordController,
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
                      var checkSignedUp = await context
                          .read<AuthenticationService>()
                          .signUp(emailController.text.trim(),
                              passwordController.text.trim());
                      if (checkSignedUp == 'Register Completed') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TasksScreen()));
                      } else {
                        Alert(
                          style: AlertStyle(backgroundColor: Color(0xFFFFFFFF)),
                          context: context,
                          title: "Error!",
                          desc: checkSignedUp,
                        ).show();
                      }
                    },
                    buttonTitle: 'Register',
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
