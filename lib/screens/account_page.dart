import 'package:flutter/material.dart';
import 'package:ticket_app/constant/color.dart';
import 'package:ticket_app/screens/category_page.dart';
import 'package:ticket_app/screens/sale_page.dart';
import 'package:ticket_app/widgets/appbar.dart';
import 'package:ticket_app/widgets/profile_side_menu.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage>
    with SingleTickerProviderStateMixin {
  bool _menuOpened = false;
  AlignmentGeometry tabAlign = Alignment.centerLeft;

  String imagePath1 = "assets/pencil.png";
  String imagePath2 = "assets/settings.png";
  String imagePath3 = "assets/alram.png";

  String imageDoc1 = "수정";
  String imageDoc2 = "환경";
  String imageDoc3 = "알림";

  double menuWidth;
  var size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    menuWidth = size.width / 1.5;
    return Scaffold(
      appBar: appbar(),
      body: Stack(
        children: <Widget>[
          _sideMenu(),
          _profile(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _menuOpened = !_menuOpened;
          });
        },
      ),
    );
  }

  Widget _sideMenu() {
    return AnimatedContainer(
      width: menuWidth,
      curve: Curves.easeInOut,
      color: Colors.grey[200],
      duration: Duration(milliseconds: 200),
      transform: Matrix4.translationValues(
          _menuOpened ? size.width - menuWidth : size.width, 0, 0),
      child: SafeArea(
        child: SizedBox(
          width: menuWidth,
          child: ProfileSideMenu(),
        ),
      ),
    );
  }

  AnimatedContainer _profile(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      color: Colors.transparent,
      duration: Duration(milliseconds: 200),
      transform: Matrix4.translationValues(_menuOpened ? -menuWidth : 0, 0, 0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _accountInfo(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _settingList(imagePath1, imageDoc1),
                  _settingList(imagePath2, imageDoc2),
                  _settingList(imagePath3, imageDoc3),
                ],
              ),
            ),
            _saleBox(context),
          ],
        ),
      ),
    );
  }

  Row _saleBox(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                color: t_bg,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            width: MediaQuery.of(context).size.width / 2.3,
            height: MediaQuery.of(context).size.height / 4,
            child: Center(
                child: FlatButton(
              onPressed: () => _openCategoryPage(context),
              child: Text(
                '구매하기',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w600, color: t_grey),
              ),
            ))),
        Container(
          decoration: BoxDecoration(
              color: t_bg,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          width: MediaQuery.of(context).size.width / 2.3,
          height: MediaQuery.of(context).size.height / 4,
          child: Center(
              child: FlatButton(
            onPressed: () => _openSalePage(context),
            child: Text(
              '구매목록',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w600, color: t_grey),
            ),
          )),
        ),
      ],
    );
  }

  _openSalePage(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => SalePage()));

  _openCategoryPage(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => CategoryPage()));

  Column _accountInfo() {
    return Column(
      children: <Widget>[
        Image.asset(
          "assets/login_user.png",
          color: t_icon,
          height: 100,
          width: 100,
        ),
        FlatButton(
          child: Text(
            '로그인',
            style: TextStyle(
                fontSize: 20.0, color: t_icon, fontWeight: FontWeight.w500),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Column _settingList(String str1, String str2) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Image.asset(
            str1,
            color: t_icon,
          ),
          onPressed: () {
            setState(() {});
          },
        ),
        Text(
          str2,
          style: TextStyle(
              fontSize: 18.0, color: t_icon, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
