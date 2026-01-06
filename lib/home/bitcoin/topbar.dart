import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class topbar extends StatelessWidget {
  const topbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side: BACK BUTTON
          GestureDetector(
            onTap: () => Get.back(), // Navigates to the previous screen
            child: CircleAvatar(
              radius: 23,
              backgroundColor: Colors.white10,
              child: Image.asset(
                "assets/back.png",
                height: 20,
                width: 20,
                fit: BoxFit.contain,
                color: Colors.white,
              ),
            ),
          ),

          // Right side: Bell and Star
          Row(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white10,
                  child: Image.asset(
                    "assets/bell-school.png",
                    height: 20,
                    width: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 5),
                CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white10,
                  child: Image.asset(
                    "assets/star.png",
                    height: 20,
                    width: 20,
                  ),
                )
              ]
          )
        ],
      ),
    );
  }
}