import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Charts(),
    );
  }
}

class Charts extends StatefulWidget {
  const Charts({Key key}) : super(key: key);

  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  List<SalesData> _chartData;
  List<GDPData> _gdpData;

  @override
  void initState() {
    _chartData = getChartData();
    _gdpData = getGDPData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 450,
              width: 360,
              child: SfCartesianChart(
                title: ChartTitle(text: 'Yearly sales analysis'),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries>[
                  LineSeries<SalesData, double>(
                      name: "Vendas",
                      dataSource: _chartData,
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                      enableTooltip: true)
                ],
                primaryXAxis:
                    NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                primaryYAxis: NumericAxis(
                    labelFormat: '{value}M',
                    numberFormat:
                        NumberFormat.simpleCurrency(decimalDigits: 0)),
              ),
            ),
            Container(
              height: 350,
              width: 360,
              child: SfCircularChart(
                  title: ChartTitle(text: "Continent Wise GDP"),
                  legend: Legend(
                      isVisible: true,
                      overflowMode: LegendItemOverflowMode.wrap),
                  series: <CircularSeries>[
                    PieSeries<GDPData, String>(
                        dataSource: _gdpData,
                        xValueMapper: (GDPData data, _) => data.continent,
                        yValueMapper: (GDPData data, _) => data.gdp,
                        dataLabelSettings: DataLabelSettings(isVisible: true))
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

List<GDPData> getGDPData() {
  final List<GDPData> gdpData = [
    GDPData('Oceania', 1600),
    GDPData('Africa', 2490),
    GDPData('South America', 2900),
    GDPData('Europe', 23050),
    GDPData('North America', 24880),
    GDPData('Asia', 34390),
  ];
  return gdpData;
}

class GDPData {
  GDPData(this.continent, this.gdp);

  final String continent;
  final int gdp;
}

List<SalesData> getChartData() {
  final List<SalesData> chartData = [
    SalesData(2017, 25),
    SalesData(2018, 12),
    SalesData(2019, 24),
    SalesData(2020, 18),
    SalesData(2021, 30),
  ];
  return chartData;
}

class SalesData {
  final double year;
  final double sales;

  SalesData(this.year, this.sales);
}
