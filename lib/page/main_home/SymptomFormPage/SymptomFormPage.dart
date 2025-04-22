import 'package:flutter/material.dart';
import 'package:assistantstroke/controler/symptom_controller.dart';

class SymptomFormPage extends StatefulWidget {
  const SymptomFormPage({super.key});

  @override
  State<SymptomFormPage> createState() => _SymptomFormPageState();
}

class _SymptomFormPageState extends State<SymptomFormPage> {
  // Map lưu trạng thái của checkbox
  Map<String, bool> symptoms = {
    "headache": false,
    "numbness": false,
    "dizziness": false,
    "speechDifficulty": false,
    "temporaryMemoryLoss": false,
    "confusion": false,
    "visionLoss": false,
    "imbalance": false,
  };

  bool _isLoading = false;

  Future<void> submitSymptoms() async {
    setState(() => _isLoading = true);

    final model = SymptomModel(
      headache: symptoms['headache'] ?? false,
      numbness: symptoms['numbness'] ?? false,
      dizziness: symptoms['dizziness'] ?? false,
      speechDifficulty: symptoms['speechDifficulty'] ?? false,
      temporaryMemoryLoss: symptoms['temporaryMemoryLoss'] ?? false,
      confusion: symptoms['confusion'] ?? false,
      visionLoss: symptoms['visionLoss'] ?? false,
      imbalance: symptoms['imbalance'] ?? false,
      nausea: symptoms['nausea'] ?? false,
      difficultyswallowing: symptoms['difficultyswallowing'] ?? false,
    );

    final controller = SymptomController();
    final success = await controller.saveSymptoms(model);

    if (success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Gửi dữ liệu thành công!")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Gửi dữ liệu thất bại!")));
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Triệu chứng sức khỏe')),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  ...symptoms.keys.map((key) {
                    return CheckboxListTile(
                      title: Text(_convertKeyToLabel(key)),
                      value: symptoms[key],
                      onChanged: (val) {
                        setState(() {
                          symptoms[key] = val ?? false;
                        });
                      },
                    );
                  }).toList(),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: submitSymptoms,
                    child: const Text('Khai Báo'),
                  ),
                ],
              ),
    );
  }

  String _convertKeyToLabel(String key) {
    switch (key) {
      case "headache":
        return "Đau đầu";
      case "numbness":
        return "Tê tay";
      case "dizziness":
        return "Chóng mặt";
      case "speechDifficulty":
        return "Khó nói";
      case "temporaryMemoryLoss":
        return "Mất trí nhớ tạm thời";
      case "confusion":
        return "Lú lẫn";
      case "visionLoss":
        return "Giảm thị lực";
      case "imbalance":
        return "Mất thăng bằng";
      case "nausea":
        return "Buồn nôn";
      case "difficultyswallowing":
        return "Khó nuốt";
      default:
        return key;
    }
  }
}
