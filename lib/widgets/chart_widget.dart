/*import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return LineChart(sampleData);
  }
}

LineChartData get sampleData => LineChartData(
  gridData: gridData,
  titlesData: titlesData,
  borderData: borderData,
  lineBarsData: lineBarsData,
  minX: 0,
  minY: 0,
  maxX: 31,
  maxY: 5,
);

List<LineChartBarData> lineBarsData = [
  lineChartBarData1,
  lineChartBarData2,
  lineChartBarData3,
];

FlTitlesData get titlesData => FlTitlesData(
  bottomTitles: AxisTitles(sideTitles: bottomTitles()),
  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
  leftTitles: AxisTitles(sideTitles: leftTitles()),
);

Widget leftTitlesWidget(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  String text;
  switch (value.toInt()) {
    case 1:
      text = "500,000";
      break;
    case 2:
      text = "600,000";
      break;
    case 3:
      text = "700,000";
      break;
    case 4:
      text = "800,000";
      break;
    case 5:
      text = "900,000";
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.center);
}

SideTitles leftTitles() => SideTitles(
  getTitlesWidget: leftTitlesWidget,
  showTitles: true,
  interval: 1,
  reservedSize: 70,
);

Widget bottomTitleWidget(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  Widget text;

  switch (value.toInt()) {
    case 1:
      text = Text("1", style: style);
      break;
    case 2:
      text = Text("2", style: style);
      break;
    case 3:
      text = Text("3", style: style);
      break;
    case 4:
      text = Text("4", style: style);
      break;
    case 5:
      text = Text("5", style: style);
      break;
    case 6:
      text = Text("6", style: style);
      break;
    case 7:
      text = Text("7", style: style);
      break;
    case 8:
      text = Text("8", style: style);
      break;
    case 9:
      text = Text("9", style: style);
      break;
    case 10:
      text = Text("10", style: style);
      break;
    case 11:
      text = Text("11", style: style);
      break;
    case 12:
      text = Text("12", style: style);
      break;
    case 13:
      text = Text("13", style: style);
      break;
    case 14:
      text = Text("14", style: style);
      break;
    case 15:
      text = Text("15", style: style);
      break;
    case 16:
      text = Text("16", style: style);
      break;
    case 17:
      text = Text("17", style: style);
      break;
    case 18:
      text = Text("18", style: style);
      break;
    case 19:
      text = Text("19", style: style);
      break;
    case 20:
      text = Text("20", style: style);
      break;
    case 21:
      text = Text("21", style: style);
      break;
    case 22:
      text = Text("22", style: style);
      break;
    case 23:
      text = Text("23", style: style);
      break;
    case 24:
      text = Text("24", style: style);
      break;
    case 25:
      text = Text("25", style: style);
      break;
    case 26:
      text = Text("26", style: style);
      break;
    case 27:
      text = Text("27", style: style);
      break;
    case 28:
      text = Text("28", style: style);
      break;
    case 29:
      text = Text("29", style: style);
      break;
    case 30:
      text = Text("30", style: style);
      break;
    default:
      text = Text("");
      break;
  }

  return SideTitleWidget(space: 10, meta: meta, child: text);
}

SideTitles bottomTitles() => SideTitles(
  showTitles: true,
  reservedSize: 40,
  interval: 1,
  getTitlesWidget: bottomTitleWidget,
);

FlGridData get gridData => FlGridData(show: true,verticalInterval: 1);

FlBorderData get borderData => FlBorderData(
  show: true,
  border: Border(
    bottom: BorderSide(color: Colors.grey, width: 4),
    left: BorderSide(color: Colors.grey),
    right: BorderSide(color: Colors.transparent),
    top: BorderSide(color: Colors.transparent),
  ),
);

LineChartBarData get lineChartBarData1 => LineChartBarData(
  isCurved: true,
  color: Colors.blue,
  barWidth: 3,
  isStrokeCapRound: true,
  dotData: FlDotData(show: false),
  belowBarData: BarAreaData(show: false),
  spots: [
    FlSpot(1, 1),
    FlSpot(3, 1.5),
    FlSpot(5, 1.6),
    FlSpot(7, 3.4),
    FlSpot(10, 2),
    FlSpot(12, 2.5),
    FlSpot(13, 1.6),
  ],
);

LineChartBarData get lineChartBarData2 => LineChartBarData(
  isCurved: true,
  color: Colors.yellow,
  barWidth: 3,
  isStrokeCapRound: true,
  dotData: FlDotData(show: false),
  belowBarData: BarAreaData(show: false),
  spots: [
    FlSpot(1, 2),
    FlSpot(3, 1),
    FlSpot(5, 3),
    FlSpot(7, 3.4),
    FlSpot(10, 2.3),
    FlSpot(12, 2.9),
    FlSpot(13, 3),
  ],
);

LineChartBarData get lineChartBarData3 => LineChartBarData(
  isCurved: true,
  color: Colors.deepPurple,
  barWidth: 3,
  isStrokeCapRound: true,
  dotData: FlDotData(show: false),
  belowBarData: BarAreaData(show: false),
  spots: [
    FlSpot(1, 3.5),
    FlSpot(3, 1.2),
    FlSpot(5, .1),
    FlSpot(7, .9),
    FlSpot(10, 2),
    FlSpot(12, 2.5),
    FlSpot(13, 3),
  ],
);*/

