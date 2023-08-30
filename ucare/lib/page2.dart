import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ucare/Components/custom_card_text.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 34,
            right: 2
          ),
          child: CustomBarChart(),
              // VerticalChart()
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomCardText(
                    textValue: "\n- A new persistent urge to urinate"
                        "\n- Bloody or pink-colored urine "
                        "\n- Cloudy or foul-smelling urine"
                        "\n- Pain or burning when urinating"
                        "\n- Pain in your back, side or groin",
                    headingValue: "Symptoms"),
                CustomCardText(
                    textValue: "\n- Contact your doctor soon after symptoms"
                        "\n- Take antibiotics to treat urinary tract infections"
                        "\n- Drink water to prevent dehydration"
                        "\n- Use a heating pad to relieve pain ",
                    headingValue: "Recommendations"),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart();

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 100,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.cyan,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'PH';
        break;
      case 1:
        text = 'Hydration';
        break;
      case 2:
        text = 'Color';
        break;
      case 3:
        text = 'Health';
        break;
      case 4:
        text = 'Density';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => const LinearGradient(
        colors: [
          Colors.red,
          Colors.orange,
          Colors.green,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  //       _ChartData('PH', 70),
//       _ChartData('Hydration', 96),
//       _ChartData('Color', 85),
//       _ChartData('Health', 79),
//       _ChartData('Density', 90)

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: 70,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: 96,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: 85,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: 79,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
    BarChartGroupData(
      x: 4,
      barRods: [
        BarChartRodData(
          toY: 90,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
      ];
}

class CustomBarChart extends StatefulWidget {
  const CustomBarChart({super.key});

  @override
  State<StatefulWidget> createState() => CustomBarChartState();
}

class CustomBarChartState extends State<CustomBarChart> {
  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 1.6,
      child: _BarChart(),
    );
  }
}

// class VerticalChart extends StatefulWidget {
//   const VerticalChart({Key? key}) : super(key: key);
//
//   @override
//   State<VerticalChart> createState() => _VerticalChartState();
// }
//
// class _VerticalChartState extends State<VerticalChart> {
//   late List<_ChartData> data;
//   late TooltipBehavior _tooltip;
//
//   @override
//   void initState() {
//     data = [
//       _ChartData('PH', 70),
//       _ChartData('Hydration', 96),
//       _ChartData('Color', 85),
//       _ChartData('Health', 79),
//       _ChartData('Density', 90)
//     ];
//     _tooltip = TooltipBehavior(enable: true);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Health Chart'),
//       ),
//       body: SfCartesianChart(
//         palette: const [
//           Colors.green,
//           Colors.yellow,
//           Colors.red,
//           Colors.blue,
//           Colors.purple
//         ],
//         primaryXAxis: CategoryAxis(
//           // isVisible: false,
//         ),
//         primaryYAxis: NumericAxis(
//           isVisible: false,
//           minimum: 0,
//           maximum: 100,
//           interval: 20,
//         ),
//         tooltipBehavior: _tooltip,
//         series: <ChartSeries<_ChartData, String>>[
//           ColumnSeries<_ChartData, String>(
//               dataSource: data,
//               xValueMapper: (_ChartData data, _) => data.x,
//               yValueMapper: (_ChartData data, _) => data.y,
//               name: 'Gold',
//               // color: const Color.fromRGBO(8, 142, 255, 1),
//             gradient: const LinearGradient(
//               colors: [Colors.red,Colors.yellow,Colors.green]
//             )
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class _ChartData {
//   _ChartData(this.x, this.y);
//
//   final String x;
//   final double y;
// }
