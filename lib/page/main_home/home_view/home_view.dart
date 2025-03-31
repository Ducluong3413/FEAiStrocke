// import 'package:flutter/material.dart';

// import 'package:fl_chart/fl_chart.dart';

// class HomeView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HealthDashboard(),
//     );
//   }
// }

// class HealthDashboard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 40),
//               Center(
//                 child: Text(
//                   'Hi, WelcomeBack\nMinh Nguyet',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               SizedBox(height: 20),
//               healthCard('Health'),
//               SizedBox(height: 20),
//               healthCard('Blood pressure'),
//               SizedBox(height: 20),
//               warningCard(
//                 '⚠️ STROKE RISK WARNING!',
//                 'Blood Pressure: 180/110 mmHg (HIGH)\nHeart Rate: 120 BPM (ABNORMAL)\nStroke Risk: HIGH',
//                 Colors.red,
//               ),
//               SizedBox(height: 20),
//               warningCard(
//                 '⚠️ MODERATE HEALTH ALERT!',
//                 'Blood Pressure: 135/85 mmHg (ELEVATED)\nHeart Rate: 90 BPM (SLIGHTLY HIGH)\nStroke Risk: MODERATE',
//                 Colors.yellow[700]!,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget healthCard(String title) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             blurRadius: 5,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),
//           Container(
//             height: 150,
//             child: LineChart(
//               LineChartData(
//                 gridData: FlGridData(show: false),
//                 titlesData: FlTitlesData(show: false),
//                 borderData: FlBorderData(show: false),
//                 lineBarsData: [
//                   LineChartBarData(
//                     spots: [
//                       FlSpot(0, 56),
//                       FlSpot(1, 64),
//                       FlSpot(2, 76),
//                       FlSpot(3, 78),
//                       FlSpot(4, 70),
//                       FlSpot(5, 37),
//                     ],
//                     isCurved: true,
//                     // colors: [Colors.purple],
//                     dotData: FlDotData(show: true),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget warningCard(String title, String content, Color color) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           SizedBox(height: 5),
//           Text(content, style: TextStyle(fontSize: 14, color: Colors.white)),
//         ],
//       ),
//     );
//   }
// }

//vòng trò ngu cơ đột quỵ
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class HomeView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Pie Chart Example')),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 300,
//               child: PieChart(
//                 PieChartData(
//                   //sectionsSpace: 0, // Remove the space between sections
//                   //centerSpaceRadius: 0, // Make the center a perfect circle
//                   sections: [
//                     PieChartSectionData(
//                       value: 70,
//                       color: Colors.red,
//                       radius: 55,
//                       titleStyle: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     PieChartSectionData(
//                       value: 30,
//                       color: Colors.blue,
//                       radius: 50,
//                       titleStyle: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(width: 20, height: 20, color: Colors.red),
//                 SizedBox(width: 10),
//                 Text('NGUY CƠ ĐỘT QUỴ'),
//                 SizedBox(width: 20),
//                 Container(width: 20, height: 20, color: Colors.blue),
//                 SizedBox(width: 10),
//                 Text('ÂM TÍNH'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//vòng trò ngu cơ đột quỵ
// sơ đồ radar
// import 'package:flutter/material.dart';
// import 'package:flutter_radar_chart/flutter_radar_chart.dart';

// class HomeView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<String> features = ['PH', 'SPO2', 'NHIỆT ĐỘ', 'MẠCH ĐẬP', 'HUYẾT ÁP'];
//     List<List<double>> data = [
//       [4.5, 3.5, 4.0, 2.5, 5.0], // Giá trị
//     ];

//     return Scaffold(
//       appBar: AppBar(title: Text('Radar Chart Example')),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 300,
//               child: RadarChart.light(
//                 ticks: [1, 2, 3, 4, 5],
//                 features: features,
//                 data: data,
//                 reverseAxis: false,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//sơ đồ radar

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart' as radar_chart;

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> features = ['PH', 'SPO2', 'NHIỆT ĐỘ', 'MẠCH ĐẬP', 'HUYẾT ÁP'];
    List<List<double>> data = [
      [4.5, 3.5, 4.0, 2.5, 5.0],
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Biểu đồ nguy cơ đột quỵ & Radar')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Biểu đồ tròn
            SizedBox(
              height: 300,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: 70,
                      color: Colors.red,
                      radius: 55,
                      title: '70%',
                      titleStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    PieChartSectionData(
                      value: 30,
                      color: Colors.blue,
                      radius: 50,
                      title: '30%',
                      titleStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(width: 20, height: 20, color: Colors.red),
                SizedBox(width: 10),
                Text('NGUY CƠ ĐỘT QUỴ'),
                SizedBox(width: 20),
                Container(width: 20, height: 20, color: Colors.blue),
                SizedBox(width: 10),
                Text('ÂM TÍNH'),
              ],
            ),
            SizedBox(height: 30),
            // Biểu đồ radar
            SizedBox(
              height: 300,
              child: radar_chart.RadarChart.light(
                ticks: [1, 2, 3, 4, 5],
                features: features,
                data: data,
                reverseAxis: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
