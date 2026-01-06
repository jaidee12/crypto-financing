import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class midbar extends StatelessWidget {
  final List<double> graphData;
  final Color trendColor;

  const midbar({
    super.key,
    required this.graphData,
    required this.trendColor,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Convert your single-value list into CandleData objects
    final List<CandleData> candleList = [];
    for (int i = 0; i < graphData.length; i++) {
      double close = graphData[i];
      double open = i == 0 ? close * 0.99 : graphData[i - 1];
      double high = (close > open ? close : open) * 1.02;
      double low = (close < open ? close : open) * 0.98;

      candleList.add(CandleData(
        x: i.toDouble(),
        open: open,
        high: high,
        low: low,
        close: close,
      ));
    }

    return Column(
      children: [
        // Keep your existing Time Filter Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              _buildTimeFilter("Daily", isActive: true),
              _buildTimeFilter("Weekly"),
              _buildTimeFilter("Monthly"),
              const Spacer(),
              const Icon(Icons.show_chart, color: Colors.white, size: 20),
              const SizedBox(width: 15),
              const Icon(Icons.bar_chart, color: Colors.grey, size: 20),
            ],
          ),
        ),

        const SizedBox(height: 30),

        // REPLACED CustomPaint with SfCartesianChart
        Container(
          height: 280,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SfCartesianChart(
            margin: EdgeInsets.zero,
            plotAreaBorderWidth: 0,

            // X-Axis (Bottom Labels: Mon, Tue, etc.)
            primaryXAxis: CategoryAxis(
              isVisible: true,
              majorGridLines: const MajorGridLines(width: 0),
              axisLine: const AxisLine(width: 0),
              labelStyle: TextStyle(color: Colors.grey[700], fontSize: 10),
              // Optional: mapping indices to days
              labelPlacement: LabelPlacement.onTicks,
            ),

            // Y-Axis (Ghost Grid Lines from your reference)
            primaryYAxis: const NumericAxis(
              isVisible: true,
              labelStyle: TextStyle(color: Colors.transparent),
              majorGridLines: MajorGridLines(width: 0.5, color: Colors.white10),
              axisLine: AxisLine(width: 0),
            ),

            series: <CandleSeries<CandleData, double>>[
              CandleSeries<CandleData, double>(
                dataSource: candleList,
                xValueMapper: (CandleData data, _) => data.x,
                lowValueMapper: (CandleData data, _) => data.low,
                highValueMapper: (CandleData data, _) => data.high,
                openValueMapper: (CandleData data, _) => data.open,
                closeValueMapper: (CandleData data, _) => data.close,

                // --- STYLING ---
                enableSolidCandles: true,
                bearColor: Colors.redAccent.withOpacity(0.8),
                bullColor: trendColor, // Matches your passed trendColor
                borderRadius: BorderRadius.circular(2),
                width: 0.2, // Matches the "slim but clear" look of the bars
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimeFilter(String text, {bool isActive = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.grey,
          fontSize: 14,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

// Data Model used inside the widget
class CandleData {
  CandleData({required this.x, required this.open, required this.high, required this.low, required this.close});
  final double x;
  final double open;
  final double high;
  final double low;
  final double close;
}