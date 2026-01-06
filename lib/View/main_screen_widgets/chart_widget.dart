import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  final List<PieChartSectionData> sections;
  const ChartWidget({super.key, required this.sections});

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        pieTouchData: PieTouchData(
          touchCallback: (FlTouchEvent event, pieTouchResponse) {
            setState(() {
              if (!event.isInterestedForInteractions ||
                  pieTouchResponse == null ||
                  pieTouchResponse.touchedSection == null) {
                touchedIndex = -1;
                return;
              }
              touchedIndex =
                  pieTouchResponse.touchedSection!.touchedSectionIndex;
            });
          },
        ),
        borderData: FlBorderData(show: false),
        sectionsSpace: 0,
        centerSpaceRadius: 50,
        sections: widget.sections,
      ),
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }
}
