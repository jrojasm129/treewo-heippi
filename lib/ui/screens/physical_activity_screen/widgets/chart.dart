import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


import '../../../../constants.dart';
import '../../../../providers/providers.dart';


class Chart extends StatelessWidget {
  final bool showWalkingChart;
  final double width;
  final double height;

  const Chart({
    Key? key,
    required this.showWalkingChart, 
    this.width = double.infinity, 
    this.height = double.infinity,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final movemenDetails = Provider.of<MovementProvider>(context).movementDetails	;

    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        child: charts.BarChart(
          movemenDetails.getChartSeriesData(
            movingType: showWalkingChart ? MovingType.walking : MovingType.cycling,
            color: showWalkingChart ? kSecundaryColor: kPrimaryColor
          ),
          defaultInteractions: true,
          animate: true,
          domainAxis: const charts.OrdinalAxisSpec(
              renderSpec:
                  charts.SmallTickRendererSpec(labelRotation: 55)),
        ),
      ),
    );
  }
}
