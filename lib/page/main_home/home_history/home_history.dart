// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class HomeHistory extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Text(
//               'Lịch sử các chỉ số sức khỏe',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),

//             _buildChart(
//               'Huyết áp tâm thu',
//               Colors.red,
//               Colors.blue,
//               _getData1(),
//             ),
//             _buildChart(
//               'Huyết áp tâm trương',
//               Colors.red,
//               Colors.blue,
//               _getData2(),
//             ),
//             _buildChart('SpO2', Colors.red, Colors.blue, _getData3()),
//             _buildChart('Nhiệt độ (°C)', Colors.red, Colors.blue, _getData4()),
//             _buildChart('Mạch đập (bpm)', Colors.red, Colors.blue, _getData5()),
//             _buildChart('pH', Colors.red, Colors.blue, _getData6()),
//           ],
//         ),
//       ),
//     );
//   }

// Widget _buildChart(
//   String title,
//   Color color1,
//   Color color2,
//   List<List<double>> data,
// ) {
//   List<double> ngay = data[0];
//   List<double> dem = data[1];

//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         title,
//         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//       ),
//       SizedBox(height: 8),
//       Container(
//         height: 150,
//         child: BarChart(
//           BarChartData(
//             barGroups: List.generate(ngay.length, (index) {
//               return BarChartGroupData(
//                 x: index + 1,
//                 barRods: [
//                   BarChartRodData(toY: ngay[index], color: color1, width: 8),
//                   BarChartRodData(toY: dem[index], color: color2, width: 8),
//                 ],
//               );
//             }),
//             titlesData: FlTitlesData(
//               leftTitles: AxisTitles(
//                 sideTitles: SideTitles(
//                   showTitles: true,
//                   reservedSize: 30,
//                   getTitlesWidget:
//                       (value, meta) => Text(
//                         '${value.toInt()}',
//                         style: TextStyle(fontSize: 10),
//                       ),
//                 ),
//               ),
//               bottomTitles: AxisTitles(
//                 sideTitles: SideTitles(
//                   showTitles: true,
//                   getTitlesWidget:
//                       (value, meta) => Text(
//                         '${value.toInt()}',
//                         style: TextStyle(fontSize: 10),
//                       ),
//                 ),
//               ),
//               rightTitles: AxisTitles(
//                 sideTitles: SideTitles(showTitles: false),
//               ),
//               topTitles: AxisTitles(
//                 sideTitles: SideTitles(showTitles: false),
//               ),
//             ),
//             borderData: FlBorderData(show: false),
//             gridData: FlGridData(show: true),
//           ),
//         ),
//       ),
//       SizedBox(height: 4),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _buildLegend(color1, 'Ngày'),
//           SizedBox(width: 16),
//           _buildLegend(color2, 'Đêm'),
//         ],
//       ),
//       SizedBox(height: 16),
//     ],
//   );
// }

// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class HomeHistory extends StatefulWidget {
//   @override
//   _HomeHistoryState createState() => _HomeHistoryState();
// }

// class _HomeHistoryState extends State<HomeHistory> {
//   int selectedDayIndex = 0; // mặc định là ngày đầu tiên (index 0)

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Text(
//               'Lịch sử các chỉ số sức khỏe',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             _buildDayButtons(),

//             SizedBox(height: 20),
//             _buildChart(
//               'Huyết áp tâm thu',
//               Colors.red,
//               Colors.blue,
//               _getData1(),
//             ),
//             _buildChart(
//               'Huyết áp tâm trương',
//               Colors.red,
//               Colors.blue,
//               _getData2(),
//             ),
//             _buildChart('SpO2', Colors.red, Colors.blue, _getData3()),
//             _buildChart('Nhiệt độ (°C)', Colors.red, Colors.blue, _getData4()),
//             _buildChart('Mạch đập (bpm)', Colors.red, Colors.blue, _getData5()),
//             _buildChart('pH', Colors.red, Colors.blue, _getData6()),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDayButtons() {
//     return Wrap(
//       spacing: 8,
//       runSpacing: 8,
//       children: List.generate(14, (index) {
//         return ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor:
//                 selectedDayIndex == index ? Colors.blue : Colors.grey[300],
//             foregroundColor:
//                 selectedDayIndex == index ? Colors.white : Colors.black,
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           ),
//           onPressed: () {
//             setState(() {
//               selectedDayIndex = index;
//             });
//           },
//           child: Text('${index + 1}'),
//         );
//       }),
//     );
//   }

