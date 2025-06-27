import 'package:flutter/material.dart';
import 'package:surxan/data.dart';

class LeftBar extends StatefulWidget {
  LeftBar({super.key});

  @override
  State<LeftBar> createState() => _LeftBarState();
}

class _LeftBarState extends State<LeftBar> {
  List<bool> isSelected = [true, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: 6,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              for (var i = 0; i < isSelected.length; i++) {
                isSelected[i] = false;
              }
              page.value = index;
              isSelected[index] = true;
            });
          },
          child: Container(
            height: size.height * 0.04,
            decoration: BoxDecoration(
              gradient: isSelected[index]
                  ? LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.white12,
                        Colors.white10,
                        Colors.white10,
                        Colors.transparent,
                      ],
                    )
                  : null,
            ),
            margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
            padding: EdgeInsets.only(left: size.width * 0.02),
            child: Row(
              children: [
                Image(
                  image: AssetImage(mainscreenIcon[index]),
                  color: Colors.white54,
                  height: size.height * 0.03,
                ),
                SizedBox(width: size.width * 0.01),
                Text(
                  mainscreenIconName[index],
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
