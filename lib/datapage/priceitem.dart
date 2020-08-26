import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PriceItems extends StatefulWidget {
  final int index;
  final String pricecake;
  final dynamic selectprice;
  PriceItems({
    Key key,
    this.pricecake, this.index, this.selectprice,
  }) : super(key: key);
  bool oncheck = false;
  @override
  _PriceItemsState createState() => _PriceItemsState();
}
class _PriceItemsState extends State<PriceItems> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        InkWell(
          onTap: (){
            setState(() {
              widget.oncheck = ! widget.oncheck;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: size.height * 0.07,
              //width: size.width * 0.2,
              decoration: BoxDecoration(
                //border: Border.all(width: 2, color: Colors.white70),
//              color: widget.selectprice == true
                  color: widget.oncheck == true
                    ? Colors.blue.withOpacity(0.7)
                    : Colors.white24,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child: Text(
                  widget.pricecake,
                  style: GoogleFonts.pacifico(
                      fontSize: 25,
                        color: widget.oncheck == true?Colors.white : Colors.black)
//                    color: widget.selectprice == true ? Colors.white : Colors.black),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 10,
            right: 10,
            child: widget.oncheck == true
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
