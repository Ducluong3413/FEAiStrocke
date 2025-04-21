import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:assistantstroke/model/indicatorModel.dart';

class UserMedicalDataService {
  final String baseUrl;

  UserMedicalDataService({this.baseUrl = 'http://localhost:5062'});

  Future<IndicatorModel> fetchIndicatorDataForDay(
    int userId,
    int dayIndex,
  ) async {
    try {
      final url = Uri.parse(
        '$baseUrl/api/UserMedicalDatas/average-daily-night-last-14-days/$userId',
      );
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final dayData = data['result'][dayIndex - 1];
        return IndicatorModel.fromJson(dayData);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data for day $dayIndex: $e');
      rethrow;
    }
  }
}
