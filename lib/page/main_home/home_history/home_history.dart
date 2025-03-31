// import 'package:flutter/material.dart';

// class HomeHistory extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HealthHistoryScreen(),
//     );
//   }
// }

// class HealthHistoryScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> data = [
//     {
//       "date": "27/02/2025",
//       "records": [
//         {
//           "type": "Heart Rate",
//           "value": "89bpm",
//           "time": "10:30",
//           "color": Colors.green,
//         },
//         {
//           "type": "Blood Pressure",
//           "value": "105/78 mmHg",
//           "time": "10:30",
//           "color": Colors.green,
//         },
//       ],
//     },
//     {
//       "date": "28/02/2025",
//       "records": [
//         {
//           "type": "Heart Rate",
//           "value": "120bpm",
//           "time": "4:21",
//           "color": Colors.red,
//         },
//         {
//           "type": "Blood Pressure",
//           "value": "105/78 mmHg",
//           "time": "4:21",
//           "color": Colors.green,
//         },
//         {
//           "type": "Heart Rate",
//           "value": "100bpm",
//           "time": "3:00",
//           "color": Colors.red,
//         },
//         {
//           "type": "Blood Pressure",
//           "value": "100/78 mmHg",
//           "time": "3:00",
//           "color": Colors.green,
//         },
//       ],
//     },
//     {
//       "date": "25/02/2025",
//       "records": [
//         {
//           "type": "Heart Rate",
//           "value": "80bpm",
//           "time": "4:21",
//           "color": Colors.yellow,
//         },
//       ],
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.only(top: 50), // Margin top 40
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Text(
//               "Health Parameter History",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.cyan,
//               ),
//             ),
//             const SizedBox(height: 10),
//             _buildFilterButtons(),
//             const SizedBox(height: 10),
//             Expanded(child: _buildHistoryList()),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFilterButtons() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         _buildFilterButton("ALL", Icons.filter_alt, Colors.grey),
//         const SizedBox(width: 10),
//         _buildFilterButton("Heart Rate", Icons.favorite, Colors.cyan),
//         const SizedBox(width: 10),
//         _buildFilterButton("Blood Pressure", Icons.monitor_heart, Colors.cyan),
//       ],
//     );
//   }

//   Widget _buildFilterButton(String text, IconData icon, Color color) {
//     return ElevatedButton.icon(
//       onPressed: () {},
//       icon: Icon(icon, color: Colors.white),
//       label: Text(text, style: const TextStyle(color: Colors.white)),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: color,
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       ),
//     );
//   }

//   Widget _buildHistoryList() {
//     return ListView.builder(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       itemCount: data.length,
//       itemBuilder: (context, index) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               data[index]["date"],
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 5),
//             ...data[index]["records"]
//                 .map<Widget>((record) => _buildHistoryCard(record))
//                 .toList(),
//             const SizedBox(height: 10),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildHistoryCard(Map<String, dynamic> record) {
//     return Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   width: 8,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color: record["color"],
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       record["type"],
//                       style: const TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Text(record["value"]),
//                   ],
//                 ),
//               ],
//             ),
//             Text(
//               record["time"],
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Biểu đồ thay đổi huyết áp tâm thu')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: BarChart(
                BarChartData(
                  barGroups: _getBarGroups(),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '${value.toInt()}',
                            style: TextStyle(fontSize: 12),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '${value.toInt()}',
                            style: TextStyle(fontSize: 12),
                          );
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: true),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegend(Colors.red, 'Ngày'),
                SizedBox(width: 20),
                _buildLegend(Colors.blue, 'Đêm'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    List<double> ngay = [
      155,
      152,
      158,
      160,
      165,
      162,
      170,
      160,
      163,
      172,
      165,
      160,
      164,
      168,
    ];
    List<double> dem = [
      145,
      142,
      148,
      150,
      155,
      152,
      158,
      150,
      153,
      160,
      155,
      150,
      154,
      158,
    ];

    return List.generate(ngay.length, (index) {
      return BarChartGroupData(
        x: index + 1,
        barRods: [
          BarChartRodData(toY: ngay[index], color: Colors.red, width: 10),
          BarChartRodData(toY: dem[index], color: Colors.blue, width: 10),
        ],
      );
    });
  }

  Widget _buildLegend(Color color, String text) {
    return Row(
      children: [
        Container(width: 16, height: 16, color: color),
        SizedBox(width: 4),
        Text(text, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
