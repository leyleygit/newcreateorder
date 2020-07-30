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
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.3,
          width: size.width * 0.3,
          decoration: BoxDecoration(
            //border: Border.all(width: 2, color: Colors.white70),
            color: widget.selectprice == true
                ? Colors.blue.withOpacity(0.7)
                : Colors.white24,
            borderRadius: BorderRadius.circular(20.0),
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
            top: 3,
            right: 3,
            child: widget.selectprice == true
                ? FaIcon(
                    FontAwesomeIcons.checkCircle,
                    color: Colors.white,
                  )
                : FaIcon(
                    FontAwesomeIcons.circle,
                    color: Colors.white,
                  ))
      ],
    );
  }
}
