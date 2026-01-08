import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../controllers/controllartotalamount.dart';



class upperbottombar extends StatelessWidget {
  const upperbottombar({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the left
            children: [
              Text(
                "Your Balance",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              // Obx only wraps the part that actually changes
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
          ),


          Container(
            padding: EdgeInsets.only(top: 18, left: 5, right: 5, bottom: 10),
          child: Obx(() => Text(
            "${controller.getBtcValue()} BTC",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              letterSpacing: 1.2,
            ),
          )),
          )
          // You can add a 'Monthly Profit' or 'Icon' here to fill the Right side of the Row
        ],
      ),
    );
  }
}