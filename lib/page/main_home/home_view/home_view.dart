import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart' as radar_chart;

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int? selectedDayIndex; // null là ALL

  // Dữ liệu 14 ngày
  final List<List<double>> radarDataAllDays = List.generate(14, (index) {
    return [
      4.0 + (index % 3) * 0.2, // PH
      3.5 + (index % 2) * 0.3, // SPO2
      3.8 + (index % 4) * 0.2, // Nhiệt độ
      2.5 + (index % 3) * 0.3, // Mạch
      4.5 + (index % 2) * 0.4, // Huyết áp
    ];
  });

  final List<double> pieDataPositive = List.generate(
    14,
    (index) => 70 + index % 5.0,
  );
  final List<double> pieDataNegative = List.generate(
    14,
    (index) => 30 - index % 5.0,
  );

  @override
  Widget build(BuildContext context) {
    final radarData =
        selectedDayIndex == null
            ? [_calculateAverage(radarDataAllDays)]
            : [radarDataAllDays[selectedDayIndex!]];

    final piePositive =
        selectedDayIndex == null
            ? _average(pieDataPositive)
            : pieDataPositive[selectedDayIndex!];

    final pieNegative =
        selectedDayIndex == null
            ? _average(pieDataNegative)
            : pieDataNegative[selectedDayIndex!];

    return Scaffold(
      appBar: AppBar(title: Text('Biểu đồ nguy cơ đột quỵ & Radar')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Biểu đồ tròn
            SizedBox(
              height: 300,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: piePositive,
                      color: Colors.red,
                      radius: 55,
                      title: '${piePositive.toStringAsFixed(0)}%',
                      titleStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    PieChartSectionData(
                      value: pieNegative,
                      color: Colors.blue,
                      radius: 50,
                      title: '${pieNegative.toStringAsFixed(0)}%',
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
                features: ['PH', 'SPO2', 'NHIỆT ĐỘ', 'MẠCH ĐẬP', 'HUYẾT ÁP'],
                data: radarData,
                reverseAxis: false,
              ),
            ),
            SizedBox(height: 20),
            _buildDayButtons(), // Các nút chọn ngày (ALL, 1-14)
          ],
        ),
      ),
    );
  }

  // Tính trung bình danh sách
  double _average(List<double> list) {
    return list.reduce((a, b) => a + b) / list.length;
  }

  // Tính trung bình của radar chart
  List<double> _calculateAverage(List<List<double>> data) {
    int count = data.length;
    int dimension = data[0].length;

    List<double> avg = List.filled(dimension, 0.0);
    for (var values in data) {
      for (int i = 0; i < dimension; i++) {
        avg[i] += values[i];
      }
    }

    return avg.map((value) => value / count).toList();
  }

  // Nút chọn ngày (ALL + 1 đến 14)
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
                selectedDayIndex = index;
              });
            },
            child: Text('${index + 1}'),
          );
        }),
      ],
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter_radar_chart/flutter_radar_chart.dart' as radar_chart;
// import 'package:webview_flutter/webview_flutter.dart';

// class HomeView extends StatefulWidget {
//   @override
//   _HomeViewState createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   int? selectedDayIndex; // null là ALL

//   // Dữ liệu 14 ngày
//   final List<List<double>> radarDataAllDays = List.generate(14, (index) {
//     return [
//       4.0 + (index % 3) * 0.2, // PH
//       3.5 + (index % 2) * 0.3, // SPO2
//       3.8 + (index % 4) * 0.2, // Nhiệt độ
//       2.5 + (index % 3) * 0.3, // Mạch
//       4.5 + (index % 2) * 0.4, // Huyết áp
//     ];
//   });

//   final List<double> pieDataPositive = List.generate(
//     14,
//     (index) => 70 + index % 5.0,
//   );
//   final List<double> pieDataNegative = List.generate(
//     14,
//     (index) => 30 - index % 5.0,
//   );

//   @override
//   Widget build(BuildContext context) {
//     final radarData = selectedDayIndex == null
//         ? [_calculateAverage(radarDataAllDays)]
//         : [radarDataAllDays[selectedDayIndex!]];

