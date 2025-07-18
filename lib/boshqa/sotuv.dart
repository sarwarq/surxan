import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:surxan/data.dart';
import 'package:surxan/screens/Dokon.dart';
import 'package:surxan/screens/Omborxona.dart';
import 'package:surxan/widgets/drawerS.dart';
import 'package:surxan/widgets/sotuv_tovar_widget.dart';

class Sotuv extends StatefulWidget {
  const Sotuv({super.key});

  @override
  State<Sotuv> createState() => _SotuvState();
}

class _SotuvState extends State<Sotuv> {
  List bar = ["assets/icons/main/Shop.png", "assets/icons/main/Warehouse.png"];
  List barText = ["Do'kon", "Omborxona"];
  List klas = [Sotuv(), Omborxona(direktor: false,)];
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 222, 219, 219),
        centerTitle: true,
        title: Text(
          "Do'kon",
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
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => Dokon(direktor: false,)));
              },
              icon: Icon(Icons.history, size: 28.spMax, color: Colors.black),
            ),
          ),
        ],
      ),
      drawer:Drawers(),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: MasonryGridView.builder(
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  itemCount: OmbordagiTovarlar.length,
                  itemBuilder: (context, index) {
                    return SotuvTovar(
                      index: index,
                    );
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
