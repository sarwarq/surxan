import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surxan/data.dart';

class SotuvTovar extends StatefulWidget {
  int index;
  final VoidCallback onDelete;
  SotuvTovar({super.key, required this.index, required this.onDelete});

  @override
  State<SotuvTovar> createState() => _SotuvTovarState();
}

class _SotuvTovarState extends State<SotuvTovar> {
  bool Merror = false;
  bool item = false;
  String? selectedValue;
  TextEditingController Mijoz = TextEditingController();

  void showdialog() {
    TextEditingController Tovarnomi = TextEditingController(
      text: tovarlarRoyxati[widget.index].tovarNomi,
    );
    TextEditingController Tovarnarxi = TextEditingController(
      text: tovarlarRoyxati[widget.index].narx!.toInt().toString(),
    );
    TextEditingController Tovarmiqdori = TextEditingController(
      text: tovarlarRoyxati[widget.index].qoldiq!.toInt().toString(),
    );
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: Tovarnomi,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: "Tovar Nomi",
                  ),
                ),
                TextField(
                  controller: Tovarnarxi,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: "Narx",
                  ),
                ),
                TextField(
                  controller: Tovarmiqdori,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: "Miqdor",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          tovarlarRoyxati[widget.index] = Tovar(
                            tovarNomi: Tovarnomi.text,
                            mijoz: "",
                            qoldiq: double.tryParse(Tovarmiqdori.text),
                            sotilganVaqti: "",
                            narx: double.tryParse(Tovarnarxi.text),
                          );

                          Tovarmiqdori.clear();
                          Tovarnarxi.clear();
                          Tovarnomi.clear();
                          Navigator.of(context).pop();
                        });
                      },
                      child: Text(
                        "Tahrirlash",
                        style: TextStyle(color: textcolor),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Chiqish",
                        style: TextStyle(color: textcolor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.55,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black26, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: size.height * 0.27,
            width: size.width * 0.8,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  "https://ecommerce.datablitz.com.ph/cdn/shop/products/ssd-plus-sata-iii-ssd-left.png.wdthumb.1280.1280_1_9878ef4a-d7e9-4811-a4f2-0a7b57104fbd.png?v=1676912917",
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PopupMenuButton(
                  position: PopupMenuPosition.under,
                  offset: Offset(-80, 0),
                  itemBuilder: (context) => [
                    PopupMenuItem(value: "item1", child: Text("Rasm joylash")),
                    PopupMenuItem(value: "item2", child: Text("Tahrirlash")),
                    PopupMenuItem(value: "item3", child: Text("O'chirish")),
                  ],
                  onSelected: (value) {
                    if (value == "item1") {
                      //
                    } else if (value == "item2") {
                      showdialog();
                    } else if (value == "item3") {
                      if (0 <= widget.index &&
                          widget.index < tovarlarRoyxati.length) {
                        widget.onDelete();
                      }
                    }
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                NumberFormat.decimalPattern(
                  "ru",
                ).format(tovarlarRoyxati[widget.index].narx! * sotilishMiqdori),
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[300],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  shape: BoxShape.circle,
                ),
                child: Text(
                  tovarlarRoyxati[widget.index].qoldiq!.toInt().toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
          Text(
            tovarlarRoyxati[widget.index].tovarNomi!,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: textcolor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width * 0.1,
                //height: size.height * 0.035,
                child: TextField(
                  controller: Mijoz,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: Merror
                          ? BorderSide(color: Colors.red)
                          : BorderSide(color: Colors.black38),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "Mijoz",
                  ),
                ),
              ),
              Container(
                width: size.width * 0.07,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: item
                      ? Border.all(color: Colors.red, width: 1)
                      : Border.all(color: Colors.black54, width: 1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (sotilishMiqdori > 1) {
                            sotilishMiqdori = sotilishMiqdori - 1;
                          }
                        });
                      },
                      child: Icon(Icons.remove),
                    ),
                    Text(
                      sotilishMiqdori.toString(),
                      style: TextStyle(fontSize: 22),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          sotilishMiqdori = sotilishMiqdori + 1;
                        });
                      },
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (Mijoz.text.isNotEmpty &&
                          sotilishMiqdori <=
                              tovarlarRoyxati[widget.index].qoldiq!
                                  .toDouble() &&
                          tovarlarRoyxati[widget.index].qoldiq! > 0) {
                        tovarlar.add(
                          Tovar(
                            tovarNomi: tovarlarRoyxati[widget.index].tovarNomi,
                            mijoz: Mijoz.text,
                            qoldiq:
                                tovarlarRoyxati[widget.index].qoldiq! -
                                sotilishMiqdori,
                            sotilganVaqti: "",
                            sotilishMiqdori: sotilishMiqdori,
                            narx:
                                tovarlarRoyxati[widget.index].narx! *
                                sotilishMiqdori,
                          ),
                        );
                        tovarlarRoyxati[widget.index].qoldiq =
                            tovarlarRoyxati[widget.index].qoldiq! -
                            sotilishMiqdori;
                        Mijoz.clear();
                        Merror = false;
                        item = false;
                        sotilishMiqdori = 1;
                      } else {
                        if (Mijoz.text.isEmpty) {
                          Merror = true;
                        } else {
                          Merror = false;
                        }
                        if (sotilishMiqdori! >
                            tovarlarRoyxati[widget.index].qoldiq!.toDouble()) {
                          item = true;
                        } else {
                          item = false;
                        }
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    padding: EdgeInsets.symmetric(vertical: 20),
                  ),
                  child: Text(
                    "Sotish",
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(color: textcolor),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
