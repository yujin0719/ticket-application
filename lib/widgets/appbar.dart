import 'package:flutter/material.dart';
import 'package:ticket_app/constant/color.dart';

AppBar appbar() {
  return AppBar(
    backgroundColor: t_main,
    title: Text(
      "Honor Ticket",
      style: TextStyle(
        color: white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
