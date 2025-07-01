import 'package:flutter/material.dart';
import 'package:surxan/data.dart';
import 'package:surxan/widgets/chart_widget.dart';
import 'package:surxan/widgets/kirim.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Asosiy extends StatefulWidget {
  const Asosiy({super.key});

  @override
  State<Asosiy> createState() => _AsosiyState();
}

class _AsosiyState extends State<Asosiy> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      Text(
                        "Ishxonaning kirimi",
                        style: TextStyle(
                          color: textcolor,
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: size.width * 0.009),

                      Container(
                        margin: EdgeInsets.only(top: size.height * 0.011),
                        child: Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              color: Colors.grey,
                              size: size.height * 0.02,
                            ),
                            SizedBox(width: 1),
                            Text(
                              "26 iyun",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: size.height * 0.02,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: size.width * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white24,
                          shape: BeveledRectangleBorder(),
                        ),
                        icon: Icon(Icons.search, color: Colors.black54),
                      ),

                      IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white24,
                          shape: BeveledRectangleBorder(),
                        ),
                        icon: Icon(Icons.settings, color: Colors.black54),
                      ),

                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white54,
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                      width: size.width * 0.55,
                      child: Kirim(scroll: Axis.horizontal),
                    ),
                    Container(
                      height: size.height * 0.35,
                      width: size.width * 0.55,
                      padding: EdgeInsets.only(top: 20, right: 10),
                      margin: EdgeInsets.only(bottom: 25, top: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: boxshadow,
                      ),
                      child: Chart(),
                    ),
                    Row(
                      children: [
                        Container(
                          height: size.height * 0.29,
                          width: size.width * 0.22,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: boxshadow,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Omborxona",
                                style: TextStyle(
                                  fontSize: size.height * 0.027,
                                  fontWeight: FontWeight.bold,
                                  color: textcolor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: size.width * 0.01),
                        Container(
                          height: size.height * 0.29,
                          width: size.width * 0.32,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: boxshadow,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Container(
                    height: size.height * 0.81,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: boxshadow,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Oraliqni tanlang",
                          style: TextStyle(
                            fontSize: size.height * 0.027,
                            fontWeight: FontWeight.bold,
                            color: textcolor,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Container(
                          height: size.height * 0.29,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: boxshadow,
                          ),
                          child: SfDateRangePicker(
                            selectionMode:
                                DateRangePickerSelectionMode.multiRange,
                            selectionColor: Colors.blueAccent,
                            rangeSelectionColor: Colors.lightBlue.withOpacity(
                              0.3,
                            ),
                            endRangeSelectionColor: Colors.blue,
                            startRangeSelectionColor: Colors.blue,
                            backgroundColor: Colors.transparent,
                            headerStyle: DateRangePickerHeaderStyle(
                              backgroundColor: Colors.transparent,
                            ),
                           
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Expanded(child: Kirim(scroll: Axis.vertical)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