import 'package:flutter/material.dart';
import 'package:surxan/data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        initialZoomPosition: 0,
        initialZoomFactor: 0.6,
      ),
      zoomPanBehavior: ZoomPanBehavior(
        enablePanning: true,
        enablePinching: true,
        zoomMode: ZoomMode.xy,
      ),
      series: <LineSeries<SalesData, String>>[
        LineSeries<SalesData, String>(
          dataSource: <SalesData>[
            SalesData('1', 35000),
            SalesData('2', 28000),
            SalesData('3', 34000),
            SalesData('4', 32000),
            SalesData('5', 40000),
            SalesData('6', 34000),
            SalesData('7', 38000),
            SalesData('8', 27000),
            SalesData('9', 45000),
            SalesData('10', 76000),
            SalesData('11', 44000),
            SalesData('12', 43000),
            SalesData('13', 34000),
            SalesData('14', 48000),
            SalesData('15', 75000),
            SalesData('16', 58000),
            SalesData('17', 48000),
            SalesData('18', 49000),
            SalesData('19', 49000),
            SalesData('20', 58000),
            SalesData('21', 92000),
            SalesData('22', 29000),
            SalesData('23', 104000),
            SalesData('24', 238000),
            SalesData('25', 98000),
            SalesData('26', 367000),
            SalesData('27', 478000),
            SalesData('28', 89000),
            SalesData('29', 36000),
            SalesData('30', 572000),
          ],
          xValueMapper: (SalesData sales, _) => sales.day,
          yValueMapper: (SalesData sales, _) => sales.sales,
          color: Colors.blue,
          width: 4,
        ),

         LineSeries<SalesData, String>(
          dataSource: <SalesData>[
            SalesData('1', 478000),
            SalesData('2', 47000),
            SalesData('3', 38000),
            SalesData('4', 29000),
            SalesData('5', 48000),
            SalesData('6', 238000),
            SalesData('7', 89000),
            SalesData('8', 84000),
            SalesData('9', 47000),
            SalesData('10', 83000),
            SalesData('11', 239000),
            SalesData('12', 84000),
            SalesData('13', 90000),
            SalesData('14', 39000),
            SalesData('15', 289000),
            SalesData('16', 356000),
            SalesData('17', 456000),
            SalesData('18', 54000),
            SalesData('19', 34000),
            SalesData('20', 34000),
            SalesData('21', 24000),
            SalesData('22', 45000),
            SalesData('23', 454000),
            SalesData('24', 338000),
            SalesData('25', 44300),
            SalesData('26', 36000),
            SalesData('27', 338000),
            SalesData('28', 34000),
            SalesData('29', 34000),
            SalesData('30', 342000),
          ],
          xValueMapper: (SalesData sales, _) => sales.day,
          yValueMapper: (SalesData sales, _) => sales.sales,
          color: Colors.yellow,
          width: 4,
        ),

         LineSeries<SalesData, String>(
          dataSource: <SalesData>[
            SalesData('1', 27000),
            SalesData('2', 384000),
            SalesData('3', 39240),
            SalesData('4', 23800),
            SalesData('5', 87400),
            SalesData('6', 294000),
            SalesData('7', 37000),
            SalesData('8', 34000),
            SalesData('9', 298000),
            SalesData('10', 23000),
            SalesData('11', 23000),
            SalesData('12', 83000),
            SalesData('13', 293000),
            SalesData('14', 42000),
            SalesData('15', 754000),
            SalesData('16', 584000),
            SalesData('17', 484000),
            SalesData('18', 494000),
            SalesData('19', 494000),
            SalesData('20', 584000),
            SalesData('21', 524000),
            SalesData('22', 294000),
            SalesData('23', 104000),
            SalesData('24', 438000),
            SalesData('25', 398000),
            SalesData('26', 367000),
            SalesData('27', 378000),
            SalesData('28', 239000),
            SalesData('29', 364000),
            SalesData('30', 474000),
          ],
          xValueMapper: (SalesData sales, _) => sales.day,
          yValueMapper: (SalesData sales, _) => sales.sales,
          color: Colors.deepPurple,
          width: 4,
        ),
      ],
    );
  }
}

class SalesData {
  SalesData(this.day, this.sales);
  final String day;
  final double sales;
}
