import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class DeviceController {
  static Future<void> submitDeviceInfo({
    required BuildContext context,
    required String deviceName,
    required String deviceType,
    required String series,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');

    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User ID không tồn tại trong SharedPreferences'),
        ),
      );
      return;
    }

    final data = {
      'userId': userId,
      'deviceName': deviceName,
      'deviceType': deviceType,
      'series': series,
    };

    try {
      final response = await http.post(
        Uri.parse('http://localhost:5062/api/Devices/add-device'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gửi thông tin thiết bị thành công')),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Lỗi: ${response.statusCode}')));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Lỗi kết nối: $e')));
    }
  }
}
