import 'package:crypto_finnace/home/dashboard/summarycards.dart';
import 'package:crypto_finnace/home/dashboard/toppanel.dart';
import 'package:crypto_finnace/home/dashboard/uppermidpanel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'midpanel.dart';

class dashboard extends StatelessWidget{

  dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
     body:  SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            toppanel(),
            SizedBox(height: 10),
            uppermidpanel(),
            midpanel(),
            SizedBox(height: 10),
            CryptoSummaryGrid()



          ],
        )


      )
    );
  }}