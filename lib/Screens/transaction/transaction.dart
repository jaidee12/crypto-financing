import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Assuming you are using GetX for navigation
import 'Topbar.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        // 1. Back Button (Dribbble style uses arrow_back_ios usually)
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Get.back(), // Or Navigator.pop(context)
        ),
        // 2. Title Styling
        title: const Text(
          "Exchange",
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600
          ),
        ),
        // 3. Bell Icon
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {
              // Notification logic
            },
          ),
          const SizedBox(width: 8), // Padding from the right edge
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ExchangeScreen(),
          ],
        ),
      ),
    );
  }
}