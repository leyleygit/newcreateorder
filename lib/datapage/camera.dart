import 'package:flutter/material.dart';

class CameraData extends StatefulWidget {
  @override
  _CameraDataState createState() => _CameraDataState();
}

class _CameraDataState extends State<CameraData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 60,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(15.0)
        ),
      ),
    );
  }
}
