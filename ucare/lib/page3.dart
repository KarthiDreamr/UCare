import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:ucare/Components/custom_card_text.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  final double rangeValue =100;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SfRadialGauge(
          enableLoadingAnimation: true,
          animationDuration: 1500,
          // backgroundColor: Colors.redAccent,
          axes: [
            RadialAxis(
              minimum: 0,
              maximum: 100,
              showLabels: false,
              showTicks: false,
              startAngle: 140,
              endAngle: 40,
              radiusFactor: 0.80,
              pointers: [
                NeedlePointer(
                  tailStyle: const TailStyle(),
                  value: rangeValue,
                  gradient: _linearGradient(rangeValue),
                ),
                RangePointer(
                    value: rangeValue,
                    width: 45,
                    cornerStyle: CornerStyle.bothFlat,
                    gradient: _sweepGradient(rangeValue),
                )
              ],
              axisLineStyle: const AxisLineStyle(
                  cornerStyle: CornerStyle.bothFlat,
                  thickness: 45,
                  color: Colors.grey),
            ),
          ],
        ),
        const Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomCardText(
                    headingValue: " Solutions",
                    textValue: "\n\u2756 A new persistent urge to urinate"
                        "\n\u2756 Bloody or pink-colored urine (hematuria)"
                        "\n\u2756 Cloudy or foul-smelling urine"
                        "\n\u2756 Pain or burning when urinating",
                    isTop: true),
              ],
            ),
          ),
        )
      ],
    );
  }
}

_sweepGradient(double rangeValue) {
  if (rangeValue < 0) {
    return const SweepGradient(
      colors: [Colors.black],
    );
  } else if (rangeValue <= 33) {
    return const SweepGradient(
      colors: [Colors.green],
      // stops: [0]
    );
  } else if (rangeValue <= 66) {
    return const SweepGradient(
      colors: [Colors.green, Colors.yellow],
      stops: [0.00, 0.25],
    );
  } else if (rangeValue <= 100) {
    return const SweepGradient(
      colors: [Colors.green, Colors.yellow, Colors.red],
      stops: [0.25, 0.50, 0.75],
    );
  }
}

_linearGradient(double rangeValue) {
  if (rangeValue < 0) {
    return const LinearGradient(
      colors: [Colors.black],
    );
  } else if (rangeValue <= 33) {
    return const LinearGradient(
      colors: [Colors.green],
    );
  } else if (rangeValue <= 66) {
    return const LinearGradient(
      colors: [Colors.yellow, Colors.yellow],
      stops: [0.00, 0.25],
    );
  } else if (rangeValue <= 100) {
    return const LinearGradient(
      colors: [Colors.red, Colors.red, Colors.red],
      stops: [0.25, 0.50, 0.75],
    );
  }
}

// Color(0xFFFF0000)
