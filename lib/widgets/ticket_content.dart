import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/constant/color.dart';
import 'package:ticket_app/screens/complete_page.dart';
import 'package:ticket_app/widgets/appbar2.dart';

class TicketContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar2("티켓구매하기"),
      body: Column(
        children: <Widget>[
          _seatInfo(context),
          _ticketInfo(context),
          _bookBtn(context),
        ],
      ),
    );
  }

  SizedBox _bookBtn(BuildContext context) {
    return SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 50,
          child: FlatButton(
              onPressed: () => _openCompletePage(context),
              child: Text("예약하기",
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              color: t_main,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              disabledColor: Colors.blue[100]),
        );
  }

  _openCompletePage(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => CompletePage()));

  Column _seatInfo(BuildContext context) {
    return Column(
      children: <Widget>[
        _picture('https://fimg4.pann.com/new/download.jsp?FileID=48940301'),
        _ticketName(context),
      ],
    );
  }

  Container _ticketInfo(BuildContext context) {
    return Container(
          height: 300,
          child: ListView(
            children:
                ListTile.divideTiles(context: context, tiles: [
                  ListTile(
                    title: RichText(
                      text: TextSpan(style: const TextStyle(), children: <TextSpan>[
                        TextSpan(
                          text: "일시", style: TextStyle(fontWeight: FontWeight.w800,color: Colors.black87)
                        ),
                        TextSpan(
                            text: "           "
                        ),
                        TextSpan(
                            text: "2019년 2월 25일 19:00", style: TextStyle(fontWeight: FontWeight.w400,color: t_grey)
                        ),
                      ])
                    ),
                  ), ListTile(
                    title: RichText(
                      text: TextSpan(style: const TextStyle(), children: <TextSpan>[
                        TextSpan(
                          text: "장소", style: TextStyle(fontWeight: FontWeight.w800,color: Colors.black87)
                        ),
                        TextSpan(
                            text: "           "
                        ),
                        TextSpan(
                            text: "잠실종합운동장 주경기장0", style: TextStyle(fontWeight: FontWeight.w400,color: t_grey)
                        ),
                      ])
                    ),
                  ), ListTile(
                    title: RichText(
                      text: TextSpan(style: const TextStyle(), children: <TextSpan>[
                        TextSpan(
                          text: "가격", style: TextStyle(fontWeight: FontWeight.w800,color: Colors.black87)
                        ),
                        TextSpan(
                            text: "           "
                        ),
                        TextSpan(
                            text: "₩ 110,000", style: TextStyle(fontWeight: FontWeight.w400,color: t_grey)
                        ),
                      ])
                    ),
                  ), ListTile(
                    title: RichText(
                      text: TextSpan(style: const TextStyle(), children: <TextSpan>[
                        TextSpan(
                          text: "거래방식", style: TextStyle(fontWeight: FontWeight.w800,color: Colors.black87)
                        ),
                        TextSpan(
                            text: "     "
                        ),
                        TextSpan(
                            text: "배송(착불)/직거래(서울)", style: TextStyle(fontWeight: FontWeight.w400,color: t_grey)
                        ),
                      ])
                    ),
                  ),
                ]).toList(),
          ));
  }

  Container _ticketName(BuildContext context) {
    return Container(
      color: t_bg,
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "BTS WORLD TOUR' LOVE YOURSELF' B구역 1열",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Container _picture(String pictureUrl) {
    return Container(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: CachedNetworkImage(
          imageUrl: pictureUrl,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          imageBuilder: (BuildContext context, ImageProvider imageProvider) =>
              AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            ),
          ),
        ),
      ),
    );
  }
}
