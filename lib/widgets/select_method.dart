import 'package:flutter/material.dart';
import 'package:ticket_app/constant/color.dart';
import 'package:ticket_app/widgets/appbar.dart';
import 'package:ticket_app/widgets/custom_radio.dart';

class SelectMethod extends StatefulWidget {
  @override
  _SelectMethodState createState() => _SelectMethodState();
}

class _SelectMethodState extends State<SelectMethod> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomRadio(),
    );
  }

}

