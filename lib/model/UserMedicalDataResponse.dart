// import 'dart:convert';

// import 'package:assistantstroke/model/indicatorModel.dart';
// import 'package:http/http.dart' as http;

// class UserMedicalDataResponse {
//   final Map<String, double>? averageAll14Day;
//   final Map<String, double>? dataPercent;
//   final List<Map<String, String>>? warning;
//   final List<ResultData>? result;
//   final Map<String, List<double>>? clinicalIndicator;
//   final Map<String, List<double>>? subclinicalIndicator;
//   final Map<String, List<double>>? molecularIndicator;

//   UserMedicalDataResponse({
//     this.averageAll14Day,
//     this.dataPercent,
//     this.warning,
//     this.result,
//     this.clinicalIndicator,
//     this.subclinicalIndicator,
//     this.molecularIndicator,
//   });
//   Future<IndicatorModel> fetchIndicatorDataForDay(int dayIndex) async {
//     try {
//       final url = Uri.parse(
//         'http://localhost:5062/api/UserMedicalDatas/average-daily-night-last-14-days/2',
//       );
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);

//         // Lấy dữ liệu cho ngày chỉ định (dayIndex)
//         var dayData =
//             data['result'][dayIndex - 1]; // Lấy dữ liệu cho ngày dayIndex

//         // Chuyển đổi dữ liệu trả về thành đối tượng IndicatorModel
//         return IndicatorModel.fromJson(dayData);
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       print('Error fetching data for day $dayIndex: $e');
//       rethrow;
//     }
//   }

//   factory UserMedicalDataResponse.fromJson(Map<String, dynamic> json) {
//     return UserMedicalDataResponse(
//       averageAll14Day: (json['averageAll14Day'] as Map<String, dynamic>?)?.map(
//         (key, value) => MapEntry(key, value.toDouble()),
//       ),
//       dataPercent: (json['dataPercent'] as Map<String, dynamic>?)?.map(
//         (key, value) => MapEntry(key, value.toDouble()),
//       ),
//       warning:
//           (json['warning'] as List?)
//               ?.map((item) => Map<String, String>.from(item as Map))
//               .toList(),
//       result:
//           (json['result'] as List?)
//               ?.map((item) => ResultData.fromJson(item))
//               .toList(),
//       clinicalIndicator: (json['clinicalIndicator']
//               as Map<String, dynamic>?) // Parsing clinicalIndicator
//           ?.map((key, value) => MapEntry(key, List<double>.from(value))),
//       subclinicalIndicator: (json['subclinicalIndicator']
//               as Map<String, dynamic>?) // Parsing subclinicalIndicator
//           ?.map((key, value) => MapEntry(key, List<double>.from(value))),
//       molecularIndicator: (json['molecularIndicator']
//               as Map<String, dynamic>?) // Parsing molecularIndicator
//           ?.map((key, value) => MapEntry(key, List<double>.from(value))),
//     );
//   }
// }

// class ResultData {
//   final String date;
//   final AverageData? allDayAverage;
//   final AverageData? dailyAverage;
//   final AverageData? nightlyAverage;

//   ResultData({
//     required this.date,
//     this.allDayAverage,
//     this.dailyAverage,
//     this.nightlyAverage,
//   });

//   factory ResultData.fromJson(Map<String, dynamic> json) {
//     return ResultData(
//       date: json['date'],
//       allDayAverage:
//           json['allDayAverage'] != null
//               ? AverageData.fromJson(json['allDayAverage'])
//               : null,
//       dailyAverage:
//           json['dailyAverage'] != null
//               ? AverageData.fromJson(json['dailyAverage'])
//               : null,
//       nightlyAverage:
//           json['nightlyAverage'] != null
//               ? AverageData.fromJson(json['nightlyAverage'])
//               : null,
//     );
//   }
// }

// class AverageData {
//   final double? averageTemperature;
//   final double? averageSpO2;
//   final double? averageHeartRate;
//   final double? averageBloodPh;
//   final double? averageSystolicPressure;
//   final double? averageDiastolicPressure;

//   AverageData({
//     this.averageTemperature,
//     this.averageSpO2,
//     this.averageHeartRate,
//     this.averageBloodPh,
//     this.averageSystolicPressure,
//     this.averageDiastolicPressure,
//   });

//   factory AverageData.fromJson(Map<String, dynamic> json) {
//     return AverageData(
//       averageTemperature: json['averageTemperature']?.toDouble(),
//       averageSpO2: json['averageSpO2']?.toDouble(),
//       averageHeartRate: json['averageHeartRate']?.toDouble(),
//       averageBloodPh: json['averageBloodPh']?.toDouble(),
//       averageSystolicPressure: json['averageSystolicPressure']?.toDouble(),
//       averageDiastolicPressure: json['averageDiastolicPressure']?.toDouble(),
//     );
//   }
// }

