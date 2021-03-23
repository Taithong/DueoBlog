import 'package:dueoblog/utility/dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name, email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ສະໝັກສະມາຊິກ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0XFF181b3b),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            margin: EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 20),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Center(
                    child: Text(
                      'ລົງທະບຽນ',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xffF47C20),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0XFFF8F8F8),
                  ),
                  child: TextFormField(
                    onChanged: (value) => name = value.trim(),
                    decoration: const InputDecoration(
                      hintText: 'ຊື່ຜູ້ໃຊ້',
                      prefixIcon: Icon(
                        Icons.person,
                        size: 20,
                        color: Color(0XFF91A6A6),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          top: 20, left: 15, right: 15, bottom: 15),
                    ),
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0XFFF8F8F8),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => email = value.trim(),
                    decoration: const InputDecoration(
                      hintText: 'ອີເມວ໌',
                      prefixIcon: Icon(
                        Icons.mail,
                        size: 20,
                        color: Color(0XFF91A6A6),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          top: 20, left: 15, right: 15, bottom: 15),
                    ),
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0XFFF8F8F8),
                  ),
                  child: TextFormField(
                    onChanged: (value) => password = value.trim(),
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'ລະຫັດຜ່ານ',
                      prefixIcon: Icon(
                        Icons.vpn_key,
                        size: 20,
                        color: Color(0XFF91A6A6),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          top: 20, left: 15, right: 15, bottom: 15),
                    ),
                    style: TextStyle(fontSize: 17),
                  ),
                ),
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
                        'ສ້າງບັນຊີ',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      if ((name?.isEmpty ?? true) ||
                          (email?.isEmpty ?? true) ||
                          (password?.isEmpty ?? true)) {
                        normalDialog(context, 'ມີຊ່ອງວ່າງ',
                            'ກາລຸນາຕື່ມຂໍ້ມູນໃຫ້ຄົບຖ້ວນ');
                      } else {
                        createAccountAndInsertInformation();
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Center(
                          child: Text(
                            'ມີບັນຊີແລ້ວ?',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Center(
                          child: InkWell(
                            child: Text(
                              'ເຂົ້າສູ່ລະບົບ',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xffF47C20),
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<Null> createAccountAndInsertInformation() async {
    await Firebase.initializeApp().then((value) async {
      //print('## Firebase Initialize Success ==> $email, password ==> $password ##');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await value.user
            .updateProfile(displayName: name)
            .then((value) => print('Update Profile Success'));
        Navigator.pushNamed(context, '/home');
      }).catchError((onError) =>
              normalDialog(context, onError.code, onError.message));
    });
  }
}
