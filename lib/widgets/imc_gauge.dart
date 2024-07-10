import 'package:flutter/material.dart';
import 'package:mobx_imc/widgets/imc_gauge_range.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcGauge extends StatelessWidget {
  final double imc;

  const ImcGauge({super.key, required this.imc});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          showLabels: false,
          showAxisLine: false,
          showTicks: false,
          minimum: 12.5,
          maximum: 47.9,
          ranges: [
            ImcGaugeRange(
              color: Colors.blue,
              start: 12.5,
              end: 18.5,
              label: 'MAGREZA',
            ),
            ImcGaugeRange(
              color: Colors.green,
              start: 18.5,
              end: 24.5,
              label: 'NORMAL',
            ),
            ImcGaugeRange(
              color: Colors.yellow,
              start: 24.5,
              end: 29.9,
              label: 'SOBREPESO',
            ),
            ImcGaugeRange(
              color: Color.fromARGB(255, 229, 41, 27),
              start: 29.9,
              end: 39.9,
              label: 'OBESIDADE',
            ),
            ImcGaugeRange(
              color: const Color.fromARGB(255, 153, 14, 4),
              start: 39.9,
              end: 47.9,
              label: 'OBESIDADE GRAVE',
            ),
          ],
          pointers: [
            NeedlePointer(
              value: imc,
              enableAnimation: true,
            )
          ],
        )
      ],
    );
  }
}