//   Widget _buildChart(
//     String title,
//     Color color1,
//     Color color2,
//     List<List<double>> data,
//   ) {
//     List<double> ngay = data[0];
//     List<double> dem = data[1];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           '$title - Ngày ${selectedDayIndex + 1}',
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//         ),
//         SizedBox(height: 8),
//         Container(
//           height: 150,
//           child: BarChart(
//             BarChartData(
//               barGroups: [
//                 BarChartGroupData(
//                   x: selectedDayIndex + 1,
//                   barRods: [
//                     BarChartRodData(
//                       toY: ngay[selectedDayIndex],
//                       color: color1,
//                       width: 12,
//                     ),
//                     BarChartRodData(
//                       toY: dem[selectedDayIndex],
//                       color: color2,
//                       width: 12,
//                     ),
//                   ],
//                 ),
//               ],
//               titlesData: FlTitlesData(
//                 leftTitles: AxisTitles(
//                   sideTitles: SideTitles(
//                     showTitles: true,
//                     reservedSize: 30,
//                     getTitlesWidget:
//                         (value, meta) => Text(
//                           '${value.toInt()}',
//                           style: TextStyle(fontSize: 10),
//                         ),
//                   ),
//                 ),
//                 bottomTitles: AxisTitles(
//                   sideTitles: SideTitles(
//                     showTitles: true,
//                     getTitlesWidget:
//                         (value, meta) => Text(
//                           '${value.toInt()}',
//                           style: TextStyle(fontSize: 10),
//                         ),
//                   ),
//                 ),
//                 rightTitles: AxisTitles(
//                   sideTitles: SideTitles(showTitles: false),
//                 ),
//                 topTitles: AxisTitles(
//                   sideTitles: SideTitles(showTitles: false),
//                 ),
//               ),
//               borderData: FlBorderData(show: false),
//               gridData: FlGridData(show: true),
//             ),
//           ),
//         ),
//         SizedBox(height: 4),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _buildLegend(color1, 'Ngày'),
//             SizedBox(width: 16),
//             _buildLegend(color2, 'Đêm'),
//           ],
//         ),
//         SizedBox(height: 16),
//       ],
//     );
//   }

//   // Dữ liệu mẫu
//   List<List<double>> _getData1() => [
//     [
//       155,
//       152,
//       158,
//       160,
//       165,
//       162,
//       170,
//       155,
//       152,
//       158,
//       160,
//       165,
//       162,
//       170,
//     ], // Ngày
//     [
//       145,
//       142,
//       148,
//       150,
//       155,
//       152,
//       158,
//       145,
//       142,
//       148,
//       150,
//       155,
//       152,
//       158,
//     ], // Đêm
//   ];

//   List<List<double>> _getData2() => [
//     [90, 88, 92, 91, 95, 93, 97, 90, 88, 92, 91, 95, 93, 97],
//     [85, 82, 86, 84, 88, 87, 90, 85, 82, 86, 84, 88, 87, 90],
//   ];

//   List<List<double>> _getData3() => [
//     [97, 98, 97, 96, 98, 99, 98, 97, 98, 97, 96, 98, 99, 98],
//     [95, 96, 95, 94, 96, 97, 96, 95, 96, 95, 94, 96, 97, 96],
//   ];

//   List<List<double>> _getData4() => [
//     [
//       36.5,
//       36.6,
//       36.7,
//       36.6,
//       36.8,
//       36.9,
//       37.0,
//       36.5,
//       36.6,
//       36.7,
//       36.6,
//       36.8,
//       36.9,
//       37.0,
//     ],
//     [
//       36.3,
//       36.4,
//       36.5,
//       36.5,
//       36.6,
//       36.7,
//       36.8,
//       36.3,
//       36.4,
//       36.5,
//       36.5,
//       36.6,
//       36.7,
//       36.8,
//     ],
//   ];

//   List<List<double>> _getData5() => [
//     [72, 74, 75, 78, 76, 80, 82, 72, 74, 75, 78, 76, 80, 82],
//     [68, 70, 71, 72, 73, 74, 76, 68, 70, 71, 72, 73, 74, 76],
//   ];

//   List<List<double>> _getData6() => [
//     [
//       7.35,
//       7.36,
//       7.37,
//       7.38,
//       7.36,
//       7.37,
//       7.38,
//       7.35,
//       7.36,
//       7.37,
//       7.38,
//       7.36,
//       7.37,
//       7.38,
//     ],
//     [
//       7.34,
//       7.35,
//       7.36,
//       7.35,
//       7.34,
//       7.36,
//       7.35,
//       7.34,
//       7.35,
//       7.36,
//       7.35,
//       7.34,
//       7.36,
//       7.35,
//     ],
//   ];

//   Widget _buildLegend(Color color, String text) {
//     return Row(
//       children: [
//         Container(width: 12, height: 12, color: color),
//         SizedBox(width: 4),
//         Text(text, style: TextStyle(fontSize: 12)),
//       ],
//     );
//   }
// }
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeHistory extends StatefulWidget {
  @override
  State<HomeHistory> createState() => _HomeHistoryState();
}

