import 'package:flutter/material.dart';
import 'package:surxan/data.dart';

class RightSide extends StatefulWidget {
  const RightSide({super.key});

  @override
  State<RightSide> createState() => _RightSideState();
}

class _RightSideState extends State<RightSide> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ValueListenableBuilder(
        valueListenable: page,
        builder: (context, value, child) {
          return screens[value];
        },
      ),
    );
  }
}