// void printMedicalData(UserMedicalDataResponse data) {
//   List<ResultData>? resultList = data.result;

//   if (resultList != null) {
//     for (var item in resultList) {
//       print("Ngày: ${item.date}");

//       print(
//         "  🌞 Trung bình cả ngày: ${item.allDayAverage?.averageTemperature}",
//       );
//       print("  🌅 Ban ngày: ${item.dailyAverage?.averageTemperature}");
//       print("  🌙 Ban đêm: ${item.nightlyAverage?.averageTemperature}");
//     }
//   }
// }

// void readAverageTemperature(UserMedicalDataResponse data) {
//   // Lấy toàn bộ map
//   Map<String, double>? tempMap = data.averageAll14Day;

//   // In tất cả key-value
//   tempMap?.forEach((key, value) {
//     print("Ngày: $key - Nhiệt độ trung bình: $value");
//   });

//   // Hoặc lấy một ngày cụ thể
//   double? temp = tempMap?['2025-04-20'];
//   print("Nhiệt độ ngày 2025-04-20: $temp");
// }

// void readIndicators(UserMedicalDataResponse data) {
//   var clinical = data.clinicalIndicator;

//   clinical?.forEach((key, value) {
//     print("Clinical indicator: $key");
//     print("Giá trị: $value");
//   });

//   var bloodPhList = clinical?['bloodPh']; // danh sách giá trị chỉ số này
//   print("Các giá trị pH máu: $bloodPhList");
// }

// void readWarnings(UserMedicalDataResponse data) {
//   List<Map<String, String>>? warnings = data.warning;

//   warnings?.forEach((warning) {
//     print("Warning:");
//     warning.forEach((key, value) {
//       print("  $key: $value");
//     });
//   });
// }

// import 'dart:convert';

// class UserMedicalDataResponse {
//   final AverageAll14Day? averageAll14Day;
//   final Map<String, double>? dataPercent;
//   final List<Warning>? warning;
//   final List<ResultData>? result;
//   final Map<String, List<double>>? clinicalIndicator;
//   final Map<String, List<double>>? subclinicalIndicator;
//   final Map<String, List<double>>? molecularIndicator;

//   UserMedicalDataResponse({
//     this.averageAll14Day,
//     this.dataPercent,
//     this.warning,
//     this.result,
//     this.clinicalIndicator,
//     this.subclinicalIndicator,
//     this.molecularIndicator,
//   });

//   factory UserMedicalDataResponse.fromJson(Map<String, dynamic> json) {
//     return UserMedicalDataResponse(
//       averageAll14Day:
//           json['averageAll14Day'] != null
//               ? AverageAll14Day.fromJson(json['averageAll14Day'])
//               : null,
//       dataPercent: (json['dataPercent'] as Map<String, dynamic>?)?.map(
//         (key, value) => MapEntry(key, value.toDouble()),
//       ),
//       warning:
//           (json['warning'] as List?)
//               ?.map((item) => Warning.fromJson(item))
//               .toList(),
//       result:
//           (json['result'] as List?)
//               ?.map((item) => ResultData.fromJson(item))
//               .toList(),
//       clinicalIndicator: (json['clinicalIndicator'] as Map<String, dynamic>?)
//           ?.map((key, value) => MapEntry(key, List<double>.from(value))),
//       subclinicalIndicator: (json['subclinicalIndicator']
//               as Map<String, dynamic>?)
//           ?.map((key, value) => MapEntry(key, List<double>.from(value))),
//       molecularIndicator: (json['molecularIndicator'] as Map<String, dynamic>?)
//           ?.map((key, value) => MapEntry(key, List<double>.from(value))),
//     );
//   }
// }

// class AverageAll14Day {
//   final double temperature;
//   final double spO2;
//   final double heartRate;
//   final double bloodPh;
//   final double systolicPressure;
//   final double diastolicPressure;

//   AverageAll14Day({
//     required this.temperature,
//     required this.spO2,
//     required this.heartRate,
//     required this.bloodPh,
//     required this.systolicPressure,
//     required this.diastolicPressure,
//   });

//   factory AverageAll14Day.fromJson(Map<String, dynamic> json) {
//     return AverageAll14Day(
//       temperature: (json['temperature'] ?? 0).toDouble(),
//       spO2: (json['spO2'] ?? 0).toDouble(),
//       heartRate: (json['heartRate'] ?? 0).toDouble(),
//       bloodPh: (json['bloodPh'] ?? 0).toDouble(),
//       systolicPressure: (json['systolicPressure'] ?? 0).toDouble(),
//       diastolicPressure: (json['diastolicPressure'] ?? 0).toDouble(),
//     );
//   }
// }

