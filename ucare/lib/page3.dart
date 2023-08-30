import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:ucare/Components/custom_card_text.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  final double rangeValue = 0;

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
                  // gradient: _sweepGradient(rangeValue)
                ),
                RangePointer(
                  value: rangeValue,
                  width: 45,
                  cornerStyle: CornerStyle.bothFlat,
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
                    headingValue: "Probelms",
                    textValue: "\n- A new persistent urge to urinate"
                        "\n- Bloody or pink-colored urine (hematuria)"
                        "\n- Cloudy or foul-smelling urine"
                        "\n- Pain or burning when urinating"),
                CustomCardText(
                    headingValue: "Recommendations",
                    textValue: "\n- Contact your doctor soon after symptoms"
                        "\n- Take antibiotics to treat urinary tract infections"
                        "\n- Drink water to prevent dehydration")
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
      colors: [Colors.red],
      // stops: [0]
    );
  } else if (rangeValue <= 66) {
    return const SweepGradient(
      colors: [Colors.red, Colors.yellow],
      stops: [0.00, 0.25],
    );
  } else if (rangeValue <= 100) {
    return const SweepGradient(
      colors: [Colors.red, Colors.yellow, Colors.green],
      stops: [0.25, 0.50, 0.75],
    );
  }
}

// Color(0xFFFF0000)
