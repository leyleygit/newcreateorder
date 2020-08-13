import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ColorItems extends StatefulWidget {
  final String namecolor ;
  bool oncheck = false;
//  get oncheck => _oncheck;
//  set oncheck(val)=> _oncheck=val;

  ColorItems({Key key, this.namecolor}) : super(key: key);
  @override
  _ColorItemsState createState() => _ColorItemsState();
}

class _ColorItemsState extends State<ColorItems> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(8.0),
            onTap: (){
              setState(() {
                widget.oncheck = ! widget.oncheck;
              });
            },
            child: Container(
              width: size.width * 0.33,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xffff9068),
                        Color(0xffff4b1f),
                      ])),
              child: Center(
                child: Text(widget.namecolor, style: TextStyle(color: Colors.white,fontSize: 17),),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: size.width * 0.03,
          child: widget.oncheck == true
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