// class Warning {
//   final String temperature;
//   final String spO2;
//   final String heartRate;
//   final String bloodPh;
//   final String systolicPressure;
//   final String diastolicPressure;

//   Warning({
//     required this.temperature,
//     required this.spO2,
//     required this.heartRate,
//     required this.bloodPh,
//     required this.systolicPressure,
//     required this.diastolicPressure,
//   });

//   factory Warning.fromJson(Map<String, dynamic> json) {
//     return Warning(
//       temperature: json['temperature'],
//       spO2: json['spO2'],
//       heartRate: json['heartRate'],
//       bloodPh: json['bloodPh'],
//       systolicPressure: json['systolicPressure'],
//       diastolicPressure: json['diastolicPressure'],
//     );
//   }
// }

// class ResultData {
//   final String date;
//   final AverageData? allDayAverage;
//   final AverageData? dailyAverage;
//   final AverageData? nightlyAverage;

//   ResultData({
//     required this.date,
//     this.allDayAverage,
//     this.dailyAverage,
//     this.nightlyAverage,
//   });

//   factory ResultData.fromJson(Map<String, dynamic> json) {
//     return ResultData(
//       date: json['date'],
//       allDayAverage:
//           json['allDayAverage'] != null
//               ? AverageData.fromJson(json['allDayAverage'])
//               : null,
//       dailyAverage:
//           json['dailyAverage'] != null
//               ? AverageData.fromJson(json['dailyAverage'])
//               : null,
//       nightlyAverage:
//           json['nightlyAverage'] != null
//               ? AverageData.fromJson(json['nightlyAverage'])
//               : null,
//     );
//   }
// }

// class AverageData {
//   final double? averageTemperature;
//   final double? averageSpO2;
//   final double? averageHeartRate;
//   final double? averageBloodPh;
//   final double? averageSystolicPressure;
//   final double? averageDiastolicPressure;

//   AverageData({
//     this.averageTemperature,
//     this.averageSpO2,
//     this.averageHeartRate,
//     this.averageBloodPh,
//     this.averageSystolicPressure,
//     this.averageDiastolicPressure,
//   });

//   factory AverageData.fromJson(Map<String, dynamic> json) {
//     return AverageData(
//       averageTemperature: json['averageTemperature']?.toDouble(),
//       averageSpO2: json['averageSpO2']?.toDouble(),
//       averageHeartRate: json['averageHeartRate']?.toDouble(),
//       averageBloodPh: json['averageBloodPh']?.toDouble(),
//       averageSystolicPressure: json['averageSystolicPressure']?.toDouble(),
//       averageDiastolicPressure: json['averageDiastolicPressure']?.toDouble(),
//     );
//   }
// }
class AverageAll14Day {
  final double temperature;
  final double spO2;
  final double heartRate;
  final double bloodPh;
  final double systolicPressure;
  final double diastolicPressure;

  AverageAll14Day({
    required this.temperature,
    required this.spO2,
    required this.heartRate,
    required this.bloodPh,
    required this.systolicPressure,
    required this.diastolicPressure,
  });

  factory AverageAll14Day.fromJson(Map<String, dynamic> json) {
    return AverageAll14Day(
      temperature: (json['averageTemperature'] ?? 0).toDouble(),
      spO2: (json['averageSpO2'] ?? 0).toDouble(),
      heartRate: (json['averageHeartRate'] ?? 0).toDouble(),
      bloodPh: (json['averageBloodPh'] ?? 0).toDouble(),
      systolicPressure: (json['averageSystolicPressure'] ?? 0).toDouble(),
      diastolicPressure: (json['averageDiastolicPressure'] ?? 0).toDouble(),
    );
  }
}

class UserMedicalDataResponse {
  final AverageAll14Day? averageAll14Day;
  final Map<String, double>? dataPercent;
  final List<Warning>? warning;
  final List<ResultData>? result;
  // final Map<String, List<double>>? clinicalIndicator;
  // final Map<String, List<double>>? subclinicalIndicator;
  // final Map<String, List<double>>? molecularIndicator;

  UserMedicalDataResponse({
    this.averageAll14Day,
    this.dataPercent,
    this.warning,
    this.result,
    // this.clinicalIndicator,
    // this.subclinicalIndicator,
    // this.molecularIndicator,
  });

