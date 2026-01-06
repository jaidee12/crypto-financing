import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../home/dashboard/controllartotalamount.dart';
import '../home/transaction/transaction.dart';
import 'Navigationcontroller.dart';
import '../home/dashboard/dashboard.dart';

class MainHome extends StatelessWidget {
  MainHome({super.key});

  final NavigationController navBarController = Get.put(NavigationController());
  final DashboardController dashboardController = Get.put(DashboardController());

  final List<Widget> _screens = [
    dashboard(), // Replacehtransaction(),
    TransactionPage(),
    const Center(child: Text("Cards", style: TextStyle(color: Colors.white))),
    const Center(child: Text("Transactions", style: TextStyle(color: Colors.white))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F), // Deep black background from UI
      extendBody: true, // Crucial for the floating effect
      body: Obx(() => IndexedStack(
        index: navBarController.currentindex.value,
        children: _screens,
      )),

      // We use a Padding + Container for the floating effect
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 30),
        child: SizedBox( // Changed from Container to SizedBox
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Creates gap between buttons
            children: [
              _buildNavItem('assets/home.png', 0),
              _buildNavItem('assets/transaction.png', 1),
              _buildNavItem('assets/wallet.png', 2),
              _buildNavItem('assets/graph.png', 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String assetPath, int index) {
    return Obx(() {
      bool isActive = navBarController.currentindex.value == index;

      return Expanded(
        child: GestureDetector(
          onTap: () => navBarController.changeIndex(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4), // Space between individual buttons
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              // Selected = Orange, Unselected = Dark Grey
              color: isActive ? const Color(0xFFFF8A00) : const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(12), // Sharper corners
              boxShadow: isActive ? [
                BoxShadow(
                  color: const Color(0xFFFF8A00).withValues(alpha:0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ] : [],
            ),
            child: Image.asset(
              assetPath,
              width: 24,
              height: 24,
              // Icon is black on orange background, white on grey background
              color: isActive ? Colors.black : Colors.white.withOpacity(0.6),
            ),
          ),
        ),
      );
    });
  }
}