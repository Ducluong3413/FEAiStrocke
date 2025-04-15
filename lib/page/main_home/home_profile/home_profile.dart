import 'package:assistantstroke/controler/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProfile extends StatefulWidget {
  final VoidCallback onLogout;

  HomeProfile({required this.onLogout});

  @override
  _HomeProfileState createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  String username = "Đang tải...";
  String email = "Đang tải...";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    ProfileController profileController = ProfileController();
    Map<String, dynamic>? userData = await profileController.fetchUserData(
      context,
    );

    if (userData != null) {
      setState(() {
        username = userData['username'] ?? "Không có tên";
        email = userData['email'] ?? "Không có email";
      });
    }
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    widget.onLogout(); // Gọi hàm logout từ HomeNavbar
  }

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
        padding: const EdgeInsets.only(top: 60),
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
          backgroundImage: AssetImage("assets/images/icon/IMG_1616.JPG"),
        ),
        const SizedBox(height: 10),
        Text(
          username,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(email, style: const TextStyle(color: Colors.grey)),
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
      onTap: () {
        if (item["text"] == "Logout") {
          _logout();
        }
      },
    );
  }
}