  factory UserMedicalDataResponse.fromJson(Map<String, dynamic> json) {
    return UserMedicalDataResponse(
      averageAll14Day:
          json['averageAll14Day'] != null
              ? AverageAll14Day.fromJson(json['averageAll14Day'])
              : AverageAll14Day(
                temperature: 0,
                spO2: 0,
                heartRate: 0,
                bloodPh: 0,
                systolicPressure: 0,
                diastolicPressure: 0,
              ),
      dataPercent: (json['dataPercent'] as Map<String, dynamic>?)?.map(
        (key, value) => MapEntry(key, (value ?? 0).toDouble()),
      ),
      warning:
          (json['warning'] as List?)
              ?.map((item) => Warning.fromJson(item))
              .toList(),
      result:
          (json['result'] as List?)
              ?.map((item) => ResultData.fromJson(item))
              .toList(),
      // clinicalIndicator: (json['clinicalIndicator'] as Map<String, dynamic>?)
      //     ?.map((key, value) => MapEntry(key, List<double>.from(value ?? []))),
      // subclinicalIndicator: (json['subclinicalIndicator']
      //         as Map<String, dynamic>?)
      //     ?.map((key, value) => MapEntry(key, List<double>.from(value ?? []))),
      // molecularIndicator: (json['molecularIndicator'] as Map<String, dynamic>?)
      //     ?.map((key, value) => MapEntry(key, List<double>.from(value ?? []))),
    );
  }
}

class Warning {
  final String temperature;
  final String spO2;
  final String heartRate;
  final String bloodPh;
  final String systolicPressure;
  final String diastolicPressure;

  Warning({
    required this.temperature,
    required this.spO2,
    required this.heartRate,
    required this.bloodPh,
    required this.systolicPressure,
    required this.diastolicPressure,
  });

  factory Warning.fromJson(Map<String, dynamic> json) {
    return Warning(
      temperature: json['temperature'] ?? '0',
      spO2: json['spO2'] ?? '0',
      heartRate: json['heartRate'] ?? '0',
      bloodPh: json['bloodPh'] ?? '0',
      systolicPressure: json['systolicPressure'] ?? '0',
      diastolicPressure: json['diastolicPressure'] ?? '0',
    );
  }
}

class ResultData {
  final String date;
  final AverageData? allDayAverage;
  final AverageData? dailyAverage;
  final AverageData? nightlyAverage;

  ResultData({
    required this.date,
    this.allDayAverage,
    this.dailyAverage,
    this.nightlyAverage,
  });

  factory ResultData.fromJson(Map<String, dynamic> json) {
    return ResultData(
      date: json['date'],
      allDayAverage:
          json['allDayAverage'] != null
              ? AverageData.fromJson(json['allDayAverage'])
              : AverageData(
                averageTemperature: 0,
                averageSpO2: 0,
                averageHeartRate: 0,
                averageBloodPh: 0,
                averageSystolicPressure: 0,
                averageDiastolicPressure: 0,
              ),
      dailyAverage:
          json['dailyAverage'] != null
              ? AverageData.fromJson(json['dailyAverage'])
              : AverageData(
                averageTemperature: 0,
                averageSpO2: 0,
                averageHeartRate: 0,
                averageBloodPh: 0,
                averageSystolicPressure: 0,
                averageDiastolicPressure: 0,
              ),
      nightlyAverage:
          json['nightlyAverage'] != null
              ? AverageData.fromJson(json['nightlyAverage'])
              : AverageData(
                averageTemperature: 0,
                averageSpO2: 0,
                averageHeartRate: 0,
                averageBloodPh: 0,
                averageSystolicPressure: 0,
                averageDiastolicPressure: 0,
              ),
    );
  }
}

class AverageData {
  final double averageTemperature;
  final double averageSpO2;
  final double averageHeartRate;
  final double averageBloodPh;
  final double averageSystolicPressure;
  final double averageDiastolicPressure;

  AverageData({
    required this.averageTemperature,
    required this.averageSpO2,
    required this.averageHeartRate,
    required this.averageBloodPh,
    required this.averageSystolicPressure,
    required this.averageDiastolicPressure,
  });

  factory AverageData.fromJson(Map<String, dynamic> json) {
    return AverageData(
      averageTemperature: (json['averageTemperature'] ?? 0).toDouble(),
      averageSpO2: (json['averageSpO2'] ?? 0).toDouble(),
      averageHeartRate: (json['averageHeartRate'] ?? 0).toDouble(),
      averageBloodPh: (json['averageBloodPh'] ?? 0).toDouble(),
      averageSystolicPressure:
          (json['averageSystolicPressure'] ?? 0).toDouble(),
      averageDiastolicPressure:
          (json['averageDiastolicPressure'] ?? 0).toDouble(),
    );
  }
}
