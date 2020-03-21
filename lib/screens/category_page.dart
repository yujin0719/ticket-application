import 'package:flutter/material.dart';
import 'package:ticket_app/constant/color.dart';
import 'package:ticket_app/widgets/category_list.dart';

void main() {
  runApp(new MaterialApp(
    home: new CategoryPage(),
  ));
}

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => new _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text(
    "검색어를 입력해주세요.",
    style: TextStyle(color: t_main, fontSize: 16.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: t_main,
            title: PreferredSize(
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
            bottom: TabBar(
              labelColor: t_bg,
              labelStyle: TextStyle(fontWeight: FontWeight.w600),
              unselectedLabelColor: Colors.black87,
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w300),
              tabs: <Widget>[
                Tab(text: "콘서트"),
                Tab(text: "스포츠"),
                Tab(text: "뮤지컬/연극"),
                Tab(text: "기타"),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              CategoryList(),
              CategoryList(),
              CategoryList(),
              CategoryList(),
            ],
          ),
        ),
      ),
    );
  }
}
