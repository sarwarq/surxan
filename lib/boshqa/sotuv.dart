import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:surxan/data.dart';
import 'package:surxan/screens/Dokon.dart';
import 'package:surxan/widgets/sotuv_tovar_widget.dart';

class Sotuv extends StatefulWidget {
  const Sotuv({super.key});

  @override
  State<Sotuv> createState() => _SotuvState();
}

class _SotuvState extends State<Sotuv> {
  void showdialog() {
    TextEditingController Tovarnomi = TextEditingController();
    TextEditingController Tovarnarxi = TextEditingController();
    TextEditingController Tovarmiqdori = TextEditingController();
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
                          tovarlarRoyxati.add(
                            Tovar(
                              tovarNomi: Tovarnomi.text,
                              mijoz: "",
                              qoldiq: double.tryParse(Tovarmiqdori.text),
                              sotilganVaqti: "",
                              narx: double.tryParse(Tovarnarxi.text),
                            ),
                          );
                          Tovarmiqdori.clear();
                          Tovarnarxi.clear();
                          Tovarnomi.clear();
                          Navigator.of(context).pop();
                        });
                      },
                      child: Text(
                        "Saqlash",
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
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.3,
                  child: TextField(
                    scrollPadding: EdgeInsets.all(0),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: "Search",
                    ),
                  ),
                ),

                SizedBox(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Dokon()),
                          );
                        },
                        icon: Icon(Icons.history),
                      ),
                      SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () {
                          showdialog();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(5),
                          ),
                          elevation: 2,
                        ),
                        child: Text(
                          "Qo'shish",
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge?.copyWith(color: textcolor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: MasonryGridView.builder(
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  itemCount: tovarlarRoyxati.length,
                  itemBuilder: (context, index) {
                    return SotuvTovar(index: index, onDelete: () {
                       setState(() {
                          tovarlarRoyxati.removeAt(index);
                        });
                    },);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
