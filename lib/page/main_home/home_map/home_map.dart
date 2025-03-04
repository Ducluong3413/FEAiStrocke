import 'package:flutter/material.dart';

class HomeMap extends StatelessWidget {
  final List<Map<String, dynamic>> hospitals = [
    {
      "name": "Da Nang Hospital",
      "address": "124 Hai Phong Street, Thach Thang Ward, Da Nang",
      "schedule": "7:15 AM - 6:30 PM",
      "distance": "2.5 Km",
      "rating": 3,
    },
    {
      "name": "Da Nang Hospital C",
      "address": "122 Hai Phong Street, Thach Thang Ward, Da Nang",
      "schedule": "9:00 AM - 8:30 PM",
      "distance": "5 Km",
      "rating": 2,
    },
    {
      "name": "Da Nang Obstetrics And Pediatrics Hospital",
      "address": "402 Le Van Hien Street, Khue My Ward, Da Nang",
      "schedule": "9:00 AM - 8:30 PM",
      "distance": "5 Km",
      "rating": 4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hospitals List")),
      body: ListView.builder(
        itemCount: hospitals.length,
        itemBuilder: (context, index) {
          final hospital = hospitals[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.local_hospital, color: Colors.blue),
              title: Text(
                hospital["name"],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(hospital["address"]),
                  Text("Hours: ${hospital["schedule"]}"),
                  Row(
                    children: List.generate(5, (i) {
                      return Icon(
                        i < hospital["rating"] ? Icons.star : Icons.star_border,
                        color: Colors.orange,
                        size: 16,
                      );
                    }),
                  ),
                ],
              ),
              trailing: Text(hospital["distance"]),
            ),
          );
        },
      ),
    );
  }
}
