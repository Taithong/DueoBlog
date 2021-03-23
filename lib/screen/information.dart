import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  String name, email;

  @override
  void initState() {
    super.initState();
    findNameAndEmail();
  }

  Future<Null> findNameAndEmail() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          name = event.displayName;
          email = event.email;
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ຂໍ້ມູນສ່ວນໂຕ',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
        backgroundColor: Color(0XFF181b3b),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/user.png'),
                radius: 80,
              ),
            ),
            Divider(
              height: 90,
              color: Colors.deepOrange,
            ),
            Text('NAME',
              style: TextStyle(
                  color: Colors.black, letterSpacing: 2
              ),),
            SizedBox(
              height: 10,
            ),

            Text(name == null ? 'Name' : name,
              style: TextStyle(
                  color: Colors.deepOrange, fontSize: 25, fontWeight: FontWeight.bold
              ),),
            SizedBox( height: 30,),
            Text('Email',
              style: TextStyle(
                  color: Colors.black, letterSpacing: 2
              ),),
            SizedBox(
              height: 10,
            ),
            Text(email == null ? 'email' : email, style: TextStyle(
                color: Colors.deepOrange, fontSize: 18, letterSpacing: 1
            ),),
          ],
        ),
      ),
    );
  }
}
