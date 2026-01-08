import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


import '../../../controllers/controllartotalamount.dart';
import '../bitcoin/bitcoin.dart';


class CandleData {
  CandleData({required this.x, required this.open, required this.high, required this.low, required this.close});
  final double x;
  final double open;
  final double high;
  final double low;
  final double close;
}

class CryptoSummaryGrid extends StatelessWidget {
  const CryptoSummaryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.find<DashboardController>();

    return Obx(() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SummaryCardWithGraph(
            background: Colors.white10, // Bitcoin Orange
            title: "Bitcoin",
            percent: "+2.4%",
            amount: "${controller.getBtcValue()} BTC",
            // More data points make the curve look smoother
            graphData: [10, 15, 12, 18, 28, 22, 35, 30, 45], iconPath: 'assets/bitcoin.png',
          ),
          const SizedBox(height: 16),
          SummaryCardWithGraph(
            background: Colors.white10, // Ethereum Blue
            title: "Ethereum",
            percent: "-1.2%",
            amount: "${controller.getEthValue()} ETH",
            graphData: [40, 35, 38, 25, 20, 22, 15, 18, 10], iconPath: 'assets/ethereum.png',
          ),
        ],
      ),
    ));
  }
}
class SummaryCardWithGraph extends StatelessWidget {
  final Color background;
  final String title;
  final String percent;
  final String amount;
  final List<double> graphData;
  final String iconPath; // Added iconPath parameter

  const SummaryCardWithGraph({
    super.key,
    required this.background,
    required this.title,
    required this.percent,
    required this.amount,
    required this.graphData,
    required this.iconPath, // Initialize it here
  });

  @override
  Widget build(BuildContext context) {
    bool isPositive = graphData.isNotEmpty && (graphData.last >= graphData.first);
    Color trendColor = isPositive ? Colors.greenAccent : Colors.redAccent;

    final List<CandleData> candleList = [];
    for (int i = 0; i < graphData.length; i++) {
      double close = graphData[i];
      // We simulate OHLC data using your single price point
      double open = i == 0 ? close * 0.99 : graphData[i - 1];
      double high = (close > open ? close : open) * 1.01;
      double low = (close < open ? close : open) * 0.99;

      candleList.add(CandleData(
        x: i.toDouble(),
        open: open,
        high: high,
        low: low,
        close: close,
      ));
    }

    return GestureDetector(
        onTap: () {
          Get.to(() => bitcoin(
            graphData: graphData,
            trendColor: trendColor,
          ));
        },

      child:Container(
      width: double.infinity,
      height: 210,
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
              // New Row for Icon + Title
              Row(
                children: [
                  Image.asset(
                    iconPath,
                    width: 24,
                    height: 24,
                    fit: BoxFit.contain,
                    // If your icons are black/white, you can tint them:
                    // color: Colors.white,
                  ),
                  const SizedBox(width: 10), // Space between icon and text
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ],
              ),

              // Percent Bubble
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                    color: trendColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text(
                    percent,
                    style: TextStyle(fontSize: 12, color: trendColor, fontWeight: FontWeight.bold)
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(amount, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
          const Spacer(),
          SizedBox(
            height: 80, // Slightly taller for better Dribbble visibility
            width: double.infinity,
            child: SfCartesianChart(
              margin: EdgeInsets.zero,
              plotAreaBorderWidth: 0,
              // Modern grid lines like the image
              primaryYAxis: const NumericAxis(
                isVisible: true, // Set to true for the horizontal line look
                labelStyle: TextStyle(color: Colors.transparent), // Hide numbers but keep lines
                majorGridLines: MajorGridLines(width: 1, color: Colors.white10),
                axisLine: AxisLine(width: 1),
              ),
              primaryXAxis: const NumericAxis(isVisible: false),
              series: <CandleSeries<CandleData, double>>[
                CandleSeries<CandleData, double>(
                  dataSource: candleList,
                  xValueMapper: (CandleData data, _) => data.x,
                  lowValueMapper: (CandleData data, _) => data.low,
                  highValueMapper: (CandleData data, _) => data.high,
                  openValueMapper: (CandleData data, _) => data.open,
                  closeValueMapper: (CandleData data, _) => data.close,

                  // --- STYLING TO MATCH REFERENCE ---
                  enableSolidCandles: true, // Solid color for that bold look
                  bearColor: Colors.redAccent,
                  bullColor: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(4), // Rounded candles like the UI
                  width: 0.2, // Adjusts "fatness" of the candle
                ),
              ],
            ),
          ),
        ],
      ),
      )
    );
  }
}
class SalesLinePainter extends CustomPainter {
  final List<double> dataPoints;
  final Color lineColor;

  SalesLinePainter({required this.dataPoints, required this.lineColor});

  @override
  void paint(Canvas canvas, Size size) {
    if (dataPoints.length < 2) return;

    final double dx = size.width / (dataPoints.length - 1);
    final double maxY = dataPoints.reduce((a, b) => a > b ? a : b);
    final double minY = dataPoints.reduce((a, b) => a < b ? a : b);
    final double range = (maxY - minY) == 0 ? 1 : (maxY - minY);

    double getY(double value) => size.height - ((value - minY) / range * size.height);

    final linePaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [lineColor.withOpacity(0.3), lineColor.withOpacity(0.0)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();
    final fillPath = Path();

    path.moveTo(0, getY(dataPoints[0]));
    fillPath.moveTo(0, size.height);
    fillPath.lineTo(0, getY(dataPoints[0]));

    for (int i = 0; i < dataPoints.length - 1; i++) {
      double x1 = i * dx;
      double y1 = getY(dataPoints[i]);
      double x2 = (i + 1) * dx;
      double y2 = getY(dataPoints[i + 1]);
      double cx = x1 + (x2 - x1) / 2;

      path.cubicTo(cx, y1, cx, y2, x2, y2);
      fillPath.cubicTo(cx, y1, cx, y2, x2, y2);
    }

    fillPath.lineTo(size.width, size.height);
    fillPath.close();

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant SalesLinePainter oldDelegate) => oldDelegate.dataPoints != dataPoints;
}