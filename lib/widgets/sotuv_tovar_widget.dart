import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surxan/data.dart';

class SotuvTovar extends StatefulWidget {
  final OmbordagiTovar tovar;
  final VoidCallback onDeleted;
  const SotuvTovar({super.key, required this.tovar, required this.onDeleted});

  @override
  State<SotuvTovar> createState() => _SotuvTovarState();
}

class _SotuvTovarState extends State<SotuvTovar> {
  TextEditingController Mijoz = TextEditingController();
  bool MijozisEmpty = false;
  int sotilishMiqdor = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.55,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: widget.tovar.miqdor == 0
              ? Colors.red
              : Colors.black26,
          width: widget.tovar.miqdor == 0 ? 2 : 1,
        ),
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                NumberFormat.decimalPattern("ru").format(
                  widget.tovar.narx! * sotilishMiqdor,
                ),
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
                  widget.tovar.miqdor!.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
          Text(
            widget.tovar.tovarNomi!,
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
                      borderSide: MijozisEmpty
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
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.tovar.miqdor! >
                              sotilishMiqdor) {
                            sotilishMiqdor += 1;
                          }
                        });
                      },
                      icon: Icon(Icons.add),
                    ),
                    Text(
                      sotilishMiqdor.toString(),
                      style: TextStyle(fontSize: 24),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (sotilishMiqdor > 1) {
                            sotilishMiqdor -= 1;
                          }
                        });
                      },
                      icon: Icon(Icons.remove),
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
                      if (Mijoz.text.isEmpty) {
                        MijozisEmpty = true;
                      } else if (!(widget.tovar.miqdor ==
                          0)) {
                        SotilganTovarlar.add(
                          SotilganTovar(
                            mijoz: Mijoz.text,
                            tovarNomi:
                                widget.tovar.tovarNomi,
                            miqdor: sotilishMiqdor,
                            narx:
                                widget.tovar.narx! *
                                sotilishMiqdor,
                            sotilganVaqti: DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()),
                          ),
                        );
                        Mijoz.clear();
                        MijozisEmpty = false;
                       widget.tovar.miqdor =
                            widget.tovar.miqdor! -
                            sotilishMiqdor;
                        sotilishMiqdor = 1;
                        if ((widget.tovar.miqdor == 0)) {
                          OmbordagiTovarlar.remove(widget.tovar);
                          widget.onDeleted;
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
