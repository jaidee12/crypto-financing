import 'package:flutter/material.dart';
import 'exchangecard.dart';

class ExchangeScreen extends StatelessWidget {
  const ExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          const ExchangeCard(),

          const SizedBox(height: 30),

          // --- NEW WRAPPER CONTAINER ---
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF131313), // Subtle white tint
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.05)), // Optional slight border
            ),
            child: Column(
              children: [
                _buildDetailRow("Tax (2%)", "\$2.00"),
                _buildDetailRow("Exchange fee (1%)", "\$1.00"),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(color: Colors.white10, thickness: 1),
                ),
                _buildDetailRow("Total amount", "€90.7", isTotal: true),
              ],
            ),
          ),
          // -----------------------------

          const SizedBox(height: 40),

          _buildExchangeButton(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // Helper method for the transaction details rows
  Widget _buildDetailRow(String title, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
          Text(
            value,
            style: TextStyle(
              color: isTotal ? Colors.white : Colors.grey[400],
              fontSize: 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for the Primary Action Button
  Widget _buildExchangeButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        onPressed: () {
          // Add your exchange logic here
        },
        child: const Text(
          "Exchange",
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}