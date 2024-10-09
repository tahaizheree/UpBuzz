import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:upalerts/appAssets/assets.dart';
import 'package:upalerts/providers/profile_provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController();
  final _experienceController = TextEditingController();
  final _whatsappController = TextEditingController();
  final _countryController = TextEditingController();
  final _emailController = TextEditingController();
  final _upworkProfileController = TextEditingController();
  final _fiverrProfileController = TextEditingController();

  File? _newImage;

  @override
  void initState() {
    super.initState();
    final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    _nameController.text = profileProvider.profile.name;
    _experienceController.text = profileProvider.profile.experience;
    _whatsappController.text = profileProvider.profile.whatsapp;
    _countryController.text = profileProvider.profile.country;
    _emailController.text = profileProvider.profile.email;
    _upworkProfileController.text = profileProvider.profile.upworkProfile;
    _fiverrProfileController.text = profileProvider.profile.fiverrProfile;
  }

  Future<void> _pickImage() async {
  try {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _newImage = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  } catch (e) {
    print('Failed to pick image: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Edit Profile'),
       
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ProfileProvider>(
          builder: (context, profileProvider, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: _newImage != null
                              ? FileImage(_newImage!)
                              : (profileProvider.profile.profileImage != null
                                  ? FileImage(profileProvider.profile.profileImage!)
                                  : const AssetImage(Assets.avatar)) as ImageProvider,
                        ),
                        const Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Icon(Icons.edit, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField('Name', _nameController),
                  const SizedBox(height: 10),
                  _buildTextField('Experience', _experienceController),
                  const SizedBox(height: 10),
                  _buildTextField('Whatsapp Number', _whatsappController),
                  const SizedBox(height: 10),
                  _buildTextField('Country', _countryController),
                  const SizedBox(height: 10),
                  _buildTextField('Email', _emailController),
                  const SizedBox(height: 20),
                  const Text('Freelance Profile', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 10),
                  _buildTextField('Upwork Profile', _upworkProfileController),
                  const SizedBox(height: 10),
                  _buildTextField('Fiverr Profile', _fiverrProfileController),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      profileProvider.updateProfile(
                        _nameController.text,
                        _experienceController.text,
                        _whatsappController.text,
                        _countryController.text,
                        _emailController.text,
                        _upworkProfileController.text,
                        _fiverrProfileController.text,
                        _newImage,
                      );
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text('Save Changes'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}