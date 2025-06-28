import 'package:flutter/material.dart';
import 'package:surxan/data.dart';
import 'package:surxan/widgets/left_bar_widget.dart';

class LeftSide extends StatefulWidget {
  const LeftSide({super.key});

  @override
  State<LeftSide> createState() => _LeftSideState();
}

class _LeftSideState extends State<LeftSide> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width * 0.17,
      padding: EdgeInsets.symmetric(vertical: 40,),
      color: textcolor,
      child: Container(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Surxon", style: TextStyle(fontSize: 30, color: Colors.white)),

            SizedBox(height: size.height * 0.02),

            Container(height: size.height * 0.5, child: LeftBar()),

            Expanded(child: SizedBox()),

            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Icon(Icons.logout, color: Colors.white),
                  SizedBox(width: size.width * 0.01),
                  Text(
                    "Chiqish",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
