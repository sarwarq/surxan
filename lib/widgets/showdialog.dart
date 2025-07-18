import 'package:flutter/material.dart';
import 'package:surxan/data.dart';

class Showdialog extends StatefulWidget {
  final VoidCallback onSave;
  final TextEditingController Tovarnomi;
  final TextEditingController Tovarnarxi;
  final TextEditingController Tovarmiqdori;
  const Showdialog({
    super.key,
    required this.onSave,
    required this.Tovarmiqdori,
    required this.Tovarnarxi,
    required this.Tovarnomi,
  });

  @override
  State<Showdialog> createState() => _ShowdialogState();
}

class _ShowdialogState extends State<Showdialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: widget.Tovarnomi,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                hintText: "Tovar Nomi",
              ),
            ),
            TextField(
              controller: widget.Tovarnarxi,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                hintText: "Tannarx",
              ),
            ),
            TextField(
              controller: widget.Tovarmiqdori,
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
                  onPressed: widget.onSave,
                  child: Text("Saqlash", style: TextStyle(color: textcolor)),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Chiqish", style: TextStyle(color: textcolor)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
