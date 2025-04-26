import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class BleController extends GetxController {
  late FlutterBluePlus ble;

  @override
  void onInit() {
    super.onInit();
    ble = FlutterBluePlus(); // Initialize the instance properly
  }

  // This Function will help users to scan nearby BLE devices and get the list of Bluetooth devices.
  Future<void> scanDevices() async {
    try {
      // Request Bluetooth scan permission
      if (await Permission.bluetoothScan.request().isGranted) {
        if (await Permission.bluetoothConnect.request().isGranted) {
          // Start scanning for devices
          await FlutterBluePlus.startScan(timeout: Duration(seconds: 15));

          // Listen for scan results
          FlutterBluePlus.scanResults.listen((results) {
            for (ScanResult r in results) {
              print('${r.device.name} found! rssi: ${r.rssi}');
            }
          });

          // Wait for the scan to complete
          await Future.delayed(Duration(seconds: 15));
          await FlutterBluePlus.stopScan();
        } else {
          print("Bluetooth connect permission not granted.");
        }
      } else {
        print("Bluetooth scan permission not granted.");
      }
    } catch (e) {
      print("Error occurred while scanning: $e");
    }
  }

  // This function will help user to connect to BLE devices.
  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect(timeout: Duration(seconds: 15));

      // Listen for connection state changes
      device.state.listen((BluetoothConnectionState state) {
        if (state == BluetoothConnectionState.connecting) {
          print("Device connecting to: ${device.name}");
        } else if (state == BluetoothConnectionState.connected) {
          print("Device connected: ${device.name}");
        } else if (state == BluetoothConnectionState.disconnected) {
          print("Device disconnected: ${device.name}");
        } else if (state == BluetoothConnectionState.disconnecting) {
          print("Device disconnecting: ${device.name}");
        }
      });
    } catch (e) {
      print("Error occurred while connecting to device: $e");
    }
  }

  // Stream to get scan results
  Stream<List<ScanResult>> get scanResults => FlutterBluePlus.scanResults;
}