import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeMap extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<HomeMap> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(16.047079, 108.206230);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final List<Map<String, dynamic>> hospitals = [
    {
      "name": "Da Nang Hospital",
      "address": "124 Hai Phong Street, Thach Thang Ward, Da Nang",
      "schedule": "7:15 AM - 6:30 PM",
      "distance": "2.5 Km",
      "rating": 3,
      "location": LatLng(16.0611, 108.2022),
    },
    {
      "name": "Da Nang Hospital C",
      "address": "122 Hai Phong Street, Thach Thang Ward, Da Nang",
      "schedule": "9:00 AM - 8:30 PM",
      "distance": "5 Km",
      "rating": 2,
      "location": LatLng(16.0605, 108.2018),
    },
    {
      "name": "Da Nang Obstetrics And Pediatrics Hospital",
      "address": "402 Le Van Hien Street, Khue My Ward, Da Nang",
      "schedule": "9:00 AM - 8:30 PM",
      "distance": "5 Km",
      "rating": 4,
      "location": LatLng(16.0302, 108.2512),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Map")),
      body: Column(
        children: [
          Container(
            height: 300,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 13.0,
              ),
              markers:
                  hospitals.map((hospital) {
                    return Marker(
                      markerId: MarkerId(hospital["name"]!),
                      position: hospital["location"],
                      infoWindow: InfoWindow(
                        title: hospital["name"],
                        snippet: hospital["distance"],
                      ),
                    );
                  }).toSet(),
            ),
          ),
          Expanded(
            child: ListView.builder(
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
                              i < hospital["rating"]
                                  ? Icons.star
                                  : Icons.star_border,
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
          ),
        ],
      ),
    );
  }
}
