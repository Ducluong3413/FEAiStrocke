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
  // static const String baseUrl = "http://137.59.106.46:5000/api"; //iphone
  // static const String baseUrl =
  //     "http://10.0.2.2:5062/api"; // Nếu chạy trên Android Emulator
  static const String chatbot =
      "https://workflow.makeai.vn/webhook/9f8e4a1a-3c19-48e1-ad90-f1efed1d7dce/chat"; //iphone

  // Auth
  static const String login = "$baseUrl/User/login";
  static const String register = "$baseUrl/User/register";
  static const String verifyOtp = "$baseUrl/User/verifyOtp";
  static const String profile = "$baseUrl/User/users";
  static const String forgot = "$baseUrl/User/forgot-password";
  static const String commit = "$baseUrl/User/reset-password";
  static const String change = "$baseUrl/User/change-password";
  static const String update_basic_info = "$baseUrl/User/update-basic-info";
  // User
  static const String getUserProfile = "$baseUrl/User/profile";
  static const String updateUserProfile = "$baseUrl/User/update";

  static const String averageAll14Day =
      "$baseUrl/UserMedicalDatas/average-daily-night-last-14-days/";
  //Indicator
  static const String indicator =
      "$baseUrl/Indicators/get-percent-indicator-is-true";
  static const String symptom = "$baseUrl/Indicators/add-clinical-indicator";
  static const String create_invitation = "$baseUrl/Invition/create-invitation";
  static const String use_invitation = "$baseUrl/Invition/use-invitation";
  static const String get_elationship = "$baseUrl/Invition/get-relationship";
  static const String delete_relationship =
      "$baseUrl/Invition/delete-relationship";
  //device
  static const String get_devices = "$baseUrl/Devices/get-devices";
  static const String delete_devices = "$baseUrl/Devices/delete-device";

  // Example thêm endpoint khác
  static const String getPosts = "$baseUrl/Posts";
}
