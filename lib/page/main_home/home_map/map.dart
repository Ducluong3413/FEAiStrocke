// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';

// class HospitalMapScreen extends StatelessWidget {
//   final Map<String, dynamic> hospital;

//   HospitalMapScreen(this.hospital);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(hospital["name"])),
//       body: FlutterMap(
//         options: MapOptions(center: hospital["location"], zoom: 15.0),
//         children: [
//           TileLayer(
//             urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//             subdomains: ['a', 'b', 'c'],
//           ),
//           MarkerLayer(
//             markers: [
//               Marker(
//                 width: 40.0,
//                 height: 40.0,
//                 point: hospital["location"],
//                 child: Icon(Icons.location_on, color: Colors.red, size: 40),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HospitalMapScreen extends StatelessWidget {
  final Map<String, dynamic> hospital;

  HospitalMapScreen(this.hospital);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(hospital["name"])),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(hospital["lat"], hospital["lon"]),
          zoom: 15.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 40.0,
                height: 40.0,
                point: LatLng(hospital["lat"], hospital["lon"]),
                child: Icon(Icons.location_on, color: Colors.red, size: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
