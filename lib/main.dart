import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Flutter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<ChartData> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
              child: Container(
                width: 200,
                height: 80,
                child: SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  series: <CartesianSeries>[
                    SplineAreaSeries<ChartData, double>(
                        name: "",
                        dataSource: _chartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        enableTooltip: true,
                        borderWidth: 7,
                        borderColor: Color(0xffDC3148),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end:  Alignment.bottomCenter,
                          colors: [
                            Color(0xffDC3148),
                            Colors.white
                          ],)
                )],
                  primaryXAxis: NumericAxis(
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                      interval: 1,
                      majorGridLines: MajorGridLines(width: 0),
                    isVisible: false,
                    axisLine: AxisLine(width: 0)
                  ),
                  primaryYAxis: NumericAxis(
                    interval: 1,
                    majorGridLines: MajorGridLines(width: 0),
                    isVisible: false
                  ),
                ),
              ),
            )));
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final double x;
  final double y;
}

List<ChartData> getChartData() {
  final List<ChartData> chartData = [
    ChartData(1,0),
    ChartData(2,2),
    ChartData(3,0.5),
    ChartData(4,3),
    ChartData(5,1),
    ChartData(6,3),
    ChartData(7,2),
    ChartData(8,0),
  ];
  return chartData;
}

