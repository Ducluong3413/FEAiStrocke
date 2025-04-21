// class AverageData {
//   final double bloodPh;
//   final double spO2;
//   final double temperature;
//   final double heartRate;
//   final double systolicPressure;
//   final double diastolicPressure;

//   AverageData({
//     required this.bloodPh,
//     required this.spO2,
//     required this.temperature,
//     required this.heartRate,
//     required this.systolicPressure,
//     required this.diastolicPressure,
//   });

//   factory AverageData.fromJsonAverageData(Map<String, dynamic> json) {
//     return AverageData(
//       bloodPh: (json['averageBloodPh'] ?? 0).toDouble(),
//       spO2: (json['averageSpo2'] ?? 0).toDouble(),
//       temperature: (json['averageTemperature'] ?? 0).toDouble(),
//       heartRate: (json['averageHeartRate'] ?? 0).toDouble(),
//       systolicPressure: (json['averageSystolicPressure'] ?? 0).toDouble(),
//       diastolicPressure: (json['averageDiastolicPressure'] ?? 0).toDouble(),
//     );
//   }
// }
