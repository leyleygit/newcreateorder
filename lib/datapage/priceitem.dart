import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PriceItems extends StatefulWidget {
  final int index;
  final String pricecake;
  final dynamic selectprice;
  const PriceItems({
    Key key,
    this.pricecake, this.index, this.selectprice,
  }) : super(key: key);
  @override
  _PriceItemsState createState() => _PriceItemsState();
}

class _PriceItemsState extends State<PriceItems> {
  bool selectprice = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          //width: size.width * 0.2,
          decoration: BoxDecoration(
            //border: Border.all(width: 2, color: Colors.white70),
            color: widget.selectprice == true
                ? Colors.blue.withOpacity(0.7)
                : Colors.white24,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Text(
              widget.pricecake,
              style: GoogleFonts.pacifico(
                  fontSize: 25,
                  color: widget.selectprice == true ? Colors.white : Colors.black),
            ),
          ),
        ),
        Positioned(
            top: 1,
            right: 3,
            child: widget.selectprice == true
                ? FaIcon(
                    FontAwesomeIcons.checkCircle,
                    color: Colors.white,
                    size: 18,
                  )
                : FaIcon(
                    FontAwesomeIcons.circle,
                    color: Colors.white,
                    size: 18,
                  ))
      ],
    );
  }
}
