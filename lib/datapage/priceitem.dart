import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_createorder/Pages/homepage.dart';

class PriceItems extends StatefulWidget {
  final int index;
  final String pricecake;
  //final dynamic selectprice;
  PriceItems({
    Key key,
    this.pricecake,
    this.index,
  }) : super(key: key);
  bool oncheck = false;
  @override
  _PriceItemsState createState() => _PriceItemsState();
}

class _PriceItemsState extends State<PriceItems> {
  int i = 0;
  var check ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              widget.oncheck = ! widget.oncheck;
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomepage()));
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: size.height * 0.07,
              //width: size.width * 0.2,
              decoration: BoxDecoration(
                color: widget.oncheck == true
                  ? Colors.blue.withOpacity(0.7)
                  : Colors.white24,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child: Text(widget.pricecake,
                    style: GoogleFonts.pacifico(
                        fontSize: 25,
                        color: check == true ?Colors.white:Colors.black
                        )
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 10,
            right: 10,
            child: check == true
                ? FaIcon(
              FontAwesomeIcons.checkCircle,
              color: Colors.white,
              size: 25,
            )
                : FaIcon(
              FontAwesomeIcons.circle,
              color: Colors.white,
              size: 25,
            ))
      ],
    );
  }
}
