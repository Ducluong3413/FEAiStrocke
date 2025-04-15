import 'dart:convert';

import 'package:assistantstroke/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ForgotController {
  late SharedPreferences prefs;
  final String email;

  // Constructor nhận username và password
  ForgotController({required this.email});
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance(); // Lấy SharedPreferences
  }

  Future<bool> forgot(BuildContext context) async {
    await init();
    final String url = ApiEndpoints.forgot;

    try {
      print('🔄 Đang gửi request với: $email');

      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({'email': email}),
        headers: {'Content-Type': 'application/json'},
      );

      print('🔍 Response Code: ${response.statusCode}');
      print('📩 Response Body: ${response.body}');

      if (response.statusCode == 200) {
        print('✅ Gửi thành công');
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Đã gửi OTP tới email.')));
        return true;
      } else if (response.statusCode == 401) {
        print('❌ Sai email!');
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Email không tồn tại!')));
        return false;
      } else {
        print('⚠️ Lỗi không xác định!');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Lỗi máy chủ, thử lại sau!')),
        );
        return false;
      }
    } catch (error) {
      print('🚨 Lỗi kết nối API: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Không thể kết nối tới server!')),
      );
      return false;
    }
  }
}
