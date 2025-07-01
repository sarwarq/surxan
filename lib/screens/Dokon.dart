import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surxan/data.dart';

class Dokon extends StatefulWidget {
  Dokon({super.key});

  @override
  State<Dokon> createState() => _DokonState();
}

class _DokonState extends State<Dokon> {
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
                Text(
                  "Do'kon",
                  style: TextStyle(
                    fontSize: 29,
                    color: textcolor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.edit_document, color: textcolor),
                              SizedBox(width: 4),
                              Text(
                                "Export",
                                style: TextStyle(
                                  color: textcolor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 14),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.purple[800],
                            border: Border.all(color: Colors.black38, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.add, color: Colors.white),
                              SizedBox(width: 4),
                              Text(
                                "Add New",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.18,
                  child: TextField(
                    cursorHeight: 15,
                    cursorColor: Colors.black,

                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      constraints: BoxConstraints(maxHeight: 30),
                      hintText: "Search",
                      hintStyle: TextStyle(fontSize: 13, height: 0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.date_range_rounded,
                                color: Colors.black54,
                                size: 18,
                              ),
                              SizedBox(width: 2),
                              Text("12.03.2025 - 12.03.2025"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.menu_open_rounded,
                                color: Colors.black54,
                                size: 18,
                              ),
                              SizedBox(width: 2),
                              Text("Umumiy"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.025),

            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(color: Colors.black87, width: 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(flex: 1, child: Text("№")),
                        Expanded(flex: 3, child: Text("Tovar nomi")),
                        Expanded(flex: 3, child: Text("Mijoz")),
                        Expanded(flex: 3, child: Text("Qoldiq")),
                        Expanded(flex: 3, child: Text("Sotilgan vaqti")),
                        Expanded(flex: 2, child: Text("Narx")),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height *0.75,
                  child: ListView.builder(
                    itemCount: tovarlar.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black87, width: 1),
                            left: BorderSide(color: Colors.black87, width: 1),
                            right: BorderSide(color: Colors.black87, width: 1),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(flex: 1, child: Text(index.toString())),
                              Expanded(flex: 3, child: Text(tovarlar[index].tovarNomi!, style: textStyle,)),
                              Expanded(flex: 3, child: Text(tovarlar[index].mijoz!, style: textStyle,)),
                              Expanded(flex: 3, child: Text(tovarlar[index].qoldiq!.toInt().toString(), style: textStyle,)),
                              Expanded(flex: 3, child: Text(tovarlar[index].sotilganVaqti!, style: textStyle,)),
                              Expanded(flex: 2, child: Text(NumberFormat.decimalPattern("ru").format(tovarlar[index].narx!), style: textStyle,)),
                            ],
                          ),
                        ),
                      );
                    },
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
