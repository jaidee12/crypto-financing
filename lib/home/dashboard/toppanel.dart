import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class toppanel extends StatelessWidget{
  const toppanel({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side text
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.black,
                child: Image.asset(
                  "assets/1.ico",
                  height: 45,
                  width: 45,
                  fit: BoxFit.contain,
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 18, left: 5, right: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                "Hello,\t jaidee 👋",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,

                ),
              ),
              )
            ],
          ),
          Row(
            children: [

              CircleAvatar(
                radius: 23, // Total size will be 44x44
                backgroundColor: Colors.white10, // Subtle transparent white
                child: Image.asset(
                  "assets/bell-school.png",
                  height: 20,
                  width: 20,
                  color: Colors.white,
                ),
              ),
SizedBox(width: 5),
              CircleAvatar(
                radius: 23, // Total size will be 44x44
                backgroundColor: Colors.white10, // Subtle transparent white
                child: Image.asset(
                  "assets/bell-school.png",
                  height: 20,
                  width: 20,
                  color: Colors.white,
                ),
              )

            ]
          )

          // Right side avatar





        ],
      ),
    );
  }


}