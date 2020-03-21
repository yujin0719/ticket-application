import 'package:flutter/material.dart';
import 'package:ticket_app/constant/color.dart';
import 'package:ticket_app/screens/sale_complete_page.dart';
import 'package:ticket_app/widgets/appbar.dart';

class CustomRadio extends StatefulWidget {
  @override
  createState() {
    return new CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadio> {
  List<RadioModel> sampleData = new List<RadioModel>();
  var num = [
    '서울특별시',
    '부산광역시',
    '대구광역시',
    '인천광역시',
    '광주광역시',
    '대전광역시',
    '울산광역시',
    '경기도',
    '강원도',
    '충청북도',
    '충청남도',
    '전라북도',
    '전라남도',
    '경상북도',
    '경상남도',
    '제주도',
    '세종특별시'
  ];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(new RadioModel(false, '택배(착불)', ''));
    sampleData.add(new RadioModel(false, '직거래', ''));
  }

  TextEditingController _controller = TextEditingController();

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                        width: 30, height: 30, color: t_main),
                    label: Text("거래방식", style: TextStyle(color: t_main))),
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
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: Text(
                          "거래방식",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.black87),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: 200,
                        child: GridView.builder(
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return new InkWell(
                              onTap: () {
                                setState(() {
                                  sampleData.forEach(
                                      (element) => element.isSelected = false);
                                  sampleData[index].isSelected = true;
                                });
                              },
                              child: new RadioItem(sampleData[index]),
                            );
                          },
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: Text(
                          "지역",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.black87),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                        ),
                      ),
                      PopupMenuButton<String>(
                        icon: Icon(Icons.arrow_drop_down),
                        initialValue: _controller.text = '도시를 선택하세요.',
                        onSelected: (String value) {
                          _controller.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          return num.map<PopupMenuItem<String>>((String value) {
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
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          _bookBtn(context),
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
            MaterialPageRoute(builder: (context) => SaleCompletePage());
            Navigator.pushReplacement(context, route);
          }
        },
        child: Text(
          "입력완료",
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

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(2.0),
      child: new Row(
        children: <Widget>[
          new Container(
            height: 40.0,
            width: 90.0,
            child: new Center(
              child: new Text(_item.buttonText,
                  style: new TextStyle(
                      color: _item.isSelected ? Colors.white : t_grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0)),
            ),
            decoration: new BoxDecoration(
              color: _item.isSelected ? t_main : Colors.transparent,
              border: new Border.all(
                  width: 1.0, color: _item.isSelected ? t_main : Colors.grey),
              borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(left: 2.0),
            child: new Text(_item.text),
          )
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String text;

  RadioModel(this.isSelected, this.buttonText, this.text);
}
