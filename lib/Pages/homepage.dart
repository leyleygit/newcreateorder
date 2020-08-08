import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_createorder/datapage/coloritem.dart';
import 'package:new_createorder/datapage/flavoritem.dart';
import 'package:new_createorder/datapage/priceitem.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_createorder/datapage/shapeitem.dart';

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> with TickerProviderStateMixin {
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

  Future importfromgallary() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile.path));
    });
  }

  @override
  Widget build(BuildContext context) {
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
            SliverPersistentHeader(
              pinned: true,
              delegate: buildHeaderDelegate(
                maxHeight: size.height * 0.3,
                minHeight: size.height * 0.3,
                child: Container(
                  height: size.height * 0.3,
                  color: Color(0xff131313),
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
                                          color: Colors.grey
                                              .withOpacity(0.3),
                                          borderRadius:
                                          BorderRadius.circular(
                                              5.0)),
                                      width: 60,
                                      child: Icon(
                                        MdiIcons.camera,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                                    : Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: GestureDetector(
                                    onLongPress: () {
                                      setState(() {
                                        _image.removeAt(index - 1);
                                      });
                                    },
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: size.width * 0.25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                10.0),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  _image[index - 1]
                                                      .path),
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
                )
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
                      height: 1,
                      color: Colors.grey,
                      indent: 20,
                      endIndent: 20,
                    ),
                    Container(
                      //width: size.width * 1.0,
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      // color: Colors.yellow,
                      child: GridView.builder(
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        scrollDirection: Axis.horizontal,
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
                      height: 1,
                      color: Colors.grey,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ],
                ),
              ),
            ),
//            SliverToBoxAdapter(
//              child: Container(
//                height: size.height * 0.17,
//                color: Color(0xff131313),
//                //color: Colors.white,
//                child: Padding(
//                  padding: const EdgeInsets.only(left: 10, right: 10),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Text(
//                        "រសជាតិ",
//                        style: GoogleFonts.fredokaOne(
//                            fontSize: 20, color: Colors.white),
//                      ),
//                      Container(
//                        //body listview
//                        height: size.height * 0.1,
//                        //color: Colors.white,
//                        child: ListView.builder(
//                          scrollDirection: Axis.horizontal,
//                          itemCount: 5,
//                          itemBuilder: (BuildContext context, int index) {
//                            return FlavorItems(
//                              nameflavor: nameflavor[index],
//                            );
//                          },
//                        ),
//                      )
//                    ],
//                  ),
//                ),
//              ),
//            ),
//            SliverToBoxAdapter(
//              child: Container(
//                  height: size.height * 0.17,
//                  //color: Colors.white,
//                  color: Color(0xff131313),
//                  child: Padding(
//                    padding: EdgeInsets.only(right: 10, left: 10),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text(
//                          "ពណ៍",
//                          style: GoogleFonts.fredokaOne(
//                              fontSize: 20, color: Colors.white),
//                        ),
//                        Container(
//                          //body listview
//                          height: size.height * 0.1,
//                          //color: Colors.blueAccent,
//                          child: ListView.builder(
//                              scrollDirection: Axis.horizontal,
//                              itemCount: 10,
//                              itemBuilder: (BuildContext context, int index) {
//                                return ColorItems(
//                                  namecolor: namecolor[index],
//                                );
//                              }),
//                        )
//                      ],
//                    ),
//                  )),
//            ),
//            SliverToBoxAdapter(
//              child: Container(
//                //BodySliverToBoxAdapter
//                height: size.height * 0.17,
//                color: Color(0xff131313),
////                color: Colors.white,
//                child: Padding(
//                  padding: const EdgeInsets.only(right: 10, left: 10),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: [
//                      Text(
//                        "រូបរាង",
//                        style: GoogleFonts.fredokaOne(
//                            fontSize: 20, color: Colors.white),
//                      ),
//                      Container(
//                        //bodyListView
//                        height: size.height * 0.1,
//                        //color: Colors.white,
//                        child: ListView.builder(
//                            itemCount: 10,
//                            scrollDirection: Axis.horizontal,
//                            itemBuilder: (BuildContext context, int index) {
//                              return ShapeItems(
//                                nameshape: nameshape[index],
//                              );
//                            }),
//                      )
//                    ],
//                  ),
//                ),
//              ),
//            ),
            SliverToBoxAdapter(),
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
                    Spacer(),
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: InkWell(
                          child: Icon(
                            MdiIcons.noteText,
                            color: Colors.white,
                            size: 40,
                          ),
                          onTap: () {
                            _buttonpopuptextfield(context);
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: InkWell(
                        onTap: () {
                          importfromgallary();
                        },
                        child: Icon(
                          MdiIcons.image,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _buttonpopuptextfield(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext btp) {
          return ListView(
            children: [
                  Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height,
                  //padding: EdgeInsets.only(left: 10, right: 10),
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        pinned: true,
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.transparent,
                        title: Text(
                          "បន្ថែមពត៍មានពីនំ",
                          style: GoogleFonts.fredokaOne(
                              fontSize: 20, color: Colors.black54),
                        ),
                        actions: <Widget>[
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                FontAwesomeIcons.checkCircle,
                                size: 30,
                                color: Color(0xffff4b1f),
                              )),
                        ],
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          height: MediaQuery.of(context).size.height * 0.15,
                          //color: Colors.purple.withOpacity(0.2),
                          child: TextField(
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffff4b1f))),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                hintText: "Description"),
                            maxLines: 4,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                          height: MediaQuery.of(context).size.height * 0.05,
                          //color: Colors.yellow,
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Type of food",
                                    style: GoogleFonts.raleway(
                                        fontSize: 15, color: Color(0xffff4b1f)),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Coffee・Ice Cream,Thai",
                                    style: GoogleFonts.abel(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                          height: MediaQuery.of(context).size.height * 0.15,
                          //color: Colors.yellow,
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Address",
                                    style: GoogleFonts.raleway(
                                        fontSize: 15, color: Color(0xffff4b1f)),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "#184,St 155 \nSangkat Toul Tompong \n Khan Chomkamorn \n Phnom Penh",
                                    style: GoogleFonts.abel(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          //color: Colors.yellow,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          height: MediaQuery.of(context).size.height * 0.05,
                          //color: Colors.yellow,
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Contact",
                                    style: GoogleFonts.raleway(
                                        fontSize: 15, color: Color(0xffff4b1f)),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "081 828 288 / 015 704 034",
                                    style: GoogleFonts.abel(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
//                  SliverFillRemaining(
//                    child: Container(),
//                  )
                    ],
                  )),
                ],
          );
        });
  }
}
class buildHeaderDelegate extends SliverPersistentHeaderDelegate{
  final Widget child;
  final double minHeight;
  final double maxHeight;

  buildHeaderDelegate({this.child, this.minHeight, this.maxHeight});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    return child;
  }

  @override

  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
