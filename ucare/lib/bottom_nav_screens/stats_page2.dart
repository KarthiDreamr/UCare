import 'package:fl_chart/fl_chart.dart' as stats_page2;
import 'package:flutter/material.dart';
import '../custom_widgets/custom_card_text.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 34, right: 2),
          child: CustomBarChart(),
          // VerticalChart()
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomCardText(
                    textValue: "\n\u2756 A new persistent urge to urinate"
                        "\n\u2756 Bloody or pink-colored urine "
                        "\n\u2756 Cloudy or foul-smelling urine"
                        "\n\u2756 Pain or burning when urinating"
                        "\n\u2756 Pain in your back, side or groin",
                    headingValue: "Problems",
                    isTop: true),
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
    return stats_page2.BarChart(
      stats_page2.BarChartData(
        // barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        // gridData: gridData,
        alignment: stats_page2.BarChartAlignment.spaceAround,
        maxY: 100,
        minY: 0,
      ),
    );
  }

  stats_page2.FlBorderData get borderData => stats_page2.FlBorderData(
    border: const Border(
      left: BorderSide(color: Colors.black, width: 1),
      bottom: BorderSide(color: Colors.black, width: 1),
    ),
  );

  Widget getTitles(double value, stats_page2.TitleMeta meta) {
    const style = TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 13.5,
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
      case 5:
        text = 'Death';
        break;
      case 6:
        text = 'Mental';
        break;
      default:
        text = '';
        break;
    }
    return stats_page2.SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  stats_page2.FlTitlesData get titlesData => stats_page2.FlTitlesData(
        show: true,
        bottomTitles: stats_page2.AxisTitles(
          sideTitles: stats_page2.SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,

          ),
        ),
        leftTitles: const stats_page2.AxisTitles(
          sideTitles: stats_page2.SideTitles(
              showTitles: true,
            reservedSize: 35,
            interval: 25
          ),
        ),
        topTitles: const stats_page2.AxisTitles(
          sideTitles: stats_page2.SideTitles(showTitles: false),
        ),
        rightTitles: const stats_page2.AxisTitles(
          sideTitles: stats_page2.SideTitles(showTitles: false),
        ),
      );

  //
  // LinearGradient get _barsGradient => const LinearGradient(
  //       colors: [
  //         Colors.red,
  //         Colors.orange,
  //         Colors.green,
  //       ],
  //       begin: Alignment.bottomCenter,
  //       end: Alignment.topCenter,
  //     );


  LinearGradient get _barsGradient => const LinearGradient(
        colors: [
          Colors.red,
          Colors.orange,
          Colors.green,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<stats_page2.BarChartGroupData> get barGroups => [

        stats_page2.BarChartGroupData(
          x: 0,
          barRods: [
            stats_page2.BarChartRodData(
              toY: 70,
              gradient: const LinearGradient(
                colors: [
                  Colors.red,
                  Colors.orange,
                  Colors.green,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            )
          ],
        ),
        stats_page2.BarChartGroupData(
          x: 1,
          barRods: [
            stats_page2.BarChartRodData(
              toY: 96,
              gradient: _barsGradient,
            )
          ],
        ),
        stats_page2.BarChartGroupData(
          x: 2,
          barRods: [
            stats_page2.BarChartRodData(
              toY: 85,
              gradient: _barsGradient,
            )
          ],
        ),
        stats_page2.BarChartGroupData(
          x: 3,
          barRods: [
            stats_page2.BarChartRodData(
              toY: 79,
              gradient: _barsGradient,
            )
          ],
        ),
        stats_page2.BarChartGroupData(
          x: 4,
          barRods: [
            stats_page2.BarChartRodData(
              toY: 100,
              gradient: _barsGradient,
            )
          ],
        ),
        stats_page2.BarChartGroupData(
          x: 3,
          barRods: [
            stats_page2.BarChartRodData(
              toY: 79,
              gradient: _barsGradient,
            )
          ],
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
      aspectRatio: 1.4,
      child: _BarChart(),
    );
  }
}
