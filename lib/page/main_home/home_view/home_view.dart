// import 'package:assistantstroke/controler/indicators_controller.dart';
// import 'package:assistantstroke/model/UserMedicalDataResponse.dart';
// import 'package:assistantstroke/model/indicatorModel.dart';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter_radar_chart/flutter_radar_chart.dart' as radar_chart;

// class HomeView extends StatefulWidget {
//   @override
//   _HomeViewState createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   int? selectedDayIndex;
//   IndicatorModel? indicatorData;
//   bool isLoading = true;
//   late Future<AverageData> futureData;
//   // Dữ liệu radar giả định
//   final List<List<double>> radarDataAllDays = List.generate(14, (index) {
//     return [
//       4.0 + (index % 3) * 0.2,
//       3.5 + (index % 2) * 0.3,
//       3.8 + (index % 4) * 0.2,
//       2.5 + (index % 3) * 0.3,
//       4.5 + (index % 2) * 0.4,
//     ];
//   });

//   @override
//   void initState() {
//     super.initState();
//     _loadIndicatorData();
//     // futureData = controller.fetchAverageAll14Day();
//   }

//   void _loadIndicatorData() async {
//     final controller = IndicatorController();
//     final result = await controller.fetchIndicatorData();

//     setState(() {
//       indicatorData = result;
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final radarData =
//         selectedDayIndex == null
//             ? [_calculateAverage(radarDataAllDays)]
//             : [radarDataAllDays[selectedDayIndex!]];

//     final piePositive = (indicatorData?.percent ?? 0).toDouble();
//     final pieNegative = (100 - piePositive).toDouble();

//     return Scaffold(
//       appBar: AppBar(title: Text('Biểu đồ nguy cơ đột quỵ & Radar')),
//       body:
//           isLoading
//               ? Center(child: CircularProgressIndicator())
//               : indicatorData == null
//               ? Center(child: Text("Không có dữ liệu"))
//               : SingleChildScrollView(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Biểu đồ tròn
//                     SizedBox(
//                       height: 300,
//                       child: PieChart(
//                         PieChartData(
//                           sections: [
//                             PieChartSectionData(
//                               value: piePositive,
//                               color: Colors.red,
//                               radius: 55,
//                               title: '${piePositive.toStringAsFixed(0)}%',
//                               titleStyle: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             PieChartSectionData(
//                               value: pieNegative,
//                               color: Colors.blue,
//                               radius: 50,
//                               title: '${pieNegative.toStringAsFixed(0)}%',
//                               titleStyle: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Container(width: 20, height: 20, color: Colors.red),
//                         SizedBox(width: 10),
//                         Text('NGUY CƠ ĐỘT QUỴ'),
//                         SizedBox(width: 20),
//                         Container(width: 20, height: 20, color: Colors.blue),
//                         SizedBox(width: 10),
//                         Text('ÂM TÍNH'),
//                       ],
//                     ),
//                     SizedBox(height: 30),

//                     // Biểu đồ radar
//                     SizedBox(
//                       height: 300,
//                       child: radar_chart.RadarChart.light(
//                         ticks: [1, 2, 3, 4, 5],
//                         features: [
//                           'PH',
//                           'SPO2',
//                           'NHIỆT ĐỘ',
//                           'MẠCH ĐẬP',
//                           'HUYẾT ÁP',
//                         ],
//                         data: radarData,
//                         reverseAxis: false,
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     _buildDayButtons(),
//                   ],
//                 ),
//               ),
//     );
//   }

//   // Tính trung bình danh sách
//   double _average(List<double> list) {
//     return list.reduce((a, b) => a + b) / list.length;
//   }

//   // Tính trung bình radar
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

// import 'package:assistantstroke/controler/indicators_controller.dart';
// import 'package:assistantstroke/controler/user_medical_data_service.dart';
// import 'package:assistantstroke/controler/usermedicaldatas_controller.dart';
// import 'package:assistantstroke/model/UserMedicalDataResponse.dart';
// import 'package:assistantstroke/model/indicatorModel.dart';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter_radar_chart/flutter_radar_chart.dart' as radar_chart;

