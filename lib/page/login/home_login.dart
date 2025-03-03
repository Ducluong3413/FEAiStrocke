import 'package:assistantstroke/page/forget_password/home_forget_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeLogin extends StatelessWidget {
  const HomeLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}

class LoginScreen extends StatelessWidget {
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
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 24, 188, 203),
              ),
            ),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            const Text("Email or Mobile Number"),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: "Your Email or Phone Number",
                filled: true,
                fillColor: const Color.fromARGB(255, 239, 240, 241),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text("Password"),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility_off),
                hintText: "Your Password",
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
                padding: EdgeInsets.only(top: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeForgetPassword(),
                      ),
                    );
                  },
                  child: Text(
                    "Forget Password",
                    style: TextStyle(color: Colors.teal),
                  ),
                ),
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
                  "Log In",
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
            const Spacer(),
            const Center(
              child: Text.rich(
                TextSpan(
                  text: "Don’t have an account? ",
                  children: [
                    TextSpan(
                      text: "Regester",
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
