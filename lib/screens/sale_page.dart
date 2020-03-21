import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:ticket_app/constant/color.dart';
import 'package:ticket_app/screens/sale_register_page.dart';
import 'package:ticket_app/widgets/insert_info.dart';

class SalePage extends StatefulWidget {
  @override
  _SalePageState createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: t_main,
        title: Text(
          "Honor Ticket",
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _registerTicket(context),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 8.0,
                color: t_bg),
            Expanded(
              child: Container(
                color: white,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("판매중인 티켓",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 14)),
                      Container(
                        color: white,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 5,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            _plusTicket("BTS WORLD TOUR LOVE YOURESELF"),
                            _plusTicket("2020 싸이 흠뻑쇼"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 8.0,
                color: t_bg),
            Expanded(
              child: Container(
                color: white,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("판매완료된 티켓",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 14)),
                      Container(
                        color: white,
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            "판매완료된 티켓이 존재하지 않습니다.",
                            style: TextStyle(color: t_grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        margin: EdgeInsets.all(15.00),
      ),
    );
  }

  Container _registerTicket(BuildContext context) {
    return Container(
      color: white,
      width: MediaQuery.of(context).size.width,
      height: 160,
      child: Center(
        child: Container(
          height: 120,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6), color: t_bg),
          child: FlatButton.icon(
            onPressed: () => _openSaleRegisterPage(context),
            icon: Icon(
              Icons.add_circle_outline,
              color: t_grey,
              size: 40,
            ),
            label: Text(
              "새로운 티켓을 등록하기",
              style: TextStyle(color: t_grey),
            ),
          ),
        ),
      ),
    );
  }

  _openSaleRegisterPage(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => InsertInfo()));

  RaisedButton _plusTicket(String ticketName) {
    return RaisedButton(
      color: t_main,
      onPressed: () {},
      child: Text(
        ticketName,
        style: TextStyle(color: white),
      ),
    );
  }
}
