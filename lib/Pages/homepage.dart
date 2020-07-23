import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff131313),
      body: Container(
        width: size.width,
        height: size.height,
        child: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Color(0xff131313),
            leading: Icon(Icons.exit_to_app ,size: 30,),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(Icons.notifications,color: Colors.white,size: 30,),
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
                    Text("Create Order", style: GoogleFonts.pacifico(fontSize: 30,color: Colors.white),)
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: size.height * 0.35,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Select Price", style: GoogleFonts.fredokaOne(fontSize: 20,color: Colors.white),)
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

