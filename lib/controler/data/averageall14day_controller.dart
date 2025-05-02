import 'package:assistantstroke/model/averageall14daynew.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<AverageAll14Day?> fetchAverageAll14Day() async {
    var client = http.Client();
    var uri = Uri.parse(
      'http://localhost:5062/api/UserMedicalDatas/average-daily-night-last-14-days/5',
    );
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      var data = averageAll14DayFromJson(jsonString); // Phân tích dữ liệu JSON
      return data; // Trả về toàn bộ AverageAll14Day
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Warning>?> fetchWarnings() async {
    var client = http.Client();
    var uri = Uri.parse(
      'http://localhost:5062/api/UserMedicalDatas/average-daily-night-last-14-days/5',
    );
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      var data = averageAll14DayFromJson(jsonString); // Phân tích dữ liệu JSON
      return data.warning; // Trả về phần Warning
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Result>?> fetchResults(int devices) async {
    var client = http.Client();
    var uri = Uri.parse(
      'http://localhost:5062/api/UserMedicalDatas/average-daily-night-last-14-days/$devices',
    );
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      var data = averageAll14DayFromJson(jsonString); // Phân tích dữ liệu JSON
      var dailyAverage =
          data.result
              .map((e) => e.dailyAverage)
              .toList(); // Lấy danh sách dailyAverage từ kết quả
      var nightlyAverage =
          data.result
              .map((e) => e.nightlyAverage)
              .toList(); // Lấy danh sách nightlyAverage từ kết quả
      var allDayAverage =
          data.result
              .map((e) => e.allDayAverage)
              .toList(); // Lấy danh sách allDayAverage từ kết quả
      print(data.result);

      return data.result; // Trả về phần Result
    } else {
      throw Exception('Failed to load data');
    }
  }
}
