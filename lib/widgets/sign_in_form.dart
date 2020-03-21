import 'package:flutter/material.dart';
import 'package:ticket_app/constant/color.dart';
import 'package:ticket_app/main_page.dart';
import 'package:ticket_app/utils/simple_snackbar.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              Text(
                "Honor Ticket",
                style: TextStyle(
                    color: t_main, fontSize: 40, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 60,
              ),
              TextFormField(
                controller: _emailController,
                decoration: getTextFieldDecor("아이디", "아이디를 입력해주세요."),
                validator: (String value) {
                  if (value.isEmpty || !value.contains('@')) {
                    return '정확한 아이디를 입력해주세요!';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _pwController,
                decoration: getTextFieldDecor("비밀번호", "비밀번호를 입력해주세요."),
                validator: (String value) {
                  if (value.isEmpty) {
                    return '올바른 비밀번호를 입력해주세요!';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "비밀번호를 잊어버렸나요?",
                textAlign: TextAlign.end,
                style: TextStyle(color: t_main, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      final route =
                          MaterialPageRoute(builder: (context) => MainPage());
                      Navigator.pushReplacement(context, route);
                    }
                  },
                  child: Text(
                    "로그인",
                    style: TextStyle(color: t_grey, fontSize: 17),
                  ),
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  disabledTextColor: t_main,
                  disabledColor: t_main,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    left: 0,
                    right: 0,
                    height: 1,
                    child: Container(
                      color: Colors.grey[300],
                      height: 1,
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 50,
                    color: Colors.grey[50],
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 2),
              FlatButton.icon(
                textColor: Color(0xffED4439),
                onPressed: () {
                  simpleSnackbar(context, 'google pressed');
                },
                icon: ImageIcon(AssetImage("assets/google.png")),
                label: Text("Login with google"),
              ),
              FlatButton.icon(
                textColor: Color(0xff4267B2),
                onPressed: () {
                  simpleSnackbar(context, 'facebook pressed');
                },
                icon: ImageIcon(AssetImage("assets/facebook.png")),
                label: Text("Login with Facebook"),
              ),
              SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration getTextFieldDecor(String name, String hint) {
    return InputDecoration(
      labelText: name,
      labelStyle: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
      hintText: hint,
      hintStyle: TextStyle(color: t_grey2, fontWeight: FontWeight.w600),
    );
  }
}
