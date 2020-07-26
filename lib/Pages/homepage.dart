import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_createorder/datapage/coloritem.dart';
import 'package:new_createorder/datapage/flavoritem.dart';
import 'package:new_createorder/datapage/priceitem.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_createorder/datapage/shapeitem.dart';

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  List<String> pricecake = [
    "5\$",
    "10\$",
    "15\$",
    "20\$",
    "25\$",
    "30\$",
    "35\$",
    "40\$",
    "45\$",
    "50\$",
    "55\$",
    "60\$",
  ];
  List<String> nameflavor = [
    "ត្រាវ",
    "ដូងត្រាវ",
    "ស្រ្តបឺរី",
    "សង់ខ្យាដូងតយ",
    "វ៉ាន់នីឡា",
    "តែថៃ",
    "ខ្នុរ",
    "ផាសសិន",
    "ធូរេន",
    "ប្លូបឺរី",
    "សូកូឡា",
  ];
  List<String> namecolor = [
    "ផ្សេង",
    "ដូរយកស",
    "ដូរយកក្រហម",
    "ដូរយកខ្មៅ",
    "ដូរយកលឿង",
    "ដូរយកផ្ទៃមេឃ",
    "ដូរយកខៀវដិត",
    "ដូរយកត្នោត",
    "ដូរយកផ្កាឈូក",
    "ដូយកទឹកក្រូច",
    "ដូរយកអាវទាហាន",
    "ដូរយកសាច់",
    "ដូរយកស្វាយ",
    "ដូរយកប្រផេះ",
    "ដូរយកមាស",
    "ដូរយកផ្កាឈូកដិត",
    "ដូចរូប",
  ];List<String> nameshape = [
    "រាងលុយ",
    "ខ្ពស់",
    "*4 ស្រទាប់",
    "*3 ស្រទាប់",
    "រាងលេខ",
    "រាងអក្សរ",
    "នំបីជាន់",
    "ជ្រុងស្មើរ",
    "នំពីរជាន់",
    "រាងកូនក្រមុំ",
    "រាងជ្រូក",
    "រាងបាល់",
    "រាងក្រឡរ",
    "រាងជ្រុងវែង",
    "មូល",
    "បេះដូង",
    "ដូចរូប",
  ];
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff131313),
      body: Container(
        width: size.width,
        height: size.height,
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Color(0xff131313),
              leading: Icon(
                Icons.exit_to_app,
                size: 30,
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 30,
                  ),
                )
              ],
            ),
            SliverToBoxAdapter(
              child: Container(
                height: size.height * 0.3,
                //color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Create Order",
                        style: GoogleFonts.pacifico(
                            fontSize: 30, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                //color: Colors.purple,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Select Pricess",
                        style: GoogleFonts.fredokaOne(
                            fontSize: 20, color: Colors.white),
                      ),
                      Container(
                        width: size.width * 1.0,
                        height: size.height * 0.3,
                        // color: Colors.yellow,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                          ),
                          itemCount: 12,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PriceItems(
                                pricecake: pricecake[index],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: size.height * 0.15,
                //color: Colors.deepOrange,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Flavor",
                        style: GoogleFonts.fredokaOne(
                            fontSize: 20, color: Colors.white),
                      ),
                      Container(
                        //body listview
                        height: size.height * 0.1,
                        //color: Colors.white,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return FlavorItems(
                              nameflavor: nameflavor[index],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                  height: size.height * 0.15,
                  //color: Colors.yellow,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Color",
                          style: GoogleFonts.fredokaOne(
                              fontSize: 20, color: Colors.white),
                        ),
                        Container(
                          //body listview
                          height: size.height * 0.1,
                          //color: Colors.blueAccent,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) {
                                return ColorItems(namecolor: namecolor[index],);
                              }),
                        )
                      ],
                    ),
                  )),
            ),
            SliverToBoxAdapter(
              child: Container(
                //BodySliverToBoxAdapter
                height: size.height * 0.15,
                //color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shape",
                        style: GoogleFonts.fredokaOne(
                            fontSize: 20, color: Colors.white),
                      ),
                      Container(
                        //bodyListView
                        height: size.height * 0.1,
                        //color: Colors.white,
                        child: ListView.builder(itemCount: 10,scrollDirection: Axis.horizontal,itemBuilder: (BuildContext context, int index){
                          return ShapeItems(nameshape: nameshape[index],);
                        }),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
