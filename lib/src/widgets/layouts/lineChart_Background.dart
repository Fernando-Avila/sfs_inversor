import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';

class LineChartBackground extends StatelessWidget {
  const LineChartBackground(
      {Key? key,
      required this.max,
      required this.width,
      required this.height,
      required this.value})
      : super(key: key);
  final double max;
  final double value;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = [
      EstiloApp.primarypink,
      EstiloApp.primarypurple
    ];
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
        // color: Color(0xff232d37),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          // color: Color(0xff232d37),
        ),
        child: LineChart(
          LineChartData(
            titlesData: FlTitlesData(
              show: false,
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
            ),
            borderData: FlBorderData(
              show: false,
              border: Border.all(color: EstiloApp.primaryblue),
            ),
            gridData: FlGridData(
              show: false,
              drawVerticalLine: false,
              horizontalInterval: 10,
              verticalInterval: 10,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
            ),
            minX: 0,
            maxX: max,
            minY: 0,
            maxY: max,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 00),
                  FlSpot(value, value),
                ],
                isCurved: true,
                curveSmoothness: 5,
                gradient: LinearGradient(
                  colors: gradientColors,
                ),
                barWidth: 0,
                isStrokeCapRound: false,
                dotData: FlDotData(
                  show: false,
                ),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: gradientColors
                        .map((color) => color.withOpacity(0.3))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
