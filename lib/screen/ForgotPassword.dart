import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  static String id = 'forgot-password';
  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFBE9),
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        child: ListView(
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 200,
              ),
            ),
            Card(
              margin: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 20),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Form(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ປ້ອນອີເມວ໌',
                          style:
                              TextStyle(fontSize: 30, color: Color(0xff181B3B)),
                        ),
                        TextFormField(
                          style: TextStyle(color: Color(0xffF47C20)),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            icon: Icon(
                              Icons.mail,
                              color: Color(0xffF47C20),
                            ),
                            errorStyle: TextStyle(color: Color(0xffF47C20)),
                            labelStyle: TextStyle(color: Color(0xffF47C20)),
                            hintStyle: TextStyle(color: Color(0xffF47C20)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffF47C20)),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffF47C20)),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffF47C20)),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 20, 20, 40),
                          child: MaterialButton(
                            minWidth: (300),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: Color(0XFF181b3b),
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                'ສົ່ງອີເມວ໌',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                            onPressed: () {
                              FirebaseAuth.instance.sendPasswordResetEmail(email: email);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        FlatButton(
                          child: Text('ເຂົ້າສູ່ງລະບົບ'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
