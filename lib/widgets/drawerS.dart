import 'package:flutter/material.dart';
import 'package:surxan/boshqa/sotuv.dart';
import 'package:surxan/register.dart';
import 'package:surxan/screens/Omborxona.dart';

class Drawers extends StatefulWidget {
  const Drawers({super.key});

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  List bar = ["assets/icons/main/Shop.png", "assets/icons/main/Warehouse.png"];
  List barText = ["Do'kon", "Omborxona"];


  List klas = [Sotuv(), Omborxona(direktor: false)];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.16,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return InkWell(
                    hoverColor: Colors.black12,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => klas[index]),
                      );
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage(bar[index]),
                            color: Colors.black87,
                            height: size.height * 0.028,
                          ),
                          SizedBox(width: size.width * 0.01),
                          Text(
                            barText[index],
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(child: Container()),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Register()),
                );
              },
              child: Row(
                children: [
                  Icon(Icons.logout, color: Colors.black87),
                  SizedBox(width: size.width * 0.01),
                  Text(
                    "Chiqish",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
