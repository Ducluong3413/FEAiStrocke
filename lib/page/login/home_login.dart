// import 'package:assistantstroke/page/forget_password/home_forget_password.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class HomeLogin extends StatelessWidget {
//   const HomeLogin({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
//   }
// }

// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 50),
//             const Center(
//               child: Text(
//                 "Log In",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Color.fromARGB(255, 24, 188, 203),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               "Welcome",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 24, 188, 203),
//               ),
//             ),
//             const Text(
//               "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.",
//               style: TextStyle(fontSize: 14, color: Colors.black54),
//             ),
//             const SizedBox(height: 20),
//             const Text("Email or Mobile Number"),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Username',
//                 prefixIcon: Icon(Icons.email),
//                 hintText: "Your Email or Phone Number",
//                 filled: true,
//                 fillColor: const Color.fromARGB(255, 239, 240, 241),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             const Text("Password"),
//             TextField(
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 prefixIcon: Icon(Icons.lock),
//                 suffixIcon: Icon(Icons.visibility_off),
//                 hintText: "Your Password",
//                 filled: true,
//                 fillColor: Colors.blueGrey[50],
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: Padding(
//                 padding: EdgeInsets.only(top: 8.0),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => HomeForgetPassword(),
//                       ),
//                     );
//                   },
//                   child: Text(
//                     "Forget Password",
//                     style: TextStyle(color: Colors.teal),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 15),
//                   backgroundColor: Color.fromARGB(255, 24, 188, 203),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child: const Text(
//                   "Log In",
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Center(child: Text("or sign up with")),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Icon(
//                   Icons.g_mobiledata,
//                   size: 40,
//                   color: Color.fromARGB(255, 24, 188, 203),
//                 ),
//                 SizedBox(width: 20),
//                 Icon(
//                   Icons.facebook,
//                   size: 40,
//                   color: Color.fromARGB(255, 24, 188, 203),
//                 ),
//                 SizedBox(width: 20),
//                 Icon(
//                   Icons.fingerprint,
//                   size: 40,
//                   color: Color.fromARGB(255, 24, 188, 203),
//                 ),
//               ],
//             ),
//             const Spacer(),
//             const Center(
//               child: Text.rich(
//                 TextSpan(
//                   text: "Don’t have an account? ",
//                   children: [
//                     TextSpan(
//                       text: "Regester",
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 24, 188, 203),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../../services/api_service.dart';
// import '../../models/login_request.dart';
// import '../forget_password/home_forget_password.dart';

// class HomeLogin extends StatelessWidget {
//   const HomeLogin({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
//   }
// }

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final ApiService _apiService = ApiService();
//   bool _isLoading = false;

//   void _handleLogin() async {
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();

//     if (email.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Vui lòng nhập email và mật khẩu')),
//       );
//       return;
//     }

//     setState(() => _isLoading = true);

//     bool success = await _apiService.login(
//       LoginRequest(username: email, password: password),
//     );

//     setState(() => _isLoading = false);

//     if (success) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text('Đăng nhập thành công!')));
//       Navigator.pushReplacementNamed(context, '/home');
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Đăng nhập thất bại, vui lòng thử lại!')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 50),
//             const Center(
//               child: Text(
//                 "Log In",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Color.fromARGB(255, 24, 188, 203),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text("Email or Mobile Number"),
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Username',
//                 prefixIcon: const Icon(Icons.email),
//                 hintText: "Your Email or Phone Number",
//                 filled: true,
//                 fillColor: const Color.fromARGB(255, 239, 240, 241),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             const Text("Password"),
//             TextField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 prefixIcon: const Icon(Icons.lock),
//                 suffixIcon: const Icon(Icons.visibility_off),
//                 hintText: "Your Password",
//                 filled: true,
//                 fillColor: Colors.blueGrey[50],
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => HomeForgetPassword(),
//                       ),
//                     );
//                   },
//                   child: const Text(
//                     "Forget Password",
//                     style: TextStyle(color: Colors.teal),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: _isLoading ? null : _handleLogin,
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 15),
//                   backgroundColor: Color.fromARGB(255, 24, 188, 203),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child:
//                     _isLoading
//                         ? const CircularProgressIndicator(color: Colors.white)
//                         : const Text(
//                           "Log In",
//                           style: TextStyle(fontSize: 16, color: Colors.white),
//                         ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Center(child: Text("or sign up with")),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Icon(
//                   Icons.g_mobiledata,
//                   size: 40,
//                   color: Color.fromARGB(255, 24, 188, 203),
//                 ),
//                 SizedBox(width: 20),
//                 Icon(
//                   Icons.facebook,
//                   size: 40,
//                   color: Color.fromARGB(255, 24, 188, 203),
//                 ),
//                 SizedBox(width: 20),
//                 Icon(
//                   Icons.fingerprint,
//                   size: 40,
//                   color: Color.fromARGB(255, 24, 188, 203),
//                 ),
//               ],
//             ),
//             const Spacer(),
//             const Center(
//               child: Text.rich(
//                 TextSpan(
//                   text: "Don’t have an account? ",
//                   children: [
//                     TextSpan(
//                       text: "Register",
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 24, 188, 203),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // import 'package:assistantstroke/controler/login_controller.dart';
// import 'package:assistantstroke/controler/login_controller.dart';
// import 'package:flutter/material.dart';
// // import '../../services/api_service.dart';
// // import '../../models/login_request.dart';
// import '../forget_password/home_forget_password.dart';

