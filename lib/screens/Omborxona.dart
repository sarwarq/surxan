import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surxan/data.dart';
import 'package:surxan/widgets/drawerS.dart';
import 'package:surxan/widgets/showdialog.dart';

class Omborxona extends StatefulWidget {
  final bool? direktor;
  const Omborxona({super.key, required this.direktor});

  @override
  State<Omborxona> createState() => _OmborxonaState();
}

class _OmborxonaState extends State<Omborxona> {
  TextEditingController Tovarnomi = TextEditingController();
  TextEditingController Tovarnarxi = TextEditingController();
  TextEditingController Tovarmiqdori = TextEditingController();

  TextEditingController textController = TextEditingController();

  void onSave() {
    for (var i = 0; i < OmbordagiTovarlar.length; i++) {
      if (OmbordagiTovarlar[i].tovarNomi == Tovarnomi.text) {
        setState(() {
          OmbordagiTovarlar[i].miqdor =
              OmbordagiTovarlar[i].miqdor! + int.tryParse(Tovarmiqdori.text)!;
          OmbordagiTovarlar[i].tannarx = double.tryParse(Tovarnarxi.text)!;
          OmbordagiTovarlar[i].narx = double.tryParse(Tovarnarxi.text)! * foyda;
          Tovarmiqdori.clear();
          Tovarnarxi.clear();
          Tovarnomi.clear();
          Navigator.of(context).pop();
        });
      } else {
        setState(() {
          OmbordagiTovarlar.add(
            OmbordagiTovar(
              tovarNomi: Tovarnomi.text,
              narx: double.tryParse(Tovarnarxi.text)! * foyda,
              miqdor: int.tryParse(Tovarmiqdori.text),
              tannarx: double.tryParse(Tovarnarxi.text),
            ),
          );
          Tovarmiqdori.clear();
          Tovarnarxi.clear();
          Tovarnomi.clear();
          Navigator.of(context).pop();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widget.direktor!
          ? null
          : AppBar(
              backgroundColor: const Color.fromARGB(255, 222, 219, 219),
              centerTitle: true,
              title: Text(
                "Omborxona",
                style: TextStyle(
                  color: textcolor,
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                ),
              ),
              actions: [
                AnimSearchBar(
                  width: 320,

                  rtl: true,
                  textController: textController,
                  onSuffixTap: () {
                    setState(() {
                      textController.clear();
                    });
                  },
                  onSubmitted: (search) {},
                ),
                SizedBox(width: 5),
                MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Showdialog(
                          onSave: onSave,
                          Tovarmiqdori: Tovarmiqdori,
                          Tovarnarxi: Tovarnarxi,
                          Tovarnomi: Tovarnomi,
                        );
                      },
                    );
                  },
                  color: Colors.indigoAccent,
                  padding: EdgeInsets.symmetric(vertical: 13),
                  child: Text(
                    "Qo'shish",
                    style: TextStyle(
                      fontSize: 18,
                      color: textcolor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
      drawer: Drawers(),
      body: SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: widget.direktor!
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              SizedBox(height: 90),
              DataTable(
                border: TableBorder.all(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                horizontalMargin: 12,
                columns: [
                  DataColumn(label: Text("№")),
                  DataColumn(
                    label: Row(
                      children: [
                        Text("Tovar nomi"),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.4),
                      ],
                    ),
                  ),
                  DataColumn(label: Text("Miqdori")),
                  DataColumn(label: Text("Tannarx")),
                  DataColumn(label: Text("Summa")),
                ],
                rows: List.generate(OmbordagiTovarlar.length, (index) {
                  return DataRow(
                    cells: [
                      DataCell(Text((index + 1).toString())),
                      DataCell(Text(OmbordagiTovarlar[index].tovarNomi!)),
                      DataCell(
                        Text(OmbordagiTovarlar[index].miqdor!.toInt().toString()),
                      ),
                      DataCell(
                        Text(
                          NumberFormat.decimalPattern(
                            "ru",
                          ).format(OmbordagiTovarlar[index].tannarx),
                        ),
                      ),
                      DataCell(
                        Text(
                          NumberFormat.decimalPattern(
                            "ru",
                          ).format(OmbordagiTovarlar[index].narx),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
