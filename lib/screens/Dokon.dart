import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surxan/data.dart';

class Dokon extends StatefulWidget {
  final bool direktor;
  const Dokon({super.key, required this.direktor});

  @override
  State<Dokon> createState() => _DokonState();
}

class _DokonState extends State<Dokon> {
  TextEditingController textController = TextEditingController();

  List<Tovar> filteredList = [];
  @override
  void initState() {
    super.initState();
    filteredList = SotilganTovarlar;
  }

  Future<List<Tovar>> searchProducts(String search) async {
    await Future.delayed(Duration(milliseconds: 300));
    return SotilganTovarlar.where((product) {
      return product.tovarNomi!.toLowerCase().contains(search.toLowerCase());
    }).toList();
  }

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
                      SizedBox(
                        child: (widget.direktor)
                            ? null
                            : InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.purple[800],
                                    border: Border.all(
                                      color: Colors.black38,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.add, color: Colors.white),
                                      SizedBox(width: 4),
                                      Text(
                                        "Back",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
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
                AnimSearchBar(
                  width: size.width * 0.23,
                  textController: textController,
                  onSuffixTap: () {
                    setState(() {
                      textController.clear();
                    });
                  },
                  onSubmitted: (search) async {
                    final result = await searchProducts(search);
                    setState(() {
                      filteredList = result;
                    });
                  },
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

            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 100,
                    dataRowHeight: 35,
                    border: TableBorder.all(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.black54,
                      width: 1,
                    ),
                    columns: [
                      DataColumn(label: Text("№")),
                      DataColumn(label: Text("Tovar nomi")),
                      DataColumn(label: Text("Mijoz")),
                      DataColumn(label: Text("Sotilgan vaqti")),
                      DataColumn(label: Text("Miqdori")),
                      DataColumn(label: Text("Narx")),
                    ],
                    rows: List.generate(SotilganTovarlar.length, (index) {
                      return DataRow(
                        cells: [
                          DataCell(Text((index + 1).toString())),
                          DataCell(Text(SotilganTovarlar[index].tovarNomi!)),
                          DataCell(Text(SotilganTovarlar[index].mijoz!)),
                          DataCell(
                            Text(SotilganTovarlar[index].sotilganVaqti!),
                          ),
                          DataCell(
                            Text(
                              SotilganTovarlar[index].miqdor!
                                  .toInt()
                                  .toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              NumberFormat.decimalPattern(
                                "ru",
                              ).format(SotilganTovarlar[index].narx!),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
