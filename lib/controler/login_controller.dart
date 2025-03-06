import 'dart:convert';
import 'package:assistantstroke/page/main_home/home_navbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  late SharedPreferences prefs;
  final String username;
  final String password;

  // Constructor nhận username và password
  LoginController({required this.username, required this.password});

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance(); // Lấy SharedPreferences
  }

  Future<void> login(BuildContext context) async {
    await init(); // Đảm bảo SharedPreferences được khởi tạo
    final String url = 'http://localhost:5062/api/User/login';

    try {
      print('🔄 Đang gửi request đăng nhập với: $username / $password');

      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({'username': username, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      print('🔍 Response Code: ${response.statusCode}');
      print('📩 Response Body: ${response.body}');

      if (response.statusCode == 200) {
        try {
          print('✅ Đăng nhập thành công');

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeNavbar()),
          );
          // final responseData = jsonDecode(response.body);
          // print('🔍 Response Code: ${response.statusCode}');

          // if (responseData is Map<String, dynamic> &&
          //     responseData.containsKey('token')) {
          //   final String token = responseData['token'];
          //   await prefs.setString('token', token);
          //   print('✅ Đăng nhập thành công, token: $token');

          //   Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(builder: (context) => HomeNavbar()),
          //   );
          // } else {
          //   print('⚠️ API không trả về token hợp lệ!');
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text('API không trả về token hợp lệ!')),
          //   );
          // }
        } catch (e) {
          print('❌ Lỗi khi decode JSON: $e');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Lỗi xử lý phản hồi từ server!')),
          );
        }
      } else if (response.statusCode == 401) {
        print('❌ Sai tài khoản hoặc mật khẩu!');
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Sai tài khoản hoặc mật khẩu!')));
      } else {
        print('⚠️ Lỗi không xác định! Status Code: ${response.statusCode}');
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Lỗi máy chủ, thử lại sau!')));
      }
    } catch (error) {
      print('🚨 Lỗi kết nối API: $error');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Không thể kết nối tới server!')));
    }
  }
}
