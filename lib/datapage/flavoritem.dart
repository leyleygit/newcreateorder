import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FlavorItems extends StatefulWidget {
  final String nameflavor;
  const FlavorItems({Key key, this.nameflavor}) : super(key: key);
  @override
  _FlavorItemsState createState() => _FlavorItemsState();
}

class _FlavorItemsState extends State<FlavorItems> {
  bool oncheck = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InkWell(
            borderRadius: BorderRadius.circular(08.0),
            onTap: () {
              setState(() {
                oncheck = !oncheck;
              });
            },
            child: Container(
              width: size.width * 0.33,
              decoration: BoxDecoration(
                  //border: Border.all(width: 1, color: Colors.white),
                  //boxShadow: [BoxShadow(color: Color(0xffff9068),blurRadius:5.0,offset: (Offset(0.0,5.0)),spreadRadius: 0.1)],
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xff9D50BB), Color(0xff6E48AA)])),
              child: Center(
                child: Text(
                  widget.nameflavor,
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.001,
          right: size.width * 0.03,
          child: oncheck == true
              ? FaIcon(
                  FontAwesomeIcons.checkCircle,
                  color: Colors.white,
                  size: 20,
                )
              : FaIcon(
                  FontAwesomeIcons.circle,
                  color: Colors.white,
                  size: 20,
                ),
        )
      ],
    );
  }
}
