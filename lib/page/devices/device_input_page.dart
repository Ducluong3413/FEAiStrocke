import 'package:assistantstroke/controler/device_controller.dart';
import 'package:flutter/material.dart';

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

  Future<void> _onSubmit() async {
    setState(() => _isLoading = true);
    if (context == null ||
        _deviceNameController.text.isEmpty ||
        _deviceTypeController.text.isEmpty ||
        _seriesController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng điền đầy đủ thông tin')),
      );
      setState(() => _isLoading = false);
      return;
    }

    await DeviceController.submitDeviceInfo(
      context: context,
      deviceName: _deviceNameController.text,
      deviceType: _deviceTypeController.text,
      series: _seriesController.text,
    );

    setState(() => _isLoading = false);
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
              child:
                  _isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Gửi thông tin'),
            ),
          ],
        ),
      ),
    );
  }
}
