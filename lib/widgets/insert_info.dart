import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticket_app/constant/color.dart';
import 'package:ticket_app/widgets/appbar.dart';
import 'package:ticket_app/widgets/select_method.dart';
class InsertInfo extends StatefulWidget {
  @override
  _InsertInfoState createState() => _InsertInfoState();
}

class _InsertInfoState extends State<InsertInfo> {
  var categories = ['콘서트', '스포츠', '뮤지컬/연극', '기타'];
  var num = ['1','2','3','4'];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();
  TextEditingController _controller5 = TextEditingController();
  TextEditingController _controllerCate = TextEditingController();
  TextEditingController _controllerNum = TextEditingController();

  String _selectedDate = '일시를 입력하세요.';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate:  DateTime(2019),
      lastDate: DateTime(2100),
    );
    if (d != null)
      setState(() {
        _selectedDate = new DateFormat.yMMMMd("en_US").format(d);
      });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controllerCate.dispose();
    _controllerNum.dispose();
    super.dispose();
  }

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
          Form(
            key: _formKey,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,20,0,70),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: RichText(
                                text: TextSpan(style: TextStyle(), children: <TextSpan>[
                              TextSpan(
                                  text: "티켓정보 입력  ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black87,
                                      fontSize: 26)),
                              TextSpan(
                                  text: "필수항목",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, color: t_grey)),
                            ])),
                          ),
                          Container(color: t_grey, height: 1),
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.28,
                                    child: Text(
                                      "카테고리",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black87),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: _controllerCate,
                                    ),
                                  ),
                                  PopupMenuButton<String>(
                                    icon: Icon(Icons.arrow_drop_down),
                                    initialValue: _controllerCate.text = '카테고리를 선택하세요.',
                                    onSelected: (String value) {
                                      _controllerCate.text = value;
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return categories
                                          .map<PopupMenuItem<String>>((String value) {
                                        return new PopupMenuItem(
                                            child: new Text(value,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: t_grey)),
                                            value: value);
                                      }).toList();
                                    },
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.28,
                                    child: Text(
                                      "상품명",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black87),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _controller1,
                                      decoration: const InputDecoration(
                                        hintText: '상품명을 입력하세요.',
                                      ),
                                      onSaved: (value) {
                                        print('Name field onSaved:$value');
                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return '상품명을 입력하세요';
                                        }
                                        return null;
                                      },
                                      onFieldSubmitted: (value) {
                                        print('완료:$value');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.28,
                                    child: Text(
                                      "일시",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black87),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                            top: BorderSide(width: 1.0, color: Colors.black87),
                                            left: BorderSide(width: 1.0, color: Colors.black87),
                                            right: BorderSide(width: 1.0, color: Colors.black87),
                                            bottom: BorderSide(width: 1.0, color: Colors.black87),
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            InkWell(
                                              child: Text(
                                                  _selectedDate,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(color: Colors.black87)
                                              ),
                                              onTap: (){
                                                _selectDate(context);
                                              },
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.calendar_today,color: t_grey2,),
                                              onPressed: () {
                                                _selectDate(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ),
                                ],
                              ),Row(
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.28,
                                    child: Text(
                                      "장소",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black87),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _controller3,
                                      decoration: const InputDecoration(
                                        hintText: '장소를 입력하세요.',
                                      ),
                                      onSaved: (value) {
                                        print('Name field onSaved:$value');
                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return '장소를 입력하세요.';
                                        }
                                        return null;
                                      },
                                      onFieldSubmitted: (value) {
                                        print('완료:$value');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.28,
                                    child: Text(
                                      "수량",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black87),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: _controllerNum,
                                    ),
                                  ),
                                  PopupMenuButton<String>(
                                    icon: Icon(Icons.arrow_drop_down),
                                    initialValue: _controllerNum.text = '0장',
                                    onSelected: (String value) {
                                      _controllerNum.text = value;
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return num
                                          .map<PopupMenuItem<String>>((String value) {
                                        return new PopupMenuItem(
                                            child: new Text(value,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: t_grey)),
                                            value: value);
                                      }).toList();
                                    },
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.28,
                                    child: Text(
                                      "자석위치",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black87),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _controller4,
                                      decoration: const InputDecoration(
                                        hintText: '좌석구열을 입력하세요.',
                                      ),
                                      onSaved: (value) {
                                        print('Name field onSaved:$value');
                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return '좌석을 입력하세요';
                                        }
                                        return null;
                                      },
                                      onFieldSubmitted: (value) {
                                        print('완료:$value');
                                      },
                                    ),
                                  ),
                                ],
                              ),Row(
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.28,
                                    child: Text(
                                      "가격",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black87),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _controller5,
                                      decoration: const InputDecoration(
                                        hintText: '가격을 입력하세요.',
                                      ),
                                      onSaved: (value) {
                                        print('Name field onSaved:$value원');
                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return '가격을 입력하세요';
                                        }
                                        return null;
                                      },
                                      onFieldSubmitted: (value) {
                                        print('완료:$value');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    _bookBtn(context),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  SizedBox _bookBtn(BuildContext context) {
    return SizedBox(height: 50,
      width: 300,
      child: FlatButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            final route =
            MaterialPageRoute(builder: (context) => SelectMethod());
            Navigator.pushReplacement(context, route);
          }
        },
        child: Text(
          "입력",
          style: TextStyle(color: white, fontSize: 17),
        ),
        color: t_main,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6)),
        disabledTextColor: t_main,
        disabledColor: t_main,
      ),
    );
  }
}