//     final piePositive = selectedDayIndex == null
//         ? _average(pieDataPositive)
//         : pieDataPositive[selectedDayIndex!];

//     final pieNegative = selectedDayIndex == null
//         ? _average(pieDataNegative)
//         : pieDataNegative[selectedDayIndex!];

//     return Scaffold(
//       appBar: AppBar(title: Text('Biểu đồ nguy cơ đột quỵ & Radar')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Biểu đồ tròn
//             SizedBox(
//               height: 300,
//               child: PieChart(
//                 PieChartData(
//                   sections: [
//                     PieChartSectionData(
//                       value: piePositive,
//                       color: Colors.red,
//                       radius: 55,
//                       title: '${piePositive.toStringAsFixed(0)}%',
//                       titleStyle: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     PieChartSectionData(
//                       value: pieNegative,
//                       color: Colors.blue,
//                       radius: 50,
//                       title: '${pieNegative.toStringAsFixed(0)}%',
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
//             SizedBox(height: 30),
//             // Biểu đồ radar
//             SizedBox(
//               height: 300,
//               child: radar_chart.RadarChart.light(
//                 ticks: [1, 2, 3, 4, 5],
//                 features: ['PH', 'SPO2', 'NHIỆT ĐỘ', 'MẠCH ĐẬP', 'HUYẾT ÁP'],
//                 data: radarData,
//                 reverseAxis: false,
//               ),
//             ),
//             SizedBox(height: 20),
//             _buildDayButtons(),
//             SizedBox(height: 40),
//             Divider(),
//             Text(
//               'Trợ lý ảo',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             ChatWebView(), // WebView hiển thị chat
//           ],
//         ),
//       ),
//     );
//   }

//   double _average(List<double> list) {
//     return list.reduce((a, b) => a + b) / list.length;
//   }

//   List<double> _calculateAverage(List<List<double>> data) {
//     int count = data.length;
//     int dimension = data[0].length;

//     List<double> avg = List.filled(dimension, 0.0);
//     for (var values in data) {
//       for (int i = 0; i < dimension; i++) {
//         avg[i] += values[i];
//       }
//     }

//     return avg.map((value) => value / count).toList();
//   }

//   Widget _buildDayButtons() {
//     return Wrap(
//       spacing: 8,
//       runSpacing: 8,
//       alignment: WrapAlignment.center,
//       children: [
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor:
//                 selectedDayIndex == null ? Colors.blue : Colors.grey[300],
//             foregroundColor:
//                 selectedDayIndex == null ? Colors.white : Colors.black,
//           ),
//           onPressed: () {
//             setState(() {
//               selectedDayIndex = null;
//             });
//           },
//           child: Text('ALL'),
//         ),
//         ...List.generate(14, (index) {
//           final isSelected = selectedDayIndex == index;
//           return ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
//               foregroundColor: isSelected ? Colors.white : Colors.black,
//             ),
//             onPressed: () {
//               setState(() {
//                 selectedDayIndex = index;
//               });
//             },
//             child: Text('${index + 1}'),
//           );
//         }),
//       ],
//     );
//   }
// }

// class ChatWebView extends StatelessWidget {
//   const ChatWebView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..loadHtmlString('''
//         <!DOCTYPE html>
//         <html>
//           <head>
//             <link href="https://cdn.jsdelivr.net/npm/@n8n/chat/dist/style.css" rel="stylesheet" />
//             <style>
//               html, body {
//                 margin: 0;
//                 padding: 0;
//                 height: 100%;
//                 overflow: hidden;
//               }
//             </style>
//           </head>
//           <body>
//             <script type="module">
//               import { createChat } from 'https://cdn.jsdelivr.net/npm/@n8n/chat/dist/chat.bundle.es.js';
//               createChat({
//                 webhookUrl: 'http://10.0.2.2:5678/webhook/9f8e4a1a-3c19-48e1-ad90-f1efed1d7dce/chat'
//               });
//             </script>
//           </body>
//         </html>
//       ''');

//     return SizedBox(
//       height: 400,
//       child: WebViewWidget(controller: controller),
//     );
//   }
// }
