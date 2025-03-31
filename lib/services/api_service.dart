// // import 'dart:convert';
// // import 'package:http/http.dart' as http;
// // import '../models/login_request.dart';

// // class ApiService {
// //   static const String baseUrl = 'http://localhost:5062/api/User/login';

// //   Future<bool> login(LoginRequest request) async {
// //     final response = await http.post(
// //       Uri.parse('$baseUrl/login'),
// //       headers: {'Content-Type': 'application/json'},
// //       body: jsonEncode(request.toJson()),
// //     );

// //     if (response.statusCode == 200) {
// //       // Nếu đăng nhập thành công
// //       return true;
// //     } else {
// //       // Nếu thất bại
// //       return false;
// //     }
// //   }
// // }
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/login_request.dart';

// class ApiService {
//   static const String baseUrl = 'http://localhost:5062/api/User/login';
//   // static const String baseUrl = 'http://localhost:5062/api/User';

//   Future<bool> login(LoginRequest request) async {
//     final response = await http.post(
//       Uri.parse(baseUrl), // ✅ Sửa lỗi URL
//       // headers: {'Content-Type': 'application/json'},
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(request.toJson()), // ✅ Đảm bảo `toJson()` đúng
//     );

//     if (response.statusCode == 200) {
//       print("✅ Đăng nhập thành công: ${response.body}");
//       return true;
//     } else {
//       print("❌ Đăng nhập thất bại: ${response.statusCode} - ${response.body}");
//       return false;
//     }
//   }
// }

class ApiEndpoints {
  // static const String baseUrl = "http://localhost:5062/api";
  static const String baseUrl = "http://localhost:5062/api"; //iphone
  // static const String baseUrl =
  //     "http://10.0.2.2:5062/api"; // Nếu chạy trên Android Emulator

  // Auth
  static const String login = "$baseUrl/User/login";
  static const String register = "$baseUrl/User/register";
  static const String verifyOtp = "$baseUrl/User/verifyOtp";
  static const String profile = "$baseUrl/User/users";
  // User
  static const String getUserProfile = "$baseUrl/User/profile";
  static const String updateUserProfile = "$baseUrl/User/update";

  // Example thêm endpoint khác
  static const String getPosts = "$baseUrl/Posts";
}
