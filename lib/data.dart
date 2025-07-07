import 'package:flutter/material.dart';
import 'package:surxan/screens/Asosiy.dart';
import 'package:surxan/screens/Dokon.dart';
import 'package:surxan/screens/Kassa%20aparat.dart';
import 'package:surxan/screens/Omborxona.dart';

import 'package:surxan/screens/Xizmat.dart';
import 'package:surxan/screens/Xodimlar.dart';

Color? backgroundColor = const Color.fromARGB(255, 231, 236, 240);
Color? textcolor = const Color.fromARGB(255, 8, 31, 71);

TextStyle textStyle = TextStyle(color: textcolor, fontWeight: FontWeight.w600);

int sotilishMiqdori = 1;

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

class Services {
  String icon;
  double money;
  String product;
  List<Color?> productcolor = [];
  Services({
    required this.icon,
    required this.money,
    required this.product,
    required this.productcolor,
  });
}

class Tovar {
  String? tovarNomi;
  String? mijoz;
  double? qoldiq;
  String? sotilganVaqti;
  double? narx;
  int? sotilishMiqdori;
  Tovar({
    required this.tovarNomi,
    required this.mijoz,
    required this.qoldiq,
    required this.sotilganVaqti,
    required this.narx,
    this.sotilishMiqdori
  });
}

List<Tovar> tovarlar = [
  Tovar(
    tovarNomi: "Kartredj",
    mijoz: "Sarvar",
    qoldiq: 12,
    sotilganVaqti: "12.02.2025",
    narx: 120000,
    sotilishMiqdori: 1
  ),
  Tovar(
    tovarNomi: "SSD",
    mijoz: "Shuhrat",
    qoldiq: 50,
    sotilganVaqti: "16.02.2025",
    narx: 170000,
    sotilishMiqdori: 1
  ),
];
List<Tovar> tovarlarRoyxati = [];

List<Services> kirimlar = [
  Services(
    icon: "assets/icons/main/Service.png",
    money: 0,
    product: "Xizmat",
    productcolor: [Colors.blue[200], Colors.blue[900]],
  ),
  Services(
    icon: "assets/icons/main/Shop.png",
    money: 0,
    product: "Savdo",
    productcolor: [Colors.yellow[200], Colors.yellow[900]],
  ),
  Services(
    icon: "assets/icons/main/Phone.png",
    money: 0,
    product: "Kassa aparat",
    productcolor: [Colors.deepPurple[200], Colors.deepPurple[900]],
  ),
];