class _HomeHistoryState extends State<HomeHistory> {
  int? selectedDayIndex; // null = hiển thị tất cả

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      appBar: AppBar(title: Text('Lịch sử các chỉ số sức khỏe')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildChart(
              'Huyết áp tâm thu',
              Colors.red,
              Colors.blue,
              _getData1(),
            ),
            _buildChart(
              'Huyết áp tâm trương',
              Colors.red,
              Colors.blue,
              _getData2(),
            ),
            _buildChart('SpO2', Colors.red, Colors.blue, _getData3()),
            _buildChart('Nhiệt độ (°C)', Colors.red, Colors.blue, _getData4()),
            _buildChart('Mạch đập (bpm)', Colors.red, Colors.blue, _getData5()),
            _buildChart('pH', Colors.red, Colors.blue, _getData6()),

            SizedBox(height: 20),
            _buildDayButtons(), // Nút chọn ngày ở cuối
          ],
        ),
      ),
    );
  }

  Widget _buildChart(
    String title,
    Color color1,
    Color color2,
    List<List<double>> data,
  ) {
    List<double> ngay = data[0];
    List<double> dem = data[1];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8),
        Container(
          height: 150,
          child: BarChart(
            BarChartData(
              barGroups: _buildBarGroups(ngay, dem),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    getTitlesWidget:
                        (value, meta) => Text(
                          '${value.toInt()}',
                          style: TextStyle(fontSize: 10),
                        ),
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget:
                        (value, meta) => Text(
                          '${value.toInt()}',
                          style: TextStyle(fontSize: 10),
                        ),
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
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLegend(color1, 'Ngày'),
            SizedBox(width: 16),
            _buildLegend(color2, 'Đêm'),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }

  List<BarChartGroupData> _buildBarGroups(List<double> ngay, List<double> dem) {
    List<BarChartGroupData> groups = [];

    for (int i = 0; i < ngay.length; i++) {
      if (selectedDayIndex == null || selectedDayIndex == i) {
        groups.add(
          BarChartGroupData(
            x: i + 1,
            barRods: [
              BarChartRodData(toY: ngay[i], color: Colors.red, width: 8),
              BarChartRodData(toY: dem[i], color: Colors.blue, width: 8),
            ],
          ),
        );
      }
    }

    return groups;
  }

  Widget _buildDayButtons() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                selectedDayIndex == null ? Colors.blue : Colors.grey[300],
            foregroundColor:
                selectedDayIndex == null ? Colors.white : Colors.black,
          ),
          onPressed: () {
            setState(() {
              selectedDayIndex = null;
            });
          },
          child: Text('ALL'),
        ),
        ...List.generate(14, (index) {
          final isSelected = selectedDayIndex == index;
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
              foregroundColor: isSelected ? Colors.white : Colors.black,
            ),
            onPressed: () {
              setState(() {
                selectedDayIndex = selectedDayIndex == index ? null : index;
              });
            },
            child: Text('${index + 1}'),
          );
        }),
      ],
    );
  }

  // Dữ liệu mẫu
  List<List<double>> _getData1() => [
    [155, 152, 158, 160, 165, 162, 170, 155, 152, 158, 160, 165, 162, 170],
    [145, 142, 148, 150, 155, 152, 158, 145, 142, 148, 150, 155, 152, 158],
  ];

  List<List<double>> _getData2() => [
    [90, 88, 92, 91, 95, 93, 97, 90, 88, 92, 91, 95, 93, 97],
    [85, 82, 86, 84, 88, 87, 90, 85, 82, 86, 84, 88, 87, 90],
  ];

  List<List<double>> _getData3() => [
    [97, 98, 97, 96, 98, 99, 98, 97, 98, 97, 96, 98, 99, 98],
    [95, 96, 95, 94, 96, 97, 96, 95, 96, 95, 94, 96, 97, 96],
  ];

  List<List<double>> _getData4() => [
    [
      36.5,
      36.6,
      36.7,
      36.6,
      36.8,
      36.9,
      37.0,
      36.5,
      36.6,
      36.7,
      36.6,
      36.8,
      36.9,
      37.0,
    ],
    [
      36.3,
      36.4,
      36.5,
      36.5,
      36.6,
      36.7,
      36.8,
      36.3,
      36.4,
      36.5,
      36.5,
      36.6,
      36.7,
      36.8,
    ],
  ];

  List<List<double>> _getData5() => [
    [72, 74, 75, 78, 76, 80, 82, 72, 74, 75, 78, 76, 80, 82],
    [68, 70, 71, 72, 73, 74, 76, 68, 70, 71, 72, 73, 74, 76],
  ];

  List<List<double>> _getData6() => [
    [
      7.35,
      7.36,
      7.37,
      7.38,
      7.36,
      7.37,
      7.38,
      7.35,
      7.36,
      7.37,
      7.38,
      7.36,
      7.37,
      7.38,
    ],
    [
      7.34,
      7.35,
      7.36,
      7.35,
      7.34,
      7.36,
      7.35,
      7.34,
      7.35,
      7.36,
      7.35,
      7.34,
      7.36,
      7.35,
    ],
  ];

  Widget _buildLegend(Color color, String text) {
    return Row(
      children: [
        Container(width: 12, height: 12, color: color),
        SizedBox(width: 4),
        Text(text, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
