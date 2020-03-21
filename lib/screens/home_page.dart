import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ticket_app/constant/color.dart';
import 'package:ticket_app/screens/category_page.dart';
import 'package:ticket_app/widgets/ticket_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text(
    "검색어를 입력해주세요.",
    style: TextStyle(color: t_main, fontSize: 16.0),
  );

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
          bottom: PreferredSize(
            preferredSize: Size(50, 50),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(8.0)),
                width: MediaQuery.of(context).size.width * 0.95,
                height: 40,
                alignment: Alignment.centerLeft,
                child: FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      if (this.cusIcon.icon == Icons.search) {
                        this.cusSearchBar = Expanded(
                            child: TextField(
                          textInputAction: TextInputAction.go,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "검색어를 입력해주세요."),
                        ));
                        this.cusIcon = Icon(Icons.cancel);
                      } else {
                        this.cusIcon = Icon(Icons.search);
                        this.cusSearchBar = Text(
                          "검색어를 입력해주세요.",
                          style: TextStyle(color: t_main, fontSize: 16.0),
                        );
                      }
                    });
                  },
                  icon: cusIcon,
                  color: white,
                  label: cusSearchBar,
                ),
              ),
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            _hot(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: _newTicket(),
            ),
            _space(),
            _divider(),
            _kPop(),
            _kopList(context),
            _space(),
            _divider(),
            _sport(),
            _sportList(context),
            _space(),
            _divider(),
            _musical(),
            _musicalList(context),
          ],
        ));
  }

  CarouselSlider _sportList(BuildContext context) {
    return CarouselSlider(
      height: MediaQuery.of(context).size.height / 10,
      viewportFraction: 0.25,
      reverse: true,
      items: ["KBO", "KBL", "K-리그", "E-스포츠", "기타"].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return FlatButton(
              onPressed: () {},
              color: t_main,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              child: Text(
                '$i',
                style: TextStyle(
                    fontSize: 18.0, color: white, fontWeight: FontWeight.w400),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  CarouselSlider _musicalList(BuildContext context) {
    return CarouselSlider(
      height: MediaQuery.of(context).size.height / 10,
      viewportFraction: 0.25,
      reverse: true,
      items: ["그날들", "라이온", "엘리자벳", "영웅", "팬덤", "호프"].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return FlatButton(
              onPressed: () {},
              color: t_main,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              child: Text(
                '$i',
                style: TextStyle(
                    fontSize: 18.0, color: white, fontWeight: FontWeight.w400),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  CarouselSlider _kopList(BuildContext context) {
    return CarouselSlider(
      height: MediaQuery.of(context).size.height / 10,
      viewportFraction: 0.25,
      reverse: true,
      items: ["BTS", "레드벨벳", "트와이스", "EXO", "지코", "아이유"].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return FlatButton(
              onPressed: () {},
              color: t_main,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              child: Text(
                '$i',
                style: TextStyle(
                    fontSize: 18.0, color: white, fontWeight: FontWeight.w400),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Padding _hot() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 25, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "HOT",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w800, color: t_black),
          ),
        ],
      ),
    );
  }

  Padding _kPop() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "K-POP",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w800, color: t_black),
          ),
          FlatButton(
            child: Text(
              "View More",
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w600, color: t_main),
            ),
            onPressed: () => _openCategory(context),
          ),
        ],
      ),
    );
  }

  Padding _sport() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "스포츠",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w900, color: t_black),
          ),
          FlatButton(
            child: Text(
              "View More",
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w600, color: t_main),
            ),
            onPressed: () =>_openCategory(context),
          ),
        ],
      ),
    );
  }

  Padding _musical() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "뮤지컬/연극",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w900, color: t_black),
          ),
          FlatButton(
            child: Text(
              "View More",
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w600, color: t_main),
            ),
            onPressed: ()  =>_openCategory(context),
          ),
        ],
      ),
    );
  }

  _openCategory(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => CategoryPage()));


  Divider _divider() => Divider(color: t_lb);

  SizedBox _space() {
    return SizedBox(
      height: 20.0,
    );
  }

  Stack _newTicket() {
    return Stack(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl:
              'https://image.bugsm.co.kr/artist/images/1000/800793/80079394.jpg',
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          imageBuilder: (BuildContext context, ImageProvider imageProvider) =>
              AspectRatio(
            aspectRatio: 1.5,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 130, 2, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("지금가장",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: white,
                      fontSize: 30.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("인기있는 티켓은?",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: white,
                          fontSize: 30.0)),
                  FlatButton(
                    child: Text(
                      "바로가기  >>",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: white),
                    ),
                    onPressed: () => _openListPage(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  _openListPage(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => TicketList()));
}
