import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class PriceItems extends StatefulWidget {
  final String pricecake;

  const PriceItems({Key key, this.pricecake}) : super(key: key);
  @override
  _PriceItemsState createState() => _PriceItemsState();
}
class _PriceItemsState extends State<PriceItems> {
  bool selectprice = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        setState(() {
          selectprice = !selectprice;
        });
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(width: 2,color: Color(0xff091EAA)),
          color: selectprice==true?Colors.blueAccent.withOpacity(0.3):Color(0xff131313),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(widget.pricecake,
            style: GoogleFonts.pacifico(
                fontSize: 25, color: selectprice==true?Colors.white:Color(0xff091EAA)),
          ),
        ),
      ),
    );
  }
}