// class HomeLogin extends StatelessWidget {
//   const HomeLogin({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
//   }
// }

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController Username = TextEditingController();
//   final TextEditingController Password = TextEditingController();
//   // final ApiService _apiService = ApiService();
//   bool _isLoading = false;

//   void _handleLogin() async {
//     String username = Username.text.trim();
//     String password = Password.text.trim();
//     print(username);
//     if (username.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Vui lòng nhập email hoặc số điện thoại và mật khẩu'),
//         ),
//       );
//       return;
//     }

//     setState(() => _isLoading = true);
//     LoginController loginController = LoginController(
//       username: username,
//       password: password,
//     );
//     await loginController
//         .login(); // Call login method// Call login method from LoginController

//     setState(() => _isLoading = false);

//     // bool success = await _apiService.login(
//     //   LoginRequest(username: emailOrPhone, password: password),
//     // );
//     // bool success = await _apiService.login(LoginController().Username.text);
//     // setState(() => _isLoading = false);

//     // if (success) {
//     //   ScaffoldMessenger.of(
//     //     context,
//     //   ).showSnackBar(const SnackBar(content: Text('Đăng nhập thành công!')));
//     //   Navigator.pushReplacementNamed(context, '/home');
//     // } else {
//     //   ScaffoldMessenger.of(context).showSnackBar(
//     //     const SnackBar(content: Text('Đăng nhập thất bại, vui lòng thử lại!')),
//     //   );
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 50),
//             const Center(
//               child: Text(
//                 "Log In",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Color.fromARGB(255, 24, 188, 203),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text("Email hoặc Số điện thoại"),
//             TextField(
//               controller: Username,
//               decoration: InputDecoration(
//                 labelText: 'Email hoặc SĐT',
//                 prefixIcon: const Icon(Icons.email),
//                 hintText: "Nhập email hoặc số điện thoại",
//                 filled: true,
//                 fillColor: const Color.fromARGB(255, 239, 240, 241),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             const Text("Mật khẩu"),
//             TextField(
//               controller: Password,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'Mật khẩu',
//                 prefixIcon: const Icon(Icons.lock),
//                 suffixIcon: const Icon(Icons.visibility_off),
//                 hintText: "Nhập mật khẩu",
//                 filled: true,
//                 fillColor: Colors.blueGrey[50],
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => HomeForgetPassword(),
//                       ),
//                     );
//                   },
//                   child: const Text(
//                     "Quên mật khẩu?",
//                     style: TextStyle(color: Colors.teal),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: _isLoading ? null : _handleLogin,
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 15),
//                   backgroundColor: Color.fromARGB(255, 24, 188, 203),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child:
//                     _isLoading
//                         ? const CircularProgressIndicator(color: Colors.white)
//                         : const Text(
//                           "Đăng nhập",
//                           style: TextStyle(fontSize: 16, color: Colors.white),
//                         ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Center(child: Text("Hoặc đăng nhập với")),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Icon(
//                   Icons.g_mobiledata,
//                   size: 40,
//                   color: Color.fromARGB(255, 24, 188, 203),
//                 ),
//                 SizedBox(width: 20),
//                 Icon(
//                   Icons.facebook,
//                   size: 40,
//                   color: Color.fromARGB(255, 24, 188, 203),
//                 ),
//                 SizedBox(width: 20),
//                 Icon(
//                   Icons.fingerprint,
//                   size: 40,
//                   color: Color.fromARGB(255, 24, 188, 203),
//                 ),
//               ],
//             ),
//             const Spacer(),
//             const Center(
//               child: Text.rich(
//                 TextSpan(
//                   text: "Chưa có tài khoản? ",
//                   children: [
//                     TextSpan(
//                       text: "Đăng ký",
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 24, 188, 203),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:assistantstroke/controler/login_controller.dart';
import 'package:flutter/material.dart';
// import 'package:assistantstroke/controller/login_controller.dart'; // Import LoginController
import 'package:assistantstroke/page/forget_password/home_forget_password.dart'; // Import Forget Password page

