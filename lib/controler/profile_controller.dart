import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:assistantstroke/services/api_service.dart';

class ProfileController {
  Future<int?> _getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId'); // Lấy userId thay vì token
  }

  Future<Map<String, dynamic>?> fetchUserData(BuildContext context) async {
    int? userId = await _getUserId();
    if (userId == null) {
      print('🚨 Không tìm thấy userId! Người dùng chưa đăng nhập.');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Vui lòng đăng nhập lại.')));
      return null;
    }

    final String url = "${ApiEndpoints.profile}/$userId"; // Gọi API bằng userId

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('⚠️ Lỗi khi gọi API: ${response.statusCode}');
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Lỗi khi gọi API!')));
      }
    } catch (error) {
      print('🚨 Lỗi kết nối API: $error');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Không thể kết nối tới server!')));
    }

    return null;
  }
}
