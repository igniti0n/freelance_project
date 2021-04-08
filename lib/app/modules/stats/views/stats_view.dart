import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:test_project_one/app/data/models/statsDataModel.dart';
import 'package:test_project_one/app/modules/stats/controllers/stats_controller.dart';
import 'package:intl/intl.dart';
import 'package:test_project_one/app/widgets/error_page.dart';
import 'package:test_project_one/app/widgets/header.dart';
import 'package:test_project_one/app/widgets/progress_dialog.dart';

class StatsView extends GetView<StatsController> {
  final controller = Get.put(StatsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: userHeader,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                children: [
                  Text(
                    "Tier 1x",
                    style: TextStyle(
                        fontFamily: "Gilroy",
                        fontSize: 20,
                        color: Color(0xff010101)),
                  ),
                  Spacer(),
                  Obx(() => DropdownButton(
                        value: controller.selectedYear.value,
                        onChanged: (val) {
                          controller.setYear(value: val);
                        },
                        items: [
                          DropdownMenuItem(
                            child: Text("2021"),
                            value: 2021,
                          ),
                          DropdownMenuItem(
                            child: Text("2022"),
                            value: 2022,
                          ),
                          DropdownMenuItem(
                            child: Text("2023"),
                            value: 2023,
                          )
                        ],
                      ))
                ],
              ),
            ),
            controller.obx(
              (data) {
                return Column(
                  children: [
                    _buildChart(context, data: data),
                    _buildChartTable(data: data)
                  ],
                );
              },
              onLoading: Container(
                height: Get.height * 0.6,
                child: Loader(),
              ),
              onError: (error) {
                return ErrorView(
                  errorMsg: error,
                  onTapReload: () {
                    controller.getStatsData();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _buildChartTable({StatsDetailDataModel data}) {
    var _rowLists = List<TableRow>();
    _rowLists.add(
      TableRow(
        children: [
          Text("Periods",
              style: TextStyle(
                  fontFamily: "Gilroy",
                  fontSize: 13,
                  color: Color(0xff575757))),
          Text("Available Gids",
              style: TextStyle(
                  fontFamily: "Gilroy",
                  fontSize: 13,
                  color: Color(0xff575757))),
          Text("Completed Gids",
              style: TextStyle(
                  fontFamily: "Gilroy",
                  fontSize: 13,
                  color: Color(0xff575757))),
          Text("Avg. Comp",
              style: TextStyle(
                  fontFamily: "Gilroy",
                  fontSize: 13,
                  color: Color(0xff575757))),
        ],
      ),
    );
    _rowLists.add(
      TableRow(children: [
        SizedBox(height: 15),
        SizedBox(height: 15),
        SizedBox(height: 15),
        SizedBox(height: 15),
      ]),
    );
    for (var month = 1; month < 13; month++) {
      final DateTime date = DateTime(controller.selectedYear.value, month, 1);
      final DateFormat formatter = DateFormat('LLL');
      final String formattedMonth = formatter.format(date);
      Stat stat = data.stats[formattedMonth];
      _rowLists.add(
        TableRow(children: [
          Text(
            formattedMonth,
            style: TextStyle(
                fontFamily: "Gilroy", fontSize: 13, color: Color(0xff575757)),
          ),
          Text(
            stat.availableAds.toString(),
            style: TextStyle(
                fontFamily: "Gilroy-Medium",
                fontSize: 10,
                color: Color(0xff282828)),
          ),
          Text(
            stat.completedAds.toString(),
            style: TextStyle(
                fontFamily: "Gilroy-Medium",
                fontSize: 10,
                color: Color(0xff282828)),
          ),
          Text(
            stat.avgComp.toString(),
            style: TextStyle(
                fontFamily: "Gilroy-Medium",
                fontSize: 10,
                color: Color(0xff282828)),
          ),
        ]),
      );
      _rowLists.add(
        TableRow(children: [
          SizedBox(height: 15),
          SizedBox(height: 15),
          SizedBox(height: 15),
          SizedBox(height: 15),
        ]),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  blurRadius: 2, offset: Offset(0, 2), color: Color(0xff939393))
            ]),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Table(
            defaultColumnWidth: FixedColumnWidth(Get.width * 0.8 / 4),
            children: _rowLists,
          ),
        ),
      ),
    );
  }

  _buildChart(BuildContext context, {StatsDetailDataModel data}) {
    var statsData = List<Stat>();
    var dates = List<DateTime>();
    for (var month = 1; month < 13; month++) {
      final DateTime date = DateTime(controller.selectedYear.value, month, 1);
      final DateFormat formatter = DateFormat('LLL');
      final String formattedMonth = formatter.format(date);
      statsData.add(data.stats[formattedMonth]);
      dates.add(date);
    }
    var listAvailableAds = statsData.map((e) => e.availableAds).toList();
    var listCompletedAds = statsData.map((e) => e.completedAds).toList();
    var listAvgCompAds = statsData.map((e) => e.avgComp).toList();
    var isMoreData = (listAvailableAds + listCompletedAds + listAvgCompAds)
        .map((e) => e >= 10)
        .contains(true);

    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            10,
          ),
          border: Border.all(
            color: Colors.blue,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 2, offset: Offset(0, 2), color: Color(0xff939393))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            child: BezierChart(
              bezierChartScale: BezierChartScale.MONTHLY,
              fromDate: DateTime(controller.selectedYear.value, 1, 1),
              toDate: DateTime(controller.selectedYear.value, 12, 31),
              footerDateTimeBuilder: (value, scaleType) {
                final DateTime now = value;
                DateFormat formatter = DateFormat('LLL');
                final String formatted = formatter.format(now);
                return formatted;
              },
              series: [
                BezierLine(
                  label: "Available Gids",
                  lineColor: Color(0xfffaab3f),
                  lineStrokeWidth: 2.0,
                  data: List.generate(dates.length, (index) {
                    return DataPoint<DateTime>(
                        value: statsData[index].availableAds.toDouble(),
                        xAxis: dates[index]);
                  }),
                ),
                BezierLine(
                  label: "Completed Gids",
                  lineColor: Colors.green,
                  lineStrokeWidth: 2.0,
                  data: List.generate(dates.length, (index) {
                    return DataPoint<DateTime>(
                        value: statsData[index].completedAds.toDouble(),
                        xAxis: dates[index]);
                  }),
                ),
                BezierLine(
                  label: "Avg Completed Gids",
                  lineColor: Color(0xff4099FF),
                  lineStrokeWidth: 2.0,
                  data: List.generate(dates.length, (index) {
                    return DataPoint<DateTime>(
                        value: statsData[index].avgComp.toDouble(),
                        xAxis: dates[index]);
                  }),
                ),
              ],
              config: BezierChartConfig(
                updatePositionOnTap: true,
                displayYAxis: true,
                stepsYAxis: isMoreData ? 5 : 1,
                startYAxisFromNonZeroValue: false,
                xAxisTextStyle: TextStyle(
                    fontFamily: "Gilroy", fontSize: 10, color: Colors.black),
                yAxisTextStyle: TextStyle(
                    fontFamily: "Gilroy", fontSize: 10, color: Colors.black),
                showDataPoints: false,
                verticalIndicatorStrokeWidth: 2.0,
                verticalIndicatorColor: Colors.yellow,
                showVerticalIndicator: true,
                verticalIndicatorFixedPosition: false,
                contentWidth: MediaQuery.of(context).size.width * 2,
                backgroundColor: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Center(
            child: SvgPicture.asset("assets/svg/stat.svg"),
          )
        ],
      ),
    );
  }
}
