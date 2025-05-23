import 'dart:convert';
import 'package:assistantstroke/services/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Device {
  final int deviceId;
  final String deviceName;
  final String deviceType;
  final String series;

  Device({
    required this.deviceId,
    required this.deviceName,
    required this.deviceType,
    required this.series,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      deviceId: json['deviceId'],
      deviceName: json['deviceName'],
      deviceType: json['deviceType'],
      series: json['series'],
    );
  }
}

class DeviceController {
  Future<List<Device>> getDevices() async {
    final baseUrl = ApiEndpoints.get_devices;
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');

    if (userId == null) return [];

    final url = Uri.parse('$baseUrl/$userId');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((e) => Device.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<bool> deleteDevice(int deviceId) async {
    final baseUrl = ApiEndpoints.delete_devices;
    print(deviceId);

    final url = Uri.parse('$baseUrl/$deviceId');
    final res = await http.delete(url);
    print(res.statusCode);
    return res.statusCode == 200;
  }
}
