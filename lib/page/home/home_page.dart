import 'package:assistantstroke/page/login/home_login.dart';
// import 'package:assistantstroke/page/main_home/home_main_home.dart';
import 'package:assistantstroke/page/main_home/home_navbar.dart';
import 'package:flutter/material.dart';
import 'package:assistantstroke/page/home/widgets/home_stroke_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: const Color.fromARGB(255, 255, 255, 255),
        // decoration: BoxDecoration(
        //   gradient: SweepGradient(colors: [Colors.white]),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeStrokeIcon(),

            Text(
              'Stroke AI',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: const Color.fromARGB(255, 24, 188, 203),
              ),
            ),
            Container(
              width: 300,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
              ),
            ),

            Container(
              width: 210,
              height: 50,

              margin: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeLogin(),
                    ), // Mở trang mới
                  );
                  print('Sing Up');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                    255,
                    33,
                    212,
                    243,
                  ), // Màu nền của button
                  foregroundColor: const Color.fromARGB(255, 253, 253, 253),

                  shadowColor: Colors.black, // Thêm bóng cho button khi nhấn
                  elevation: 10,
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              width: 210,
              height: 50,
              margin: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeNavbar(),
                    ), // Mở trang mới
                  );
                  print('Sing Up');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 69, 68, 68),

                  shadowColor: Colors.black, // Thêm bóng cho button khi nhấn
                  elevation: 10,
                ),
                child: Text(
                  'Sing Up',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
