import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:surxan/data.dart';
import 'package:surxan/widgets/sotuv_tovar_widget.dart';

class Sotuv extends StatefulWidget {
  const Sotuv({super.key});

  @override
  State<Sotuv> createState() => _SotuvState();
}

class _SotuvState extends State<Sotuv> {
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
                      IconButton(onPressed: () {}, icon: Icon(Icons.history)),
                      SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () {},
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
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,),
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  itemBuilder: (context, index) {
                    return SotuvTovar();
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
