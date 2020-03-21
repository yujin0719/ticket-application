import 'package:flutter/material.dart';
import 'package:ticket_app/constant/color.dart';
import 'package:ticket_app/main_page.dart';

class CompletePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "티켓 예약이 완료되었습니다.",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "판매자의 연락을 기다리세요.",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: t_grey2, fontSize: 18),
              ),
              IconButton(
                  iconSize: 80,
                  icon: Icon(Icons.done_outline, color: t_main),
                  onPressed: () {
                    final route =
                        MaterialPageRoute(builder: (context) => MainPage());
                    Navigator.pushReplacement(context, route);
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
