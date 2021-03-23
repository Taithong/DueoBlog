import 'package:dueoblog/screen/information.dart';
import 'package:dueoblog/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:dueoblog/screen/home.dart';
import 'package:dueoblog/screen/login.dart';
import 'package:dueoblog/screen/ForgotPassword.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Dueo Blog',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange, fontFamily: 'BoonBaan-Bold',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Login(),
      routes: <String, WidgetBuilder>{
        '/login': (_) => Login(),
        '/home': (_) => Home(),
        '/register': (_) => Register(),
        '/information': (_) => Information(),
        '/ForgotPassword': (_) => ForgotPassword(),
      },
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Home(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}