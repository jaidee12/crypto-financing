import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExchangeCard extends StatelessWidget {
  const ExchangeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF131313),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          // Currency Selector Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCurrencyPicker("🇺🇸 USD"),
              const Icon(Icons.swap_horiz, color: Colors.grey),
              _buildCurrencyPicker("🇪🇺 EUR"),
            ],
          ),

          const SizedBox(height: 30),

          // Amount Display
          const Text(
            "\$16,058.94",
            style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            "Available : \$16,56484.97",
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),

          const SizedBox(height: 20),
          const Divider(color: Colors.white10),
          const SizedBox(height: 10),

          // Conversion Rate
          Text(
            "1 USD = 0.94 EUR",
            style: TextStyle(color: Colors.grey[400], fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrencyPicker(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 16),
        ],
      ),
    );
  }
}