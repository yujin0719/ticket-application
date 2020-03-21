import 'package:flutter/material.dart';
import 'package:ticket_app/constant/color.dart';
import 'package:ticket_app/widgets/appbar.dart';

class SaleRegisterPage extends StatefulWidget {
  @override
  _SaleRegisterPageState createState() => _SaleRegisterPageState();
}

class _SaleRegisterPageState extends State<SaleRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        width: 30, height: 30, color: t_main),
                    label: Text(
                      "티켓정보",
                      style: TextStyle(color: t_main),
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
                        width: 30, height: 30, color: t_grey2),
                    label: Text("등록완료", style: TextStyle(color: t_grey2))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
