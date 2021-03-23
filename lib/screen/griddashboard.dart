import 'package:flutter/material.dart';

class GridDashboard extends StatefulWidget {
  @override
  _GridDashboardState createState() => _GridDashboardState();
}

class _GridDashboardState extends State<GridDashboard> {
  var blog_list = [
    {
      "name": "ອັງກິດຕິດກ້ອງ CCTV ພ້ອມ...",
      "picture":
          "https://i2-prod.nottinghampost.com/news/nottingham-news/article4812457.ece/ALTERNATES/s1200c/0_CCTVCCTV-camera.jpg",
      "date": '21 March 2021',
      "subtitle": 'ເບື່ອໜ່າຍບໍ! ກັບການເຫັນຄົນຖິ້ມຂີ້...',
    },
    {
      "name": "ເປັນຫຍັງຈຶ່ງໃຊ້ Dark Mo...",
      "picture":
          "https://cdn.nerdschalk.com/wp-content/uploads/2019/09/nerdschalk.com-onenote-dark-mode.jpg",
      "date": '19 March 2021',
      "subtitle": 'Dark Mode ແມ່ນການປ່ຽນພື້ນ...',
    },
    {
      "name": "ວິກິດຊິບມີຖືຂາດຕະຫຼາດ...",
      "picture":
          "https://www.qualcomm.com/sites/ember/files/styles/qc_gallery_thumbnail/public/gallery/photos/qualcomm-hq-5-web.jpg?itok=6RJQLN9K",
      "date": '18 March 2021',
      "subtitle": 'Qulacomm ບໍລິສັດທີ່ຜະລິດຊິບ...',
    },
    {
      "name": "ຈີນກຽມສ້າງແອັບແຂ່ງ Club...",
      "picture":
          "https://i.guim.co.uk/img/media/ca3a189dd3f51bb94665310293f231587ccb1c03/2172_1373_4094_2458/master/4094.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=b34f41398b522de9c222d3eae51fe6b8",
      "date": '16 March 2021',
      "subtitle": 'ບໍລິສັດ ໄບແດນສ ບໍລິສັດສັນຊາດຈີນ...',
    },
    {
      "name": "Samsung Galaxy A52 5G",
      "picture":
          "https://fdn.gsmarena.com/imgroot/news/21/03/samsung-galaxy-a52-retailer/popup/-315/gsmarena_001.jpg",
      "date": '15 March 2021',
      "subtitle": 'ເລີ່ມມີຂໍິມູນຂອງ Samsung Galaxy A...',
    },
    {
      "name": "Xiaomi Mi 11 5G",
      "picture":
      "https://img.gkbcdn.com/s3/p/2020-12-30/Xiaomi-Mi-11-5G-Smartphone-6-81-Inch-8GB-128GB-Black-427121-0.jpg",
      "date": '14 March 2021',
      "subtitle": 'Smart phone ທີ່ມີຊິບ...',
    },
    {
      "name": "Fimi x8 se 2020",
      "picture":
      "https://img.gkbcdn.com/s3/p/2018-12-10/xiaomi-fimi-x8-se-4k-5km-gps-wifi-rc-drone-rtf-white-1571993105888.jpg",
      "date": '13 March 2021',
      "subtitle": 'Drone ທີ່ມີຊິບ...',
    },
    {
      "name": "Macbook Air M1 2021",
      "picture":
      "https://mobilesyrup.com/wp-content/uploads/2020/11/m1-mac-header-1-scaled.jpg",
      "date": '12 March 2021',
      "subtitle": 'Notebook ທີ່ມີຊິບ...',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: blog_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: blog_list[index]['name'],
            prod_picture: blog_list[index]['picture'],
            prod_date: blog_list[index]['date'],
            prod_subtitle: blog_list[index]['subtitle'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_date;
  final prod_subtitle;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_date,
    this.prod_subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name,
        child: Material(
          child: InkWell(
            onTap: () {},
            child: GridTile(
              footer: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          prod_name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        child: Text(
                          prod_subtitle,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Container(
                        child: Text(
                          prod_date,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                    ],
                  )),
              child: Image.network(
                prod_picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
