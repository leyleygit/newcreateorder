import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_createorder/datapage/coloritem.dart';
import 'package:new_createorder/datapage/flavoritem.dart';
import 'package:new_createorder/datapage/priceitem.dart';
import 'package:new_createorder/datapage/shapeitem.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  int i = 0;
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
  ];
  List<String> nameshape = [
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
  List<File> _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image.add(File(pickedFile.path));
    });
  }

  @override
  void initState() {
    _image = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff131313),
      //backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              backgroundColor: Color(0xff131313),
              //backgroundColor: Colors.white,
              leading: Icon(
                Icons.exit_to_app,
                size: 30,
                color: Colors.white,
              ),
              actions: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      "${pricecake[i]}",
                      style: GoogleFonts.pacifico(
                          color: Colors.white,
                          fontSize: 30,
                          shadows: [
                            BoxShadow(
                                color: Colors.white,
                                blurRadius: 20,
                                spreadRadius: 5)
                          ]),
                    ))
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
                      ),
                      Container(
                        //body ListView Camera
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                            //border: Border.all(width: 2, color: Colors.white)
                            ),
                        child: ListView.builder(
                            itemCount: _image.length + 1,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return index == 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: getImage,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          width: 60,
                                          child: Icon(
                                            MdiIcons.camera,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      child: GestureDetector(
                                        onLongPress: () {
                                          setState(() {
                                            _image.removeAt(index - 1);
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: size.width * 0.25,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      _image[index - 1].path),
                                                )),
                                          ),
                                        ),
                                      ),
                                    );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "តម្លៃនំ",
                      style: GoogleFonts.fredokaOne(
                          fontSize: 20, color: Colors.white),
                    ),
                    Divider(
                      height: 2,
                      color: Colors.white,
                      indent: 32,
                      endIndent: 32,
                    ),
                    Container(
                      width: size.width * 1.0,
                      height: size.height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      // color: Colors.yellow,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        itemCount: pricecake.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                setState(() {
                                  i = index;
                                });
                              },
                              child: PriceItems(
                                index: i,
                                selectprice: index == i ? true : false,
                                pricecake: pricecake[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(
                      height: 2,
                      color: Colors.white,
                      indent: 32,
                      endIndent: 32,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: size.height * 0.15,
                color: Color(0xff131313),
                //color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "រសជាតិ",
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
                  //color: Colors.white,
                  color: Color(0xff131313),
                  child: Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "ពណ៍",
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
                                return ColorItems(
                                  namecolor: namecolor[index],
                                );
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
                color: Color(0xff131313),
//                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "រូបរាង",
                        style: GoogleFonts.fredokaOne(
                            fontSize: 20, color: Colors.white),
                      ),
                      Container(
                        //bodyListView
                        height: size.height * 0.1,
                        //color: Colors.white,
                        child: ListView.builder(
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return ShapeItems(
                                nameshape: nameshape[index],
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                //Body Sliver ToboxAdapter
                height: size.height * 0.1,
                //color: Colors.blue,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 5,
                                  spreadRadius: 1)
                            ],
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          width: size.width / 2,
                          child: Center(
                            child: Text(
                              "Save",
                              style: GoogleFonts.fredokaOne(
                                  fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Icon(
                        MdiIcons.noteText,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Icon(
                        MdiIcons.image,
                        color: Colors.white,
                        size: 45,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
