import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:assistantstroke/controler/invitation_controller.dart';

class ScanInvitationPage extends StatefulWidget {
  const ScanInvitationPage({super.key});

  @override
  State<ScanInvitationPage> createState() => _ScanInvitationPageState();
}

class _ScanInvitationPageState extends State<ScanInvitationPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool _isProcessing = false;
  String resultMessage = '';

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  void _onQRViewCreated(QRViewController qrController) {
    controller = qrController;
    qrController.scannedDataStream.listen((scanData) async {
      if (!_isProcessing) {
        setState(() {
          _isProcessing = true;
        });

        final invitationCode = scanData.code;
        final response = await InvitationController().submitInvitation(
          invitationCode ?? '',
        );

        setState(() {
          resultMessage = response['message'] ?? 'Không nhận được phản hồi.';
        });

        await Future.delayed(const Duration(seconds: 2));
        Navigator.pop(context, resultMessage);
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quét mã lời mời')),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
          ),
          if (resultMessage.isNotEmpty)
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  resultMessage,
                  style: const TextStyle(fontSize: 16, color: Colors.green),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
