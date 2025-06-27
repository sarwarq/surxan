import 'package:flutter/material.dart';
import 'package:surxan/widgets/left_side_widget.dart';
import 'package:surxan/widgets/right_side_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          //left side
          LeftSide(),

          //main side
          Expanded(child: RightSide())
        ],
      ),
    );
  }
}