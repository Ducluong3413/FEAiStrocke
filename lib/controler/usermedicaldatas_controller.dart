import 'dart:convert';
import 'package:assistantstroke/model/UserMedicalDataResponse.dart';
import 'package:http/http.dart' as http;

class UserMedicalDataController {
  Future<UserMedicalDataResponse> fetchUserMedicalData() async {
    final url = Uri.parse(
      'http://localhost:5062/api/UserMedicalDatas/average-daily-night-last-14-days/2',
    );

    final response = await http.get(url);
    print('Status: ${response.statusCode}');
    print('Body: ${response.body}');

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return UserMedicalDataResponse.fromJson(jsonData);
    } else {
      throw Exception('Lỗi khi tải dữ liệu: ${response.statusCode}');
    }
  }
}
