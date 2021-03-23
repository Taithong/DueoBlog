import 'package:dueoblog/screen/griddashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dueoblog/screen/information.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name, email;
  Widget currentWidget = Information();

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
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        drawer: buildDrawer(context),
        appBar: AppBar(
          title: Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            tabs: [Tab(text: "ບົດຄວາມທັ້ງໝົດ"), Tab(text: "ມາໃໝ່")],
          ),
          backgroundColor: Color(0XFF181b3b),
        ),
        body: TabBarView(
          children: [
            Container(
                child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "ຄົ້ນຫາບົດຄວາມທີ່ທ່ານມັກ",
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color(0XFF91A6A6),
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: Text(
                    'ບົດຄວາມທັ້ງໝົດ',
                    style: TextStyle(color: Color(0xff181B3B), fontSize: 24),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 600,
                  child: GridDashboard(),
                )
              ],
            )),
            Container(
              child: ListView(
                children: <Widget>[
                  //Search Box
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "ຄົ້ນຫາບົດຄວາມທີ່ທ່ານມັກ",
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Color(0XFF91A6A6),
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Daily Title
                  Container(
                    margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: Text(
                      'ບົດຄວາມປະຈຳວັນ',
                      style: TextStyle(color: Color(0xff181B3B), fontSize: 24),
                    ),
                  ),

                  //BlogList
                  Container(
                    height: 600,
                    child: ListView(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 15,
                                      right: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            'ອັງກິດຕິດກ້ອງ CCTV ພ້ອມກັບ...',
                                            style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Text(
                                            'ເບື່ອໜ່າຍບໍ! ກັບການເຫັນຄົນຖິ້ມຂີ້ເຫຍືຶອ...',
                                            style: TextStyle(
                                              color: Color(0xff181B3B),
                                              fontSize: 12,
                                            )),
                                        Text(
                                          '21 March 2021',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Icon(
                                          Icons.more_horiz,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                  Image.network(
                                    'https://i2-prod.nottinghampost.com/news/nottingham-news/article4812457.ece/ALTERNATES/s1200c/0_CCTVCCTV-camera.jpg',
                                    width: 140,
                                  ),
                                ],
                              ),
                              elevation: 5,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 15,
                                      right: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            'ເປັນຫຍັງຈຶ່ງໃຊ້ Dark Mode',
                                            style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Text('Dark Mode ແມ່ນການປ່ຽນພື້ນຫຼັງ...',
                                            style: TextStyle(
                                              color: Color(0xff181B3B),
                                              fontSize: 12,
                                            )),
                                        Text(
                                          '19 March 2021',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Icon(
                                          Icons.more_horiz,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                  Image.network(
                                    'https://cdn.nerdschalk.com/wp-content/uploads/2019/09/nerdschalk.com-onenote-dark-mode.jpg',
                                    width: 140,
                                    height: 140,
                                  ),
                                ],
                              ),
                              elevation: 5,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 15,
                                      right: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            'ວິກິດຊິບມີຖືຂາດຕະຫຼາດ...',
                                            style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Text('Qulacomm ບໍລິສັດທີ່ຜະລິດຊິບ...',
                                            style: TextStyle(
                                              color: Color(0xff181B3B),
                                              fontSize: 12,
                                            )),
                                        Text(
                                          '18 March 2021',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Icon(
                                          Icons.more_horiz,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                  Image.network(
                                    'https://www.qualcomm.com/sites/ember/files/styles/qc_gallery_thumbnail/public/gallery/photos/qualcomm-hq-5-web.jpg?itok=6RJQLN9K',
                                    width: 140,
                                    height: 140,
                                  ),
                                ],
                              ),
                              elevation: 5,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 15,
                                      right: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            'ຈີນກຽມສ້າງແອັບແຂ່ງ Club...',
                                            style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Text('ບໍລິສັດ ໄບແດນສ ບໍລິສັດສັນຊາດຈີນ...',
                                            style: TextStyle(
                                              color: Color(0xff181B3B),
                                              fontSize: 12,
                                            )),
                                        Text(
                                          '16 March 2021',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Icon(
                                          Icons.more_horiz,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                  Image.network(
                                    'https://i.guim.co.uk/img/media/ca3a189dd3f51bb94665310293f231587ccb1c03/2172_1373_4094_2458/master/4094.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=b34f41398b522de9c222d3eae51fe6b8',
                                    width: 140,
                                    height: 140,
                                  ),
                                ],
                              ),
                              elevation: 5,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 15,
                                      right: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            'Samsung Galaxy A52 5G',
                                            style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Text('ເລີ່ມມີຂໍິມູນຂອງ Samsung Galaxy A...',
                                            style: TextStyle(
                                              color: Color(0xff181B3B),
                                              fontSize: 12,
                                            )),
                                        Text(
                                          '15 March 2021',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Icon(
                                          Icons.more_horiz,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                  Image.network(
                                    'https://fdn.gsmarena.com/imgroot/news/21/03/samsung-galaxy-a52-retailer/popup/-315/gsmarena_001.jpg',
                                    width: 140,
                                    height: 140,
                                  ),
                                ],
                              ),
                              elevation: 5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Column(
            children: [
              buildUserAccountsDrawerHeader(),
              buildListTileInformation(context),
              ListTile(
                leading: Icon(
                  Icons.library_books_sharp,
                  color: Color(0xff181B3B),
                  size: 36,
                ),
                title: Text('ລາຍການບົດຄວາມ',
                    style: TextStyle(color: Colors.deepOrange, fontSize: 16)),
                subtitle: Text(
                  'ບົດຄວາມທີ່ມີືທັ້ງໝົດ',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                onTap: () {
                  //Navigator.pushNamed(context, '/information');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.new_releases,
                  color: Color(0xff181B3B),
                  size: 36,
                ),
                title: Text('ບົດຄວາມໃໝ່',
                    style: TextStyle(color: Colors.deepOrange, fontSize: 16)),
                subtitle: Text(
                  'ອ່ານບົດຄວາມໃໝ່',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                onTap: () {
                  //Navigator.pushNamed(context, '/information');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.history,
                  color: Color(0xff181B3B),
                  size: 36,
                ),
                title: Text('ປະຫວັດ',
                    style: TextStyle(color: Colors.deepOrange, fontSize: 16)),
                subtitle: Text(
                  'ເບິ່ງປະຫວັດການເຄື່ອນໄຫວ',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                onTap: () {
                  //Navigator.pushNamed(context, '/information');
                },
              ),
            ],
          ),
          buildSignOut(),
        ],
      ),
    );
  }

  ListTile buildListTileInformation(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.perm_contact_calendar_sharp,
        color: Color(0xff181B3B),
        size: 36,
      ),
      title: Text('ຂໍ້ມູນສ່ວນໂຕ',
          style: TextStyle(color: Colors.deepOrange, fontSize: 16)),
      subtitle: Text(
        'ກວດສອບຂໍ້ມູນສ່ວນໂຕຂອງທ່ານ',
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/information');
      },
    );
  }

  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Color(0xff181B3B),
      ),
      accountName: Text(
        name == null ? 'Name' : name,
        style: TextStyle(fontSize: 18, color: Colors.deepOrange),
      ),
      accountEmail: Text(email == null ? 'email' : email),
      currentAccountPicture: Image.asset('assets/images/logo.png'),
    );
  }

  Column buildSignOut() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          onTap: () async {
            await Firebase.initializeApp().then((value) async {
              await FirebaseAuth.instance.signOut().then((value) =>
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false));
            });
          },
          tileColor: Color(0xff181B3B),
          title: ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.white,
              size: 36,
            ),
            title: Text(
              'ອອກຈາກລະບົບ',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            subtitle: Text('ອອກຈາກລະບົບ ແລະ ໄປທີ່ໜ້າສະໝັກສະມາຊິກ',
                style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        )
      ],
    );
  }
}
