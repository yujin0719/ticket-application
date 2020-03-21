import 'package:flutter/material.dart';
import 'package:ticket_app/constant/color.dart';
import 'package:ticket_app/widgets/sign_in_form.dart';
import 'package:ticket_app/widgets/sign_up_form.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  Widget currentWidget = SignInForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            AnimatedSwitcher(
                duration: Duration(milliseconds: 300), child: currentWidget),
            _goToSignUpPageBtn(context)
          ],
        ),
      ),
    );
  }

  Positioned _goToSignUpPageBtn(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: 40,
      child: FlatButton(
        shape: Border(top: BorderSide(color: t_bg)),
        onPressed: () {
          setState(() {
            if (currentWidget is SignInForm)
              currentWidget = SignUpForm();
            else
              currentWidget = SignInForm();
          });
        },
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(style: const TextStyle(), children: <TextSpan>[
            TextSpan(
                text: (currentWidget is SignUpForm)
                    ? "Don't have an account?  "
                    : "Already have an account?  ",
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.black54)),
            TextSpan(
                text: (currentWidget is SignInForm) ? "Sign Up" : "Sign In",
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black87)),
          ]),
        ),
      ),
    );
  }
}
