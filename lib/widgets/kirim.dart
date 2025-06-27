import 'package:flutter/material.dart';
import 'package:surxan/data.dart';

class Kirim extends StatefulWidget {
  Axis scroll;
  Kirim({super.key, required this.scroll});

  @override
  State<Kirim> createState() => _KirimState();
}

class _KirimState extends State<Kirim> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView.builder(
      scrollDirection: widget.scroll,
      itemCount: kirimlar.length,
      itemBuilder: (context, index) {
        return Container(
          width: size.width * 0.18,
          padding: EdgeInsets.all(size.width * 0.01),
          margin: EdgeInsets.only(
            right: widget.scroll == Axis.horizontal ? size.width * 0.01 : 0,
            bottom: widget.scroll == Axis.vertical ? size.height * 0.01 : 0,
          ),
          decoration: BoxDecoration(color: Colors.white, boxShadow: boxshadow),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kirimlar[index].productcolor[0],
                ),
                child: Image(
                  image: AssetImage(kirimlar[index].icon),
                  height: size.height * 0.02,
                  color: kirimlar[index].productcolor[1],
                ),
              ),
              SizedBox(width: size.width * 0.01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${kirimlar[index].money.toString()}",
                        style: TextStyle(
                          color: textcolor,
                          fontSize: size.height * 0.03,
                        ),
                      ),
                      SizedBox(width: size.width * 0.003),
                      Container(
                        margin: EdgeInsets.only(top: size.height * 0.008),
                        child: Text(
                          "So'm",
                          style: TextStyle(
                            color: textcolor,
                            fontSize: size.width * 0.011,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    kirimlar[index].product,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: size.width * 0.0069,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
