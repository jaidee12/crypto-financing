import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class midpanel extends StatelessWidget {
  midpanel({super.key});

  final List<Map<String, dynamic>> _cardData = [
    {
      'title': 'Wallet',
      'color': Colors.white10,
      'iconPath': 'assets/wallet.png', // Path to your file
    },
    {
      'title': 'Transaction',
      'color': Colors.white10,
      'iconPath': 'assets/transaction.png',
    },
    {
      'title': 'Payment',
      'color': Colors.white10,
      'iconPath': 'assets/credit-card.png',
    },
    {
      'title': 'More',
      'color': Colors.white10,
      'iconPath': 'assets/more.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // 1. Important: Use shrinkWrap if this is inside a Column or ListView
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),

      // 2. Define the grid layout
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,          // 2 columns
        crossAxisSpacing: 10,       // horizontal space
        mainAxisSpacing: 10,        // vertical space
        childAspectRatio: 1.1,      // Controls the height (1.0 is a square)
      ),

      itemCount: _cardData.length,
        itemBuilder: (context, index) {
          final data = _cardData[index];
          return Container(
            decoration: BoxDecoration(
              color: data['color'],
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Your Custom Icon at the top right
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    data['iconPath'],
                    width: 28,  // Control your custom icon size here
                    height: 28,
                    color: Colors.white, // Tint your icon white
                    fit: BoxFit.contain,
                  ),
                ),

                Text(
                  data['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        },
    );
  }
}

