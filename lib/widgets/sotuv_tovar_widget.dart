import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surxan/data.dart';

class SotuvTovar extends StatefulWidget {
  const SotuvTovar({super.key});

  @override
  State<SotuvTovar> createState() => _SotuvTovarState();
}

class _SotuvTovarState extends State<SotuvTovar> {
  int num = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.55,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: size.height * 0.27,
            width: size.width * 0.8,
            child: CachedNetworkImage(
              imageUrl:
                  "https://ecommerce.datablitz.com.ph/cdn/shop/products/ssd-plus-sata-iii-ssd-left.png.wdthumb.1280.1280_1_9878ef4a-d7e9-4811-a4f2-0a7b57104fbd.png?v=1676912917",
              progressIndicatorBuilder: (_, url, progress) {
                if (progress.progress != null) {
                  final percent = progress.progress! * 100;
                  return Text("${percent}% done loading");
                }
                return Text("Loaded $url!");
              },
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                NumberFormat.decimalPattern("ru").format(120000),
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[300],
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue[100],
                radius: 15,
                child: Text(
                  "10",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
          Text(
            "SSD",
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
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
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
                  border: Border.all(color: Colors.black54, width: 1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (num > 1) {
                            num--;
                          }
                        });
                      },
                      child: Icon(Icons.remove),
                    ),
                    Text(num.toString(), style: TextStyle(fontSize: 22)),
                    InkWell(
                      onTap: () {
                        setState(() {
                          num++;
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
                  onPressed: () {},
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
