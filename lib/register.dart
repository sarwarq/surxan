import 'package:flutter/material.dart';
import 'package:surxan/data.dart';
import 'package:surxan/home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController textcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  void checkText() {
    setState(() {
      if (textcontroller.text == "Sarvar" &&
          passwordcontroller.text == "123456") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        textcontroller.clear();
        passwordcontroller.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height * 0.4,
          width: size.width * 0.25,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: boxshadow,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.black26,
                child: Icon(Icons.person, size: 35, color: Colors.black),
              ),
              //SizedBox(height: size.height *0.05,),
              TextField(
                controller: textcontroller,
                cursorColor: Colors.black54,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "User",
                ),
              ),
              //SizedBox(height: size.height *0.03,),
              TextField(
                controller: passwordcontroller,
                cursorColor: Colors.black54,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Password",
                ),
              ),
              //SizedBox(height: size.height *0.04,),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    checkText();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),
                child: Text("Kirish", style: TextStyle(color: textcolor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
