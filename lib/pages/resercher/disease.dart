import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class disease extends StatefulWidget {
  const disease({super.key});

  @override
  State<disease> createState() => _diseaseState();
}

class _diseaseState extends State<disease> {
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    // final barGroup5 = makeGroupData(4, 17, 6);
    // final barGroup6 = makeGroupData(5, 19, 1.5);
    // final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      // barGroup5,
      // barGroup6,
      // barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                makeTransactionsIcon(),
                const SizedBox(
                  width: 38,
                ),
                const Text(
                  'disease',
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  'in sulaymaniyah',
                  style: TextStyle(color: Color(0xff77839a), fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 38,
            ),
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: 20,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.grey,
                      getTooltipItem: (a, b, c, d) => null,
                    ),
                    touchCallback: (FlTouchEvent event, response) {
                      if (response == null || response.spot == null) {
                        setState(() {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                        });
                        return;
                      }

                      touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                      setState(() {
                        if (!event.isInterestedForInteractions) {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                          return;
                        }
                        showingBarGroups = List.of(rawBarGroups);
                        if (touchedGroupIndex != -1) {
                          var sum = 0.0;
                          for (final rod
                          in showingBarGroups[touchedGroupIndex].barRods) {
                            sum += rod.toY;
                          }
                          final avg = sum /
                              showingBarGroups[touchedGroupIndex]
                                  .barRods
                                  .length;

                          showingBarGroups[touchedGroupIndex] =
                              showingBarGroups[touchedGroupIndex].copyWith(
                                barRods: showingBarGroups[touchedGroupIndex]
                                    .barRods
                                    .map((rod) {
                                  return rod.copyWith(
                                      toY: avg, color: Colors.lightBlue);
                                }).toList(),
                              );
                        }
                      });
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitles,
                        reservedSize: 42,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        interval: 1,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: showingBarGroups,
                  gridData: const FlGridData(show: false),
                ),
              ),
            ),
            Divider(),
            const SizedBox(
              height: 20,
            ),
            // Expanded(
            //   child: BarChart(
            //     BarChartData(
            //       maxY: 20,
            //       barTouchData: BarTouchData(
            //         touchTooltipData: BarTouchTooltipData(
            //           tooltipBgColor: Colors.grey,
            //           getTooltipItem: (a, b, c, d) => null,
            //         ),
            //         touchCallback: (FlTouchEvent event, response) {
            //           if (response == null || response.spot == null) {
            //             setState(() {
            //               touchedGroupIndex = -1;
            //               showingBarGroups = List.of(rawBarGroups);
            //             });
            //             return;
            //           }
            //
            //           touchedGroupIndex = response.spot!.touchedBarGroupIndex;
            //
            //           setState(() {
            //             if (!event.isInterestedForInteractions) {
            //               touchedGroupIndex = -1;
            //               showingBarGroups = List.of(rawBarGroups);
            //               return;
            //             }
            //             showingBarGroups = List.of(rawBarGroups);
            //             if (touchedGroupIndex != -1) {
            //               var sum = 0.0;
            //               for (final rod
            //               in showingBarGroups[touchedGroupIndex].barRods) {
            //                 sum += rod.toY;
            //               }
            //               final avg = sum /
            //                   showingBarGroups[touchedGroupIndex]
            //                       .barRods
            //                       .length;
            //
            //               showingBarGroups[touchedGroupIndex] =
            //                   showingBarGroups[touchedGroupIndex].copyWith(
            //                     barRods: showingBarGroups[touchedGroupIndex]
            //                         .barRods
            //                         .map((rod) {
            //                       return rod.copyWith(
            //                           toY: avg, color: Colors.lightBlue);
            //                     }).toList(),
            //                   );
            //             }
            //           });
            //         },
            //       ),
            //       titlesData: FlTitlesData(
            //         show: true,
            //         rightTitles: const AxisTitles(
            //           sideTitles: SideTitles(showTitles: false),
            //         ),
            //         topTitles: const AxisTitles(
            //           sideTitles: SideTitles(showTitles: false),
            //         ),
            //         bottomTitles: AxisTitles(
            //           sideTitles: SideTitles(
            //             showTitles: true,
            //             getTitlesWidget: bottomTitles2,
            //             reservedSize: 42,
            //           ),
            //         ),
            //         leftTitles: AxisTitles(
            //           sideTitles: SideTitles(
            //             showTitles: true,
            //             reservedSize: 28,
            //             interval: 1,
            //             getTitlesWidget: leftTitles2,
            //           ),
            //         ),
            //       ),
            //       borderData: FlBorderData(
            //         show: false,
            //       ),
            //       barGroups: showingBarGroups,
            //       gridData: const FlGridData(show: false),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 12,
            // ),
          ],
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '1K';
    } else if (value == 10) {
      text = '5K';
    } else if (value == 19) {
      text = '10K';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Adenovirus','Yellow Fever','Tonsillitis','Tapeworm'];
    //['sulaymaniyah', 'erbil', 'duhok', 'halabja',  ];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: Colors.amberAccent,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color:Colors.purple,
          width: width,
        ),
      ],
    );
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.black26,// Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color:Colors.black38,// Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color:Colors.black,// Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color:Colors.black,// Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color:Colors.black87,// Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }

  ///

  Widget leftTitles2(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '1K';
    } else if (value == 10) {
      text = '5K';
    } else if (value == 19) {
      text = '10K';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles2(double value, TitleMeta meta) {
    final titles = <String>['Diabetic ','Blood pressure','Cancer ','Heart disease'];
    //['sulaymaniyah', 'erbil', 'duhok', 'halabja',  ];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData2(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: Colors.amberAccent,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color:Colors.purple,
          width: width,
        ),
      ],
    );
  }

  Widget makeTransactionsIcon2() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.black26,// Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color:Colors.black38,// Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color:Colors.black,// Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color:Colors.black,// Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color:Colors.black87,// Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }

}