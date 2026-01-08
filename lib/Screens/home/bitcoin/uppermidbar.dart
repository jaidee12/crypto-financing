import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/controllartotalamount.dart';



class uppermidbar extends StatelessWidget {
  const uppermidbar({super.key});

  @override
  Widget build(BuildContext context) {
    // Access your controller
    final DashboardController controller = Get.find<DashboardController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end, // Aligns text and possibly a button at the bottom
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Wrap the title in a Row to add the icon
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/bitcoin.png", // Your custom icon path
                    height: 18, // Adjust size to match your text height
                    width: 18,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 8), // Space between icon and text
                  Text(
                    "Bitcoin",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14, // Slightly larger to balance the icon
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Obx(() => Text(
                "\$${controller.totalBalance.value.toStringAsFixed(2)}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.2,
                ),
              )),
            ],
          )
          // You can add a 'Monthly Profit' or 'Icon' here to fill the Right side of the Row
        ],
      ),
    );
  }
}