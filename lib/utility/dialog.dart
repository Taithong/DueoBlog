import 'package:flutter/material.dart';

Future<Null> normalDialog(
    BuildContext context, String title, String message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        leading: Image.asset('assets/images/logo.png', width: 90),
        title: Text(title, style: TextStyle(color: Color(0xff181B3B), fontSize: 18, fontWeight: FontWeight.bold),),
        subtitle: Text(message, style: TextStyle(color: Color(0xffF47C20)),),
      ),
      children: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('Ok'))
      ],
    ),
  );
}