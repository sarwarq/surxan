import 'package:flutter/material.dart';
import 'package:surxan/screens/Asosiy.dart';
import 'package:surxan/screens/Dokon.dart';
import 'package:surxan/screens/Kassa%20aparat.dart';
import 'package:surxan/screens/Omborxona.dart';

import 'package:surxan/screens/Xizmat.dart';
import 'package:surxan/screens/Xodimlar.dart';

Color? backgroundColor = const Color.fromARGB(246, 231, 236, 240);
Color? textcolor = const Color.fromARGB(255, 8, 31, 71);

List mainscreenIcon = [
  "assets/icons/main/Main.png",
  "assets/icons/main/Service.png",
  "assets/icons/main/Shop.png",
  "assets/icons/main/Warehouse.png",
  "assets/icons/main/Employee.png",
  "assets/icons/main/Phone.png",
];

List mainscreenIconName = [
  "Asosiy",
  "Xizmat",
  "Do'kon",
  "Omborxona",
  "Xodimlar",
  "Kassa aparat",
];

List screens = [
  Asosiy(),
  Xizmat(),
  Dokon(),
  Omborxona(),
  Xodimlar(),
  Kassaaparat(),
];

ValueNotifier<int> page = ValueNotifier(0);

List<BoxShadow> boxshadow = [
  BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(2, 2)),
];

class Product {
  String icon;
  double money;
  String product;
  List<Color?> productcolor = [];
  Product({
    required this.icon,
    required this.money,
    required this.product,
    required this.productcolor,
  });
}

List<Product> kirimlar = [
  Product(
    icon: "assets/icons/main/Service.png",
    money: 0,
    product: "Xizmat",
    productcolor: [Colors.blue[200], Colors.blue[900]],
  ),
  Product(
    icon: "assets/icons/main/Shop.png",
    money: 0,
    product: "Savdo",
    productcolor: [Colors.yellow[200], Colors.yellow[900]],
  ),
  Product(
    icon: "assets/icons/main/Phone.png",
    money: 0,
    product: "Kassa aparat",
    productcolor: [Colors.deepPurple[200], Colors.deepPurple[900]],
  ),
];