class HomeLogin extends StatefulWidget {
  const HomeLogin({super.key});

  @override
  _HomeLoginState createState() => _HomeLoginState();
}

class _HomeLoginState extends State<HomeLogin> {
  final TextEditingController Username = TextEditingController();
  final TextEditingController Password = TextEditingController();
  bool _isLoading = false;

  // Handle login when user presses login button
  void _handleLogin() async {
    String username = Username.text.trim();
    String password = Password.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập email hoặc số điện thoại và mật khẩu'),
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    // Pass data to LoginController
    LoginController loginController = LoginController(
      username: username,
      password: password,
    );
    await loginController.login(context); // Call login method

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Center(
              child: Text(
                "Log In",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 24, 188, 203),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Email hoặc Số điện thoại"),
            TextField(
              controller: Username,
              decoration: InputDecoration(
                labelText: 'Email hoặc SĐT',
                prefixIcon: const Icon(Icons.email),
                hintText: "Nhập email hoặc số điện thoại",
                filled: true,
                fillColor: const Color.fromARGB(255, 239, 240, 241),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text("Mật khẩu"),
            TextField(
              controller: Password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: const Icon(Icons.visibility_off),
                hintText: "Nhập mật khẩu",
                filled: true,
                fillColor: Colors.blueGrey[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const HomeForgetPassword(),
                    //   ),
                    // );
                  },
                  child: const Text(
                    "Quên mật khẩu?",
                    style: TextStyle(color: Colors.teal),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _handleLogin,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: const Color.fromARGB(255, 24, 188, 203),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child:
                    _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                          "Đăng nhập",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(child: Text("Hoặc đăng nhập với")),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.g_mobiledata,
                  size: 40,
                  color: Color.fromARGB(255, 24, 188, 203),
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.facebook,
                  size: 40,
                  color: Color.fromARGB(255, 24, 188, 203),
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.fingerprint,
                  size: 40,
                  color: Color.fromARGB(255, 24, 188, 203),
                ),
              ],
            ),
            const Spacer(),
            const Center(
              child: Text.rich(
                TextSpan(
                  text: "Chưa có tài khoản? ",
                  children: [
                    TextSpan(
                      text: "Đăng ký",
                      style: TextStyle(
                        color: Color.fromARGB(255, 24, 188, 203),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
