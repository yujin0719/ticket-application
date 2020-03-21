import 'package:flutter/material.dart';
import 'package:ticket_app/constant/color.dart';
import 'package:ticket_app/screens/account_page.dart';
import 'package:ticket_app/screens/home_page.dart';
import 'package:ticket_app/screens/sale_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  int _selectedIndex = 1;

  static List<Widget> _widgetOptions = <Widget>[
    AccountPage(),
    HomePage(),
    SalePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: t_main,
        unselectedItemColor: t_grey2,
        type: BottomNavigationBarType.fixed,
        backgroundColor: t_lb,
        items: [
          _buildBottomNavigationBarItem(
              activeIconPath: "assets/user.png",
              iconPath: "assets/user_selected.png",
              title: '마이페이지'),
          _buildBottomNavigationBarItem(
              activeIconPath: "assets/home.png",
              iconPath: "assets/home_selected.png",
              title: '홈'),
          _buildBottomNavigationBarItem(
              activeIconPath: "assets/ticket.png",
              iconPath: "assets/ticket_selected.png",
              title: '티켓판매'),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(index),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      {String activeIconPath, String iconPath, String title}) {
    return BottomNavigationBarItem(
      activeIcon:
          activeIconPath == null ? null : ImageIcon(AssetImage(activeIconPath)),
      icon: ImageIcon(AssetImage(iconPath)),
      title: Text(title),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
