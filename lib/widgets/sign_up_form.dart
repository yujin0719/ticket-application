import 'package:flutter/material.dart';
import 'package:ticket_app/constant/color.dart';
import 'package:ticket_app/main_page.dart';
import 'package:ticket_app/utils/simple_snackbar.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _cpwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    _cpwController.dispose();
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
              SizedBox(height: 15),
              TextFormField(
                  controller: _cpwController,
                  decoration: getTextFieldDecor("비밀번호 확인", "비밀번호를 한번 더 입력해주세요"),
                  validator: (String value) {
                    if (value.isEmpty || value != _pwController.value.text) {
                      return '비밀번호가 일치하지 않습니다.';
                    }
                    return null;
                  }),
              SizedBox(height: 30),
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
                    child: Text("가입하기",
                        style: TextStyle(color: Colors.white, fontSize: 17)),
                    color: t_main,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    disabledColor: Colors.blue[100]),
              ),
              SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                      left: 0,
                      right: 0,
                      height: 1,
                      child: Container(color: Colors.grey[300], height: 1)),
                  Container(height: 3, width: 50, color: Colors.grey[50]),
                  Text("OR",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 20),
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
