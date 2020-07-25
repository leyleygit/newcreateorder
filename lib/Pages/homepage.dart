import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_createorder/datapage/priceitem.dart';

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
                              child: PriceItems(pricecake: pricecake[index],),
                            );
                          },
                        ),
                      ),

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
