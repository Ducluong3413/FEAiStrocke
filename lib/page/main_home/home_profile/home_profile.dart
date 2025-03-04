import 'package:flutter/material.dart';

class HomeProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserInformationScreen(),
    );
  }
}

class UserInformationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {"icon": Icons.person, "text": "Profile"},
    {"icon": Icons.favorite, "text": "More Emergency Phone Number"},
    {"icon": Icons.lock, "text": "Password Manager"},
    {"icon": Icons.settings, "text": "Settings"},
    {"icon": Icons.help, "text": "Help"},
    {"icon": Icons.logout, "text": "Logout"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            const Text(
              "User Information",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.cyan,
              ),
            ),
            const SizedBox(height: 20),
            _buildUserProfile(),
            const SizedBox(height: 20),
            _buildMenuList(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserProfile() {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            "assets/images/icon/IMG_1616.JPG",
          ), // Thay bằng ảnh phù hợp
        ),
        const SizedBox(height: 10),
        const Text(
          "Minh Nguyet",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Text("+123 567 89000"),
        const Text(
          "minhnguyet@gmail.com",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildMenuList() {
    return Column(
      children: menuItems.map((item) => _buildMenuItem(item)).toList(),
    );
  }

  Widget _buildMenuItem(Map<String, dynamic> item) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.cyan,
        child: Icon(item["icon"], color: Colors.white),
      ),
      title: Text(item["text"]),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.cyan),
      onTap: () {},
    );
  }
}
