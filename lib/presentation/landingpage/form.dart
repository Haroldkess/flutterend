import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final int maxLine;
  final TextEditingController controller;

  const TextFieldWidget({
    Key? key,
    required this.title,
    required this.maxLine,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Colors.black;

    return SizedBox(
    //  height: 50,
      child: TextFormField(
        controller: controller,
        maxLines: maxLine,
        style: TextStyle(color: color),
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color: color),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
