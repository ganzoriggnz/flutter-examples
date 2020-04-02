import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import '../../../../model/helper.dart';
import '../../../../model/model.dart';

//ignore: must_be_immutable
class BubbleMultiSeries extends StatefulWidget {
  BubbleMultiSeries({this.sample, Key key}) : super(key: key);
  SubItem sample;

  @override
  _BubbleMultiSeriesState createState() => _BubbleMultiSeriesState(sample);
}

class _BubbleMultiSeriesState extends State<BubbleMultiSeries> {
  _BubbleMultiSeriesState(this.sample);
  final SubItem sample;

  @override
  Widget build(BuildContext context) {
    return getScopedModel(getMultipleSeriesBubbleChart(false), sample);
  }
}

SfCartesianChart getMultipleSeriesBubbleChart(bool isTileView) {
  return SfCartesianChart(
    
    plotAreaBorderWidth: 0,
    title: ChartTitle(text: isTileView ? '' : 'World countries details'),
    primaryXAxis: NumericAxis(
        majorGridLines: MajorGridLines(width: 0),
        title: AxisTitle(text: isTileView ? '' : 'Literacy rate'),
        minimum: 60,
        maximum: 100),
    primaryYAxis: NumericAxis(
        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(width: 0),
        title: AxisTitle(text: isTileView ? '' : 'GDP growth rate')),
    series: getMultipleBubbleSeries(isTileView),
    legend: Legend(
        isVisible: isTileView ? false : true,
        overflowMode: LegendItemOverflowMode.wrap),
    tooltipBehavior: TooltipBehavior(
        textAlignment: ChartAlignment.near,
        enable: true,
        header: '',
        canShowMarker: false,
        format:
            'Literacy rate : point.x%\nGDP growth rate : point.y\nPopulation : point.sizeB'),
  );
}

List<BubbleSeries<ChartSampleData, num>> getMultipleBubbleSeries(
    bool isTileView) {
  final List<ChartSampleData> asia = <ChartSampleData>[
    ChartSampleData(x: 'China', xValue: 92.2, y: 7.8, size: 1.347),
    ChartSampleData(x: 'India', xValue: 74, y: 6.5, size: 1.241),
    ChartSampleData(x: 'Indonesia', xValue: 90.4, y: 6.0, size: 0.238),
    ChartSampleData(x: 'Japan', xValue: 99, y: 0.2, size: 0.128),
    ChartSampleData(x: 'Philippines', xValue: 92.6, y: 6.6, size: 0.096),
    ChartSampleData(x: 'Hong Kong', xValue: 82.2, y: 3.97, size: 0.7),
    ChartSampleData(x: 'Jordan', xValue: 72.5, y: 4.5, size: 0.7),
    ChartSampleData(x: 'Australia', xValue: 81, y: 3.5, size: 0.21),
    ChartSampleData(x: 'Mongolia', xValue: 66.8, y: 3.9, size: 0.028),
    ChartSampleData(x: 'Taiwan', xValue: 78.4, y: 2.9, size: 0.231),
  ];
  final List<ChartSampleData> africa = <ChartSampleData>[
    ChartSampleData(x: 'Egypt', xValue: 72, y: 2.0, size: 0.0826),
    ChartSampleData(x: 'Nigeria', xValue: 61.3, y: 1.45, size: 0.162),
  ];
  final List<ChartSampleData> northAmerica = <ChartSampleData>[
    ChartSampleData(x: 'US', xValue: 99.4, y: 2.2, size: 0.312),
    ChartSampleData(x: 'Mexico', xValue: 86.1, y: 4.0, size: 0.115)
  ];
  final List<ChartSampleData> europe = <ChartSampleData>[
    ChartSampleData(x: 'Germany', xValue: 99, y: 0.7, size: 0.0818),
    ChartSampleData(x: 'Russia', xValue: 99.6, y: 3.4, size: 0.143),
    ChartSampleData(x: 'Netherland', xValue: 79.2, y: 3.9, size: 0.162)
  ];
  return <BubbleSeries<ChartSampleData, num>>[
    BubbleSeries<ChartSampleData, num>(
        opacity: 0.7,
        enableTooltip: true,
        name: 'North America',
        dataSource: northAmerica,
        xValueMapper: (ChartSampleData sales, _) => sales.xValue,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        sizeValueMapper: (ChartSampleData sales, _) => sales.size),
    BubbleSeries<ChartSampleData, num>(
        opacity: 0.7,
        enableTooltip: true,
        name: 'Europe',
        dataSource: europe,
        xValueMapper: (ChartSampleData sales, _) => sales.xValue,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        sizeValueMapper: (ChartSampleData sales, _) => sales.size),
    BubbleSeries<ChartSampleData, num>(
        opacity: 0.7,
        enableTooltip: true,
        dataSource: asia,
        name: 'Asia',
        xValueMapper: (ChartSampleData sales, _) => sales.xValue,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        sizeValueMapper: (ChartSampleData sales, _) => sales.size),
    BubbleSeries<ChartSampleData, num>(
        opacity: 0.7,
        enableTooltip: true,
        name: 'Africa',
        dataSource: africa,
        xValueMapper: (ChartSampleData sales, _) => sales.xValue,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        sizeValueMapper: (ChartSampleData sales, _) => sales.size),
  ];
}
