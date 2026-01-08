import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/controllartotalamount.dart';


class bottombar extends StatelessWidget {
  const bottombar({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Find the controller to get the BTC value
    final DashboardController controller = Get.find<DashboardController>();

    return Container(
      width: double.infinity,
      height: 120, // Reduced height since there is no chart
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF131313), // Deep dark grey/black
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon + Title Row
              Row(
                children: [
                  Image.asset(
                    "assets/bitcoin.png",
                    width: 24,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Bitcoin",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),

              // Percent Bubble
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  "+2.4%",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Reactive Balance Text
          Obx(() => Text(
            "${controller.getBtcValue()} BTC",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24, // Made larger for better visibility
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          )),
        ],
      ),
    );
  }
}