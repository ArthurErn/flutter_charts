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
      debugShowCheckedModeBanner: false,
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
  List<SalesData> _chartData2;
  List<GDPData> _gdpData;

  @override
  void initState() {
    _chartData = getChartData();
    _gdpData = getGDPData();
    _chartData2 = getChartData2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        toolbarHeight: 50,
        shadowColor: Colors.transparent,
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        title: const Text("Gráficos",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.white),
              height: 750,
              width: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7),
                        ],
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(12)),
                    height: 390,
                    width: 450,
                    child: SfCartesianChart(
                      title: ChartTitle(
                          text: 'Vendas Anuais',
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries>[
                        BubbleSeries<SalesData, double>(
                            name: "Vendas",
                            dataSource: _chartData,
                            xValueMapper: (SalesData sales, _) => sales.year,
                            yValueMapper: (SalesData sales, _) => sales.sales,
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: false),
                            enableTooltip: true),
                        BubbleSeries<SalesData, double>(
                            name: "Vendas",
                            dataSource: _chartData2,
                            xValueMapper: (SalesData sales, _) => sales.year,
                            yValueMapper: (SalesData sales, _) => sales.sales,
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: false),
                            enableTooltip: true)
                      ],
                      primaryXAxis: NumericAxis(
                          edgeLabelPlacement: EdgeLabelPlacement.shift),
                      primaryYAxis: NumericAxis(
                          labelFormat: '{value}M',
                          numberFormat: NumberFormat.simpleCurrency(
                              decimalDigits: 0, locale: "pt_BR", name: 'R\$')),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                          ),
                        ],
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(12)),
                    height: 280,
                    width: 450,
                    child: SfCircularChart(
                        title: ChartTitle(
                            text: "Produto Interno Bruto",
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        legend: Legend(
                            isVisible: true,
                            overflowMode: LegendItemOverflowMode.wrap),
                        series: <DoughnutSeries>[
                          DoughnutSeries<GDPData, String>(
                              dataSource: _gdpData,
                              xValueMapper: (GDPData data, _) => data.continent,
                              yValueMapper: (GDPData data, _) => data.gdp,
                              dataLabelSettings:
                                  const DataLabelSettings(isVisible: true))
                        ]),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          )
        ],
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
    SalesData(2018, 20),
    SalesData(2019, 24),
    SalesData(2020, 18),
    SalesData(2021, 30),
    SalesData(2022, 24),
    SalesData(2023, 33),
    SalesData(2024, 27),
    SalesData(2025, 19),
    SalesData(2026, 35),
    SalesData(2027, 22),
    SalesData(2028, 28),
    SalesData(2029, 30),
    SalesData(2030, 18),
    SalesData(2031, 40),
  ];
  return chartData;
}

List<SalesData> getChartData2() {
  final List<SalesData> chartData = [
    SalesData(2017, 13),
    SalesData(2018, 9),
    SalesData(2019, 5),
    SalesData(2020, 12),
    SalesData(2021, 11),
    SalesData(2022, 16),
    SalesData(2023, 5),
    SalesData(2024, 15),
    SalesData(2025, 12),
    SalesData(2026, 4),
    SalesData(2027, 7),
    SalesData(2028, 11),
    SalesData(2029, 13),
    SalesData(2030, 7),
    SalesData(2031, 8),
  ];
  return chartData;
}

class SalesData {
  final double year;
  final double sales;

  SalesData(this.year, this.sales);
}
