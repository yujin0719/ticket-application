import 'package:flutter/material.dart';
import 'package:ticket_app/constant/color.dart';
import 'package:ticket_app/main_page.dart';
import 'package:ticket_app/widgets/appbar.dart';

class SaleCompletePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: t_bg,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton.icon(
                    onPressed: null,
                    icon: Image.asset("assets/selected1.png",
                        width: 30, height: 30, color: t_grey2),
                    label: Text(
                      "티켓정보",
                      style: TextStyle(color: t_grey2),
                    )),
                Image.asset("assets/more.png",
                    width: 25, height: 25, color: t_grey2),
                FlatButton.icon(
                    onPressed: null,
                    icon: Image.asset("assets/selected2.png",
                        width: 30, height: 30, color: t_grey2),
                    label: Text("거래방식", style: TextStyle(color: t_grey2))),
                Image.asset("assets/more.png",
                    width: 25, height: 25, color: t_grey2),
                FlatButton.icon(
                    onPressed: null,
                    icon: Image.asset("assets/selected3.png",
                        width: 30, height: 30, color: t_main),
                    label: Text("등록완료", style: TextStyle(color: t_main))),
              ],
            ),
          ),
          SizedBox(height: 200),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "티켓 등록이 완료되었습니다.",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "구매자의 예약을 기다리세요.",
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
          )
        ],
      ),
    );
  }
}
