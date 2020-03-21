import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/constant/color.dart';
import 'package:ticket_app/widgets/appbar2.dart';
import 'package:ticket_app/widgets/ticket_content.dart';

class TicketList extends StatefulWidget {
  @override
  _TicketListState createState() => _TicketListState();
}

class _TicketListState extends State<TicketList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar2("티켓목록"),
      body: Column(
        children: <Widget>[
          _aboutTicket(context),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "BTS WORLD TOUR' LOVE YOURSELF' B구역 $index열",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          ),
                          Text("19/02/25 19:00 | 배송, 직거래",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, color: t_grey2)),
                          SizedBox(
                            height: 10,
                          ),
                          Text("110,000",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, color: t_main)),
                        ],
                      ),
                      IconButton(
                          onPressed: () => _openTicketContentPage(context),
                          icon: Icon(Icons.arrow_forward_ios, color: t_main))
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(color: t_grey2);
              },
            ),
          )
        ],
      ),
    );
  }

  Stack _aboutTicket(BuildContext context) {
    return Stack(
      children: <Widget>[
        _picture(
            'https://img.sbs.co.kr/newimg/news/20190623/201326999_1280.jpg'),
        Container(
          height: MediaQuery.of(context).size.width * (2 / 3),
          color: t_grey.withOpacity(0.5),
        ),
        //_name("방탄 소년단(BTS)"),
      ],
    );
  }

  CachedNetworkImage _picture(String pictureUrl) {
    return CachedNetworkImage(
      imageUrl: pictureUrl,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
      imageBuilder: (BuildContext context, ImageProvider imageProvider) =>
          AspectRatio(
        aspectRatio: 1.5,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
        ),
      ),
    );
  }

  _openTicketContentPage(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => TicketContent()));

  Padding _name(String name) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 210, 0, 0),
      child: Text(
        name,
        style: TextStyle(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700),
      ),
    );
  }
}
