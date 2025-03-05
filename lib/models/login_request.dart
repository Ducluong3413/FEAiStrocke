// class LoginRequest {
//   final String email;
//   final String password;

//   LoginRequest({required this.email, required this.password});

//   Map<String, dynamic> toJson() {
//     return {
//       'email': email,
//       'password': password,
//     };
//   }
// }
class LoginRequest {
  final String username;
  final String password;

  LoginRequest({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'Username': username, // Đảm bảo đúng key theo API
      'Password': password,
    };
  }

  @override
  String toString() {
    return 'Login(Username: $username, Password: $password)';
  }
}
