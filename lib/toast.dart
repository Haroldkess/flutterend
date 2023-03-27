import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Future<void> showToast(
    BuildContext context, String message, String color) async {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16.0),
    ),

    elevation: 20,
    behavior: SnackBarBehavior.floating,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    width: 300,

    //shape: StadiumBorder(),
    backgroundColor: HexColor(color),
  ));
}
