import 'dart:convert';

import 'package:assistantstroke/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignController {
  late SharedPreferences prefs;

  final String username;
  final String password;
  final String email;
  final String phone;
  final String dob;
  final String sex;

  SignController({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.dob,
    required this.sex,
  });

  // bool _isLoading = false;
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance(); // Lấy SharedPreferences
  }

  // Future<void> sign(BuildContext context) async {
  //   await init();
  //   final String url = ApiEndpoints.register;

  //   try {
  //     print(
  //       '🔄 Đang gửi request đăng nhập với: $username / $password /$sex / $dob / $email / $phone ',
  //     );
  //     // Chuyển đổi DateOfBirth thành đúng định dạng
  //     DateTime parsedDob = DateTime.parse(
  //       dob,
  //     ); // Yêu cầu định dạng "YYYY-MM-DD"
  //     // String formattedDob =
  //     //     parsedDob.toIso8601String(); // Chuyển về chuẩn ISO 8601
  //     print(parsedDob);
  //     final response = await http.post(
  //       Uri.parse(url),
  //       body: jsonEncode({
  //         // "Username": "admin",
  //         // "PatientName": username,
  //         // "Email": email,
  //         // "Role": "Patient",
  //         // "Phone": phone,
  //         // "Password": password,
  //         // "DateOfBirth": dob,
  //         // "Gender": true,

  //         // "Username": "admin123",
  //         // "Password": password,
  //         // "Role": "Patient",
  //         // "Patient": {
  //         //   "PatientName": username,
  //         //   "DateOfBirth": parsedDob,
  //         //   "Gender": true,
  //         //   "Phone": phone,
  //         //   "Email": email,
  //         // },

  // "Username": "ducluonng2",
  // "Password": "123456",
  // "Role": "User",
  // "Patient": {
  //   "PatientName": "John Doe",
  //   "DateOfBirth": "1990-07-15",
  //   "Gender": true,
  //   "Phone": "0123456789",
  //   "Email": "johndoe@example.com"
  // }

  //       }),
  //       headers: {'Content-Type': 'application/json'},
  //     );

  //     print('🔍 Response Code: ${response.statusCode}');
  //     print('📩 Response Body: ${response.body}');

  //     if (response.statusCode == 200) {
  //       try {
  //         print('✅ Đăng ký thành công');

  //         // Navigator.pushReplacement(
  //         //   context,
  //         //   MaterialPageRoute(builder: (context) => HomeNavbar()),
  //         // );
  //       } catch (e) {
  //         print('❌ Lỗi khi decode JSON: $e');
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text('Lỗi xử lý phản hồi từ server!')),
  //         );
  //       }
  //     } else if (response.statusCode == 401) {
  //       print('❌ Sai tài khoản hoặc mật khẩu!');
  //       ScaffoldMessenger.of(
  //         context,
  //       ).showSnackBar(SnackBar(content: Text('Sai tài khoản hoặc mật khẩu!')));
  //     } else {
  //       print('⚠️ Lỗi không xác định! Status Code: ${response.statusCode}');
  //       ScaffoldMessenger.of(
  //         context,
  //       ).showSnackBar(SnackBar(content: Text('Lỗi máy chủ, thử lại sau!')));
  //     }
  //   } catch (error) {
  //     print('🚨 Lỗi kết nối API: $error');
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(SnackBar(content: Text('Không thể kết nối tới server!')));
  //   }
  // }

  Future<void> sign(BuildContext context) async {
    await init();
    final String url = ApiEndpoints.register;

    try {
      print(
        '🔄 Đang gửi request đăng ký với: $username / $password / $sex / $dob / $email / $phone ',
      );

      // Chuyển DateOfBirth thành chuỗi yyyy-MM-dd
      String formattedDob = DateTime.parse(dob).toIso8601String().split('T')[0];

      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          "Username": phone,
          "Password": password,
          "Role": "User",
          "Patient": {
            "PatientName": username,
            "DateOfBirth": formattedDob, // Định dạng đúng yyyy-MM-dd
            "Gender":
                sex == "Male", // Nếu sex là "Male" thì true, ngược lại false
            "Phone": phone,
            "Email": email,
          },
        }),
        headers: {'Content-Type': 'application/json'},
      );

      print('🔍 Response Code: ${response.statusCode}');
      print('📩 Response Body: ${response.body}');

      if (response.statusCode == 200) {
        print('✅ Đăng ký thành công');
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
