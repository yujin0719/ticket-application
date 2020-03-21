import 'package:flutter/material.dart';
import 'package:ticket_app/constant/color.dart';

AppBar appbar2(String name) {
  return AppBar(
      backgroundColor: white,
      title: Text(
        name,
        style: TextStyle(color: t_main, fontWeight: FontWeight.w700),
      ));
}
