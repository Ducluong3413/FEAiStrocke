import 'package:flutter/material.dart';

class HomeMainHome extends StatelessWidget {
  const HomeMainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HealthHistoryScreen(),
    );
  }
}

class HealthHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Health Parameter History",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                filterButton("ALL", Icons.filter_list),
                filterButton("Heart Rate", Icons.favorite),
                filterButton("Blood Pressure", Icons.bloodtype),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  healthEntry(
                    "27/02/2025",
                    "Heart Rate",
                    "89bpm",
                    "10:30",
                    Colors.green,
                  ),
                  healthEntry(
                    "27/02/2025",
                    "Blood Pressure",
                    "105/78 mmHg",
                    "10:30",
                    Colors.green,
                  ),
                  healthEntry(
                    "28/02/2025",
                    "Heart Rate",
                    "120bpm",
                    "4:21",
                    Colors.red,
                  ),
                  healthEntry(
                    "28/02/2025",
                    "Blood Pressure",
                    "105/78 mmHg",
                    "4:21",
                    Colors.green,
                  ),
                  healthEntry(
                    "28/02/2025",
                    "Heart Rate",
                    "100bpm",
                    "3:00",
                    Colors.red,
                  ),
                  healthEntry(
                    "28/02/2025",
                    "Blood Pressure",
                    "100/78 mmHg",
                    "3:00",
                    Colors.green,
                  ),
                  healthEntry(
                    "25/02/2025",
                    "Heart Rate",
                    "80bpm",
                    "4:21",
                    Colors.yellow,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget filterButton(String title, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white),
      label: Text(title, style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.cyan,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget healthEntry(
    String date,
    String type,
    String value,
    String time,
    Color statusColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(date, style: TextStyle(fontWeight: FontWeight.bold)),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Container(
                    width: 5,
                    height: 50,
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          type,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(value, style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  Text(time, style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
