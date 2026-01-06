import 'package:get/get.dart';

class DashboardController extends GetxController {
  var totalBalance = 16548.97.obs;

  // Conversion rates (usually fetched from an API)
  double get btcRate => 45000.0;
  double get ethRate => 2400.0;

  // Helper to get converted strings
  String getBtcValue() => (totalBalance.value / btcRate).toStringAsFixed(4);
  String getEthValue() => (totalBalance.value / ethRate).toStringAsFixed(3);
}