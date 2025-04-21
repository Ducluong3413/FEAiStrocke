import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  // Các controller cho từng trường
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String _selectedGender = 'Male'; // Mặc định

  @override
  void initState() {
    super.initState();
    // TODO: Load dữ liệu người dùng từ API nếu cần
    _nameController.text = 'John Doe';
    _dobController.text = '1990-01-01';
    _phoneController.text = '0123456789';
    _emailController.text = 'john.doe@example.com';
    _selectedGender = 'Male';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dobController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // TODO: Gửi dữ liệu cập nhật về server
      print('✅ Saving...');
      print('Name: ${_nameController.text}');
      print('DOB: ${_dobController.text}');
      print('Gender: $_selectedGender');
      print('Phone: ${_phoneController.text}');
      print('Email: ${_emailController.text}');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Thông tin đã được lưu!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(_nameController, 'Patient Name'),
              _buildTextField(_dobController, 'Date of Birth (YYYY-MM-DD)'),
              _buildGenderDropdown(),
              _buildTextField(_phoneController, 'Phone'),
              _buildTextField(_emailController, 'Email'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProfile,
                child: const Text('Save'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator:
            (value) =>
                value == null || value.isEmpty ? 'Vui lòng nhập $label' : null,
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        value: _selectedGender,
        items:
            ['Male', 'Female', 'Other'].map((gender) {
              return DropdownMenuItem(value: gender, child: Text(gender));
            }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedGender = value!;
          });
        },
        decoration: InputDecoration(
          labelText: 'Gender',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
