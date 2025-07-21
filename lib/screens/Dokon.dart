import 'dart:io';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:excel/excel.dart' as ex;
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

  DateTime? startDate;
  DateTime? endDate;
  late List<SotilganTovar> filteredList;

  @override
  void initState() {
    super.initState();
    filteredList = SotilganTovarlar;
  }

  Future<void> exportExcel() async {
    String filePath = 'base/dokonTarixi.xlsx';
    File file = File(filePath);

    if (file.existsSync()) {
      var bytes = file.readAsBytesSync();
      var excel = ex.Excel.decodeBytes(bytes);

      ex.Sheet sheet = excel['Tarix'];

      int startRow = 5;

      for (var i = 0; i < SotilganTovarlar.length; i++) {
        sheet.cell(ex.CellIndex.indexByString('D${startRow + i}')).value =
            SotilganTovarlar[i].tovarNomi;
        sheet.cell(ex.CellIndex.indexByString('E${startRow + i}')).value =
            SotilganTovarlar[i].mijoz;
        sheet.cell(ex.CellIndex.indexByString('F${startRow + i}')).value =
            SotilganTovarlar[i].sotilganVaqti;
        sheet.cell(ex.CellIndex.indexByString('G${startRow + i}')).value =
            SotilganTovarlar[i].miqdor;
        sheet.cell(ex.CellIndex.indexByString('H${startRow + i}')).value =
            SotilganTovarlar[i].narx;
      }

      var fileBytes = excel.save();
      file.writeAsBytesSync(fileBytes!);

      print("Malumot yuborildi");
    } else {
      print("Fayl topilmadi");
    }
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
                        onTap: exportExcel,
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
                      filteredList = SotilganTovarlar;
                    });
                  },
                  onSubmitted: (search) async {
                    setState(() {
                      filteredList = SotilganTovarlar.where(
                        (item) =>
                            item.tovarNomi!.toLowerCase().contains(
                              search.toLowerCase(),
                            ) ||
                            item.mijoz!.toLowerCase().contains(
                              search.toLowerCase(),
                            ) ||
                            item.sotilganVaqti!.toLowerCase().contains(
                              search.toLowerCase(),
                            ),
                      ).toList();
                    });
                  },
                ),
                SizedBox(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          final picked = await showDateRangePicker(
                            context: context,
                            firstDate: DateTime(2020),
                            lastDate: DateTime.now().add(Duration(days: 365)),
                            initialDateRange:
                                (startDate != null && endDate != null)
                                ? DateTimeRange(
                                    start: startDate!,
                                    end: endDate!,
                                  )
                                : null,
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  
                                  colorScheme: ColorScheme.light(
                                    primary: Colors
                                        .deepPurple, // active rang (calendar selected)
                                    onPrimary:
                                        Colors.white, // selected text rangi
                                    onSurface: Colors.black87, // calendar text
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors
                                          .deepPurple, // cancel/ok tugmalari
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );

                          if (picked != null) {
                            setState(() {
                              startDate = picked.start;
                              endDate = picked.end;

                              filteredList = SotilganTovarlar.where((item) {
                                if (item.sotilganVaqti == null ||
                                    item.sotilganVaqti == '')
                                  return false;

                                DateTime vaqt = DateFormat(
                                  'dd.MM.yyyy HH:mm',
                                ).parse(item.sotilganVaqti!);
                                return vaqt.isAfter(
                                      startDate!.subtract(Duration(days: 1)),
                                    ) &&
                                    vaqt.isBefore(
                                      endDate!.add(Duration(days: 1)),
                                    );
                              }).toList();
                            });
                          }
                        },

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
                              Text(
                                (startDate != null && endDate != null)
                                    ? "${DateFormat('dd.MM.yyyy').format(startDate!)} - ${DateFormat('dd.MM.yyyy').format(endDate!)}"
                                    : "Sana tanlang",
                              ),
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
                    rows: List.generate(filteredList.length, (index) {
                      return DataRow(
                        cells: [
                          DataCell(Text((index + 1).toString())),
                          DataCell(Text(filteredList[index].tovarNomi!)),
                          DataCell(Text(filteredList[index].mijoz!)),
                          DataCell(Text(filteredList[index].sotilganVaqti!)),
                          DataCell(
                            Text(
                              filteredList[index].miqdor!.toInt().toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              NumberFormat.decimalPattern(
                                "ru",
                              ).format(filteredList[index].narx!),
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