// class HomeView extends StatefulWidget {
//   @override
//   _HomeViewState createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   int? selectedDayIndex;
//   IndicatorModel? indicatorData;
//   bool isLoading = true;
//   UserMedicalDataResponse? data;
//   @override
//   void initState() {
//     super.initState();
//     _loadIndicatorData();
//   }

//   void _loadIndicatorData() async {
//     final controller = IndicatorController();
//     final result = await controller.fetchIndicatorData();

//     setState(() {
//       indicatorData = result;
//       isLoading = false;
//     });
//   }

//   // Future<void> _loadData() async {
//   //   final controller = UserMedicalDataController();
//   //   try {
//   //     final fetchedData = await controller.fetchUserMedicalData();
//   //     setState(() {
//   //       data = fetchedData;
//   //       isLoading = false;
//   //       print('Data Percent: ${data?.dataPercent}');

//   //     });
//   //   } catch (e) {
//   //     print('Lỗi: $e');
//   //     setState(() {
//   //       isLoading = false;
//   //     });
//   //   }
//   // }
//   Future<void> _loadData() async {
//     final controller = UserMedicalDataController();
//     try {
//       final fetchedData = await controller.fetchUserMedicalData();
//       setState(() {
//         data = fetchedData;
//         isLoading = false;

//         // Tạo danh sách dữ liệu từ dataPercent
//         if (data?.dataPercent != null) {
//           List<Map<String, dynamic>> dataPercentList =
//               data!.dataPercent!.entries.map((entry) {
//                 return {'Chỉ số': entry.key, 'Giá trị': entry.value};
//               }).toList();

