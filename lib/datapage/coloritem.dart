import 'package:flutter/material.dart';

class ColorItems extends StatefulWidget {
  @override
  _ColorItemsState createState() => _ColorItemsState();
}

class _ColorItemsState extends State<ColorItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.green,
        ),
      ),
    );
  }
}
