import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:test_project_one/app/modules/stats/controllers/stats_controller.dart';
import 'package:test_project_one/app/widgets/header.dart';

class StatsView extends GetView<StatsController> {
  final _value = 1.obs;
  List<_SalesData> data = [
    _SalesData(year: "Jan", sales: 23),
    _SalesData(year: "Feb", sales: 30),
    _SalesData(year: "Mar", sales: 50),
    _SalesData(year: "Apr", sales: 50),
    _SalesData(year: "May", sales: 23),
    _SalesData(year: "Jun", sales: 50),
    _SalesData(year: "Jul", sales: 70),
    _SalesData(year: "Aug", sales: 50),
    _SalesData(year: "Sep", sales: 50),
    _SalesData(year: "Oct", sales: 50),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tier 1x",
                    style: TextStyle(
                        fontFamily: "Gilroy",
                        fontSize: 20,
                        color: Color(0xff010101)),
                  ),
                ),
                Spacer(),
                Obx(() => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                        value: _value.value,
                        onChanged: (val) {
                          _value.value = val;
                        },
                        items: [
                          DropdownMenuItem(
                            child: Text("2020"),
                            value: 1,
                            onTap: () {},
                          ),
                          DropdownMenuItem(
                            child: Text("2019"),
                            value: 2,
                            onTap: () {
                              _value.value = 2;
                            },
                          )
                        ],
                      ),
                    ))
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 280,
                  
                  decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      // backgroundBlendMode: BlendMode.dstATop,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2,
                            offset: Offset(0, 2),
                            color: Color(0xff939393))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 250,
                        width: 384,
                        child:
                            
                            BezierChart(
                              
                          bezierChartScale: BezierChartScale.CUSTOM,
                          xAxisCustomValues: const [0, 3, 10, 15, 20, 25, 30, 35],
                          series: const [
                            BezierLine(
                              label: "Custom 1",
                               lineColor: Color(0xff4099FF),
                              lineStrokeWidth: 2.0,
                              data: const [
                                DataPoint<double>(value: 10, xAxis: 0),
                                DataPoint<double>(value: 130, xAxis: 5),
                                DataPoint<double>(value: 50, xAxis: 10),
                                DataPoint<double>(value: 150, xAxis: 15),
                                DataPoint<double>(value: 75, xAxis: 20),
                                DataPoint<double>(value: 0, xAxis: 25),
                                DataPoint<double>(value: 5, xAxis: 30),
                                DataPoint<double>(value: 45, xAxis: 35),
                              ],
                            ),
                            BezierLine(
                              lineColor: Color(0xffFAAB3F),
                              lineStrokeWidth: 2.0,
                              label: "Custom 2",
                              data: const [
                                DataPoint<double>(value: 5, xAxis: 0),
                                DataPoint<double>(value: 50, xAxis: 5),
                                DataPoint<double>(value: 30, xAxis: 10),
                                DataPoint<double>(value: 30, xAxis: 15),
                                DataPoint<double>(value: 50, xAxis: 20),
                                DataPoint<double>(value: 40, xAxis: 25),
                                DataPoint<double>(value: 10, xAxis: 30),
                                DataPoint<double>(value: 30, xAxis: 35),
                              ],
                            ),
                            BezierLine(
                              lineColor: Color(0xffFF0000),
                              lineStrokeWidth: 2.0,
                              label: "Custom 3",
                              data: const [
                                DataPoint<double>(value: 5, xAxis: 0),
                                DataPoint<double>(value: 10, xAxis: 5),
                                DataPoint<double>(value: 35, xAxis: 10),
                                DataPoint<double>(value: 40, xAxis: 15),
                                DataPoint<double>(value: 40, xAxis: 20),
                                DataPoint<double>(value: 40, xAxis: 25),
                                DataPoint<double>(value: 9, xAxis: 30),
                                DataPoint<double>(value: 11, xAxis: 35),
                              ],
                            ),
                          ],
                          config: BezierChartConfig(
                            
                            updatePositionOnTap: true,
                            displayYAxis: true,
                            xAxisTextStyle: TextStyle(
                                fontFamily: "Gilroy",
                                fontSize: 10,
                                color: Colors.white),
                                yAxisTextStyle:TextStyle(
                                fontFamily: "Gilroy",
                                fontSize: 10,
                                color: Color(0xff282828)),
                            showDataPoints: true,
                            verticalIndicatorStrokeWidth: 2.0,
                            verticalIndicatorColor: Colors.yellow,
                            showVerticalIndicator: true,
                            contentWidth: MediaQuery.of(context).size.width * 2,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                      Center(child: 
                      SvgPicture.asset("assets/svg/stat.svg"),)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                    height: 280,
                    
                    decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        // backgroundBlendMode: BlendMode.dstATop,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              offset: Offset(0, 2),
                              color: Color(0xff939393))
                        ]),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Table(
                            defaultColumnWidth: FlexColumnWidth(20),
                           
                            children: [
                            TableRow(
                              decoration: BoxDecoration(),
                              children: [
                              Text("Periods", style: TextStyle(fontFamily: "Gilroy", 
                              fontSize: 13, color: Color(0xff575757)),),
                               Text("Available Ads", style: TextStyle(fontFamily: "Gilroy", 
                              fontSize: 13, color: Color(0xff575757)),), 
                              Text("Completed Ads", style: TextStyle(fontFamily: "Gilroy", 
                              fontSize: 13, color: Color(0xff575757)),), 
                              Text("Avg. Comp", style: TextStyle(fontFamily: "Gilroy", 
                              fontSize: 13, color: Color(0xff575757)),),
                            ]),
                           
                            TableRow(children: [
                              Text("Jan", style: TextStyle(fontFamily: "Gilroy", 
                              fontSize: 13, color: Color(0xff575757)),),
                               Text("22", style: TextStyle(fontFamily: "Gilroy-Medium", 
                              fontSize: 10, color: Color(0xff282828)),),  
                              Text("22", style: TextStyle(fontFamily: "Gilroy-Medium", 
                              fontSize: 10, color: Color(0xff282828)),),  
                              Text("22", style: TextStyle(fontFamily: "Gilroy-Medium", 
                              fontSize: 10, color: Color(0xff282828)),), 
                              
                            ]),TableRow(children: [
                              Text("Feb", style: TextStyle(fontFamily: "Gilroy", 
                              fontSize: 13, color: Color(0xff575757)),),
                               Text("22", style: TextStyle(fontFamily: "Gilroy-Medium", 
                              fontSize: 10, color: Color(0xff282828)),),  
                              Text("22", style: TextStyle(fontFamily: "Gilroy-Medium", 
                              fontSize: 10, color: Color(0xff282828)),),  
                              Text("22", style: TextStyle(fontFamily: "Gilroy-Medium", 
                              fontSize: 10, color: Color(0xff282828)),), 
                              
                            ]),TableRow(children: [
                              Text("Mar", style: TextStyle(fontFamily: "Gilroy", 
                              fontSize: 13, color: Color(0xff575757)),),
                               Text("22", style: TextStyle(fontFamily: "Gilroy-Medium", 
                              fontSize: 10, color: Color(0xff282828)),),  
                              Text("22", style: TextStyle(fontFamily: "Gilroy-Medium", 
                              fontSize: 10, color: Color(0xff282828)),),  
                              Text("22", style: TextStyle(fontFamily: "Gilroy-Medium", 
                              fontSize: 10, color: Color(0xff282828)),), 
                              
                            ]),TableRow(children: [
                              Text("Apr", style: TextStyle(fontFamily: "Gilroy", 
                              fontSize: 13, color: Color(0xff575757)),),
                               Text("22", style: TextStyle(fontFamily: "Gilroy-Medium", 
                              fontSize: 10, color: Color(0xff282828)),),  
                              Text("22", style: TextStyle(fontFamily: "Gilroy-Medium", 
                              fontSize: 10, color: Color(0xff282828)),),  
                              Text("22", style: TextStyle(fontFamily: "Gilroy-Medium", 
                              fontSize: 10, color: Color(0xff282828)),), 
                              
                            ]),TableRow(children: [
                              Text("May", style: TextStyle(fontFamily: "Gilroy", 
                              fontSize: 13, color: Color(0xff575757)),),
                               Text("22", style: TextStyle(fontFamily: "Gilroy-Medium", 
                              fontSize: 10, color: Color(0xff282828)),),  
                              Text("22", style: TextStyle(fontFamily: "Gilroy-Medium", 
                              fontSize: 10, color: Color(0xff282828)),),  
                              Text("22", style: TextStyle(fontFamily: "Gilroy-Medium", 
                              fontSize: 10, color: Color(0xff282828)),), 
                              
                            ]),
                          ],),
                        ),
                        ),
            )
          ],
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData({this.year, this.sales});
  final String year;
  final int sales;
}