//           // In ra danh sách
//           print('Data Percent List: $dataPercentList');
//         }
//       });
//     } catch (e) {
//       print('Lỗi: $e');
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   List<double> _getRadarDataFromIndicator(IndicatorModel indicator) {
//     return [
//       indicator.clinicalIndicator.percent.toDouble(),
//       indicator.molecularIndicator.percent.toDouble(),
//       indicator.subclinicalIndicator.percent.toDouble(),
//       indicator.clinicalIndicator.trueCount.toDouble(),
//       indicator.molecularIndicator.trueCount.toDouble(),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final radarData =
//         indicatorData == null
//             ? <List<num>>[[]]
//             : <List<num>>[_getRadarDataFromIndicator(indicatorData!)];

//     final piePositive = (indicatorData?.percent ?? 0).toDouble();
//     final pieNegative = (100 - piePositive).toDouble();

//     return Scaffold(
//       appBar: AppBar(title: Text('Biểu đồ nguy cơ đột quỵ & Radar')),
//       body:
//           isLoading
//               ? Center(child: CircularProgressIndicator())
//               : indicatorData == null
//               ? Center(child: Text("Không có dữ liệu"))
//               : SingleChildScrollView(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Biểu đồ tròn
//                     SizedBox(
//                       height: 300,
//                       child: PieChart(
//                         PieChartData(
//                           sections: [
//                             PieChartSectionData(
//                               value: piePositive,
//                               color: Colors.red,
//                               radius: 55,
//                               title: '${piePositive.toStringAsFixed(0)}%',
//                               titleStyle: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             PieChartSectionData(
//                               value: pieNegative,
//                               color: Colors.blue,
//                               radius: 50,
//                               title: '${pieNegative.toStringAsFixed(0)}%',
//                               titleStyle: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Container(width: 20, height: 20, color: Colors.red),
//                         SizedBox(width: 10),
//                         Text('NGUY CƠ ĐỘT QUỴ'),
//                         SizedBox(width: 20),
//                         Container(width: 20, height: 20, color: Colors.blue),
//                         SizedBox(width: 10),
//                         Text('ÂM TÍNH'),
//                       ],
//                     ),
//                     SizedBox(height: 30),

//                     // Biểu đồ radar
//                     SizedBox(
//                       height: 300,
//                       child: radar_chart.RadarChart.light(
//                         ticks: [20, 40, 60, 80, 100],
//                         features: [
//                           'PH',
//                           'SPO2',
//                           'NHIỆT ĐỘ',
//                           'MẠCH ĐẬP',
//                           'HUYẾT ÁP',
//                         ],
//                         data: dataPercentList,
//                         reverseAxis: false,
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     _buildDayButtons(),
//                   ],
//                 ),
//               ),
//     );
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
//               // TODO: Gọi API lại nếu cần dữ liệu trung bình
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
//             onPressed: () async {
//               setState(() {
//                 selectedDayIndex = index;
//                 isLoading = true;
//               });

//               final controller = UserMedicalDataService();
//               final result = await controller.fetchIndicatorDataForDay(
//                 2,
//                 index + 1,
//               );

//               setState(() {
//                 indicatorData = result;
//                 isLoading = false;
//               });
//             },
//             child: Text('${index + 1}'),
//           );
//         }),
//       ],
//     );
//   }
// }
import 'package:assistantstroke/controler/device_list_controller.dart';
import 'package:assistantstroke/controler/indicators_controller.dart';
import 'package:assistantstroke/controler/usermedicaldatas_controller.dart';
import 'package:assistantstroke/model/UserMedicalDataResponse.dart';
import 'package:assistantstroke/model/indicatorModel.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart' as radar_chart;

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int? selectedDayIndex;
  IndicatorModel? indicatorData;
  bool isLoading = true;
  UserMedicalDataResponse? data;

  // Biến để lưu dataPercentList
  List<Map<String, dynamic>> dataPercentList = [];

  @override
  void initState() {
    super.initState();
    _loadIndicatorData();
  }

  void _loadIndicatorData() async {
    final controller = IndicatorController();
    final result = await controller.fetchIndicatorData();

    setState(() {
      indicatorData = result;
      isLoading = false;
      _loadData();
    });
  }

  double? temperature;
  double? spO2;
  double? heartRate;
  double? bloodPh;
  double? systolicPressure;
  double? diastolicPressure;

  Future<void> _loadData() async {
    final deviceController = DeviceController();
    final devices = await deviceController.getDevices();
    final controller = UserMedicalDataController();
    if (devices.isNotEmpty) {
      final deviceId =
          devices.first.deviceId; // hoặc chọn thiết bị khác theo logic bạn muốn
      final medicalController = UserMedicalDataController();

      // dùng data tiếp theo...

      try {
        final fetchedData = await controller.fetchUserMedicalData(deviceId);
        setState(() {
          data = fetchedData;
          isLoading = false;

          if (data?.dataPercent != null) {
            // Lưu từng giá trị vào các biến riêng biệt
            temperature = data!.dataPercent!['temperature'];
            spO2 = data!.dataPercent!['spO2'];
            heartRate = data!.dataPercent!['heartRate'];
            bloodPh = data!.dataPercent!['bloodPh'];
            systolicPressure = data!.dataPercent!['systolicPressure'];
            diastolicPressure = data!.dataPercent!['diastolicPressure'];

            // Assign values to a list or process them as needed
            final radarValues = [
              temperature,
              spO2,
              heartRate,
              bloodPh,
              systolicPressure,
              diastolicPressure,
            ];
          }
        });
      } catch (e) {
        print('Lỗi: $e');
        setState(() {
          isLoading = false;
        });
      }
    } else {
      print('Không có thiết bị nào được tìm thấy.');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Lấy dữ liệu radar từ indicatorData
    final radarValues = [
      temperature ?? 0.0,
      spO2 ?? 0.0,
      heartRate ?? 0.0,
      bloodPh ?? 0.0,
      systolicPressure ?? 0.0,
      diastolicPressure ?? 0.0,
    ];
    print('Radar Values: $radarValues');
    final piePositive = (indicatorData?.percent ?? 0).toDouble();
    final pieNegative = (100 - piePositive).toDouble();

    return Scaffold(
      appBar: AppBar(title: Text('Biểu đồ nguy cơ đột quỵ & Radar')),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : indicatorData == null
              ? Center(child: Text("Không có dữ liệu"))
              : SingleChildScrollView(
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
                        ticks: [0, 1, 2, 3, 4],
                        features: [
                          'NHIỆT ĐỘ',
                          'SPO2',
                          'MẠCH ĐẬP',
                          'PH',
                          'HUYẾT ÁP',
                        ],
                        data: [radarValues],

                        reverseAxis: false,
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
