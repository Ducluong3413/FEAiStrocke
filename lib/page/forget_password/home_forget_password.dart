import 'package:assistantstroke/page/login/home_login.dart';
import 'package:flutter/material.dart';

class HomeForgetPassword extends StatelessWidget {
  const HomeForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 24, 188, 203),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              buildInputField(
                "Full Name",
                "Input Your Full Name",
                Icons.person,
              ),
              buildInputField("Email", "Input Your Email", Icons.email),
              buildInputField(
                "Mobile Number",
                "Input Your Phone Number",
                Icons.phone,
              ),
              buildInputField(
                "Password",
                "Input Your Password",
                Icons.lock,
                isPassword: true,
              ),
              buildInputField(
                "Re-Enter Password",
                "Re-Enter Input Your Password",
                Icons.lock,
                isPassword: true,
              ),
              Row(
                children: [
                  Expanded(
                    child: buildInputField(
                      "Date Of Birth",
                      "",
                      Icons.calendar_today,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: buildInputField("Sex", "", Icons.wc)),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: Column(
                  children: [
                    const Text(
                      "By continuing, you agree to",
                      style: TextStyle(color: Colors.black54),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Terms of Use and Privacy Policy.",
                        style: TextStyle(
                          color: Color.fromARGB(255, 24, 188, 203),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Color.fromARGB(255, 24, 188, 203),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Center(child: Text("or sign up with")),
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
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeLogin(),
                      ), // Mở trang mới
                    );
                  },

                  child: const Text.rich(
                    TextSpan(
                      text: "Don’t have an account? ",
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            color: Color.fromARGB(255, 24, 188, 203),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(
    String label,
    String hint,
    IconData icon, {
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
              prefixIcon: Icon(icon),
              hintText: hint,
              filled: true,
              fillColor: Colors.blueGrey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
