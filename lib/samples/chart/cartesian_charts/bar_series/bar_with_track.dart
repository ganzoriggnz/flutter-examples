/// Package import
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local imports
import '../../../../model/model.dart';
import '../../../../model/sample_view.dart';

/// Renders the tracker bar chart sample.
class BarTracker extends SampleView {
  const BarTracker(Key key) : super(key: key);

  @override
  _BarTrackerState createState() => _BarTrackerState();
}

/// State class of tracker bar chart.
class _BarTrackerState extends SampleViewState {
  _BarTrackerState();

  @override
  Widget build(BuildContext context) {
    return getTrackerBarChart();
  }

  /// Returns the bar chart with trackers.
  SfCartesianChart getTrackerBarChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: isCardView ? '' : 'Working hours of employees'),
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          majorGridLines: MajorGridLines(width: 0),
          title: AxisTitle(text: isCardView ? '' : 'Hours'),
          minimum: 0,
          maximum: 8,
          majorTickLines: MajorTickLines(size: 0)),
      series: getTrackerBarSeries(),
      tooltipBehavior:
          TooltipBehavior(enable: true, header: '', canShowMarker: false),
    );
  }

  /// Returns the lsit of chart series which need to render on the bar chart with trackers.
  List<BarSeries<ChartSampleData, String>> getTrackerBarSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(x: 'Mike', y: 7.5),
      ChartSampleData(x: 'Chris', y: 7),
      ChartSampleData(x: 'Helana', y: 6),
      ChartSampleData(x: 'Tom', y: 5),
      ChartSampleData(x: 'Federer', y: 7),
      ChartSampleData(x: 'Hussain', y: 7),
    ];
    return <BarSeries<ChartSampleData, String>>[
      BarSeries<ChartSampleData, String>(
        dataSource: chartData,
        borderRadius: BorderRadius.circular(15),
        trackColor: const Color.fromRGBO(198, 201, 207, 1),
        /// If we enable this property as true, then we can show the track of series.
        isTrackVisible: true,
        dataLabelSettings: DataLabelSettings(
            isVisible: true, labelAlignment: ChartDataLabelAlignment.top),
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
      ),
    ];
  }
}