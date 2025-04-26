import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:assistantstroke/controler/device_controller.dart';
import 'package:assistantstroke/controler/ble_controller.dart'; // Import BleController
import 'package:get/get.dart';

class DeviceInputPage extends StatefulWidget {
  const DeviceInputPage({super.key});

  @override
  State<DeviceInputPage> createState() => _DeviceInputPageState();
}

class _DeviceInputPageState extends State<DeviceInputPage> {
  final TextEditingController _deviceNameController = TextEditingController();
  final TextEditingController _deviceTypeController = TextEditingController();
  final TextEditingController _seriesController = TextEditingController();

  bool _isLoading = false;
  final BleController bleController = Get.put(BleController()); // Khởi tạo BleController

  @override
  void initState() {
    super.initState();
  }

  Future<void> _onSubmit() async {
    setState(() => _isLoading = true);
    if (_deviceNameController.text.isEmpty ||
        _deviceTypeController.text.isEmpty ||
        _seriesController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng điền đầy đủ thông tin')),
      );
      setState(() => _isLoading = false);
      return;
    }

    // Gọi hàm submitDeviceInfo ở đây
    await DeviceController.submitDeviceInfo(
      context: context,
      deviceName: _deviceNameController.text,
      deviceType: _deviceTypeController.text,
      series: _seriesController.text,
    );

    setState(() => _isLoading = false);
  }

  void _scanForDevices() {
    bleController.scanDevices(); // Gọi phương thức quét từ BleController
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thêm thiết bị'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _deviceNameController,
              decoration: const InputDecoration(labelText: 'Tên thiết bị'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _deviceTypeController,
              decoration: const InputDecoration(labelText: 'Loại thiết bị'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _seriesController,
              decoration: const InputDecoration(labelText: 'Series'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _onSubmit,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Gửi thông tin'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _scanForDevices,
              child: const Text('Quét Bluetooth'),
            ),
            const SizedBox(height: 20),
            Text('Thiết bị Bluetooth tìm thấy:'),
            Expanded(
              child: GetBuilder<BleController>(
                init: bleController,
                builder: (BleController controller) {
                  return StreamBuilder<List<ScanResult>>(
                    stream: controller.scanResults,
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final data = snapshot.data![index];
                            return Card(
                              elevation: 2,
                              child: ListTile(
                                title: Text(data.device.name.isNotEmpty
                                    ? data.device.name
                                    : 'Không tên'),
                                subtitle: Text(data.device.id.toString()),
                                trailing: Text(data.rssi.toString()),
                                onTap: () {
                                  // Kết nối với thiết bị khi nhấn vào
                                  controller.connectToDevice(data.device);
                                },
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(child: Text("No Device Found"));
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}