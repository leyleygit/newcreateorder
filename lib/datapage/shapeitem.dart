import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ShapeItems extends StatefulWidget {
  final String nameshape;

  const ShapeItems({Key key, this.nameshape}) : super(key: key);
  @override
  _ShapeItemsState createState() => _ShapeItemsState();
}

class _ShapeItemsState extends State<ShapeItems> {
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
            onTap: (){
              setState(() {
                oncheck = !oncheck;
              });
            },
            child: Container(
              width: size.width * 0.3,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xff0ED2F7),Color(0xff2196f3)]),
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Center(
                child: Text(widget.nameshape,style: TextStyle(fontSize: 17,color: Colors.white),),
              ),
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.002,
          right: size.width * 0.032,
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
