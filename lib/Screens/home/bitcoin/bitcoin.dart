import 'package:crypto_finnace/Screens/home/bitcoin/topbar.dart';
import 'package:crypto_finnace/Screens/home/bitcoin/upperbottombar.dart';
import 'package:crypto_finnace/Screens/home/bitcoin/uppermidbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottombar.dart';
import 'midbar.dart';

class bitcoin extends StatelessWidget {
  // Add these variables to receive data from the click on the first screen
  final List<double> graphData;
  final Color trendColor;

  bitcoin({
    super.key,
    required this.graphData,
    required this.trendColor
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const topbar(),
                const SizedBox(height: 15),
                const uppermidbar(),
                const SizedBox(height: 10),
                // Pass the data into midbar
                midbar(
                  graphData: graphData,
                  trendColor: trendColor,
                ),
                const SizedBox(height: 10),
                const upperbottombar(),
                const SizedBox(height: 10),
                const bottombar(),
                const SizedBox(height: 10),
              ],
            )
        )
    );
  }
}