import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hunting_app/common/custom_button.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/custom_snackBar.dart';
import 'package:hunting_app/common/custom_text_field.dart';
import 'package:hunting_app/common/text_style_custom.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/constant/app_urls.dart';
import 'package:hunting_app/presentation/profile/profile_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String? _imageUrl; // For the profile image
  File? _imageFile; // For the selected image file
  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text =
        context.read<ProfileProvider>().profileModel.data?.name ?? '';
    _phoneController.text =
        context.read<ProfileProvider>().profileModel.data?.phone ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileProvider>();
    return Scaffold(
      backgroundColor: appBgColor,

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  Expanded(
                    child: Text(
                      "Profile Edit",
                      style: customTextStyleAuth(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(width: 48),
                ],
              ),
              Divider(color: blueShade3),
              // Profile Image Section
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Stack(
                    alignment: Alignment
                        .center, // Centers the child widgets within the stack
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: 50,
                        backgroundImage: _imageFile != null
                            ? FileImage(
                                File(_imageFile!.path),
                              ) // Display the selected image
                            : NetworkImage(
                                    provider.profileModel.data!.image
                                        .toString(),
                                  )
                                  as ImageProvider,
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: _pickImage,
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 30, // Adjust size as necessary
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Name Field
              _buildTextField(
                controller: _nameController,
                label: "Name",
                hintText: "Enter your name",

                isPassword: false,
              ),
              const SizedBox(height: 20),

              // Phone Field
              _buildTextField(
                controller: _phoneController,
                label: "Phone",
                hintText: "Enter your phone number",
                keyboardType: TextInputType.phone,
                isPassword: false,
              ),
              const SizedBox(height: 20),

              // Save Button
              provider.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : CustomButton(
                      buttonText: "Save",
                      onPressed: () async {
                        // if (_formKey.currentState?.validate() ?? false) {
                        //   // Handle save logic here (e.g., update the profile)
                         
                        // }
                         final status = await provider.updateProfile(
                            name: _nameController.text,
                            phone: _phoneController.text,
                            image: _imageFile,
                          );
                          CustomSnackbar.show(
                            context,
                            message: status["message"],
                          );
                      },
                    ),
              // ElevatedButton(
              //   onPressed: () {
              //     if (_formKey.currentState?.validate() ?? false) {
              //       // Handle save logic here (e.g., update the profile)
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         const SnackBar(content: Text('Profile updated')),
              //       );
              //     }
              //   },
              //   child: const Text('Save'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTextField({
  required String label,
  required TextEditingController controller,
  required String hintText,
  String? prefixIconSvgPath,
  TextInputType keyboardType = TextInputType.text,
  bool obscureText = false,
  bool isPassword = false,
  String? Function(String?)? validator,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: customTextStyleAuth(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Color(0xff97BECA),
          ),
        ),
        vPad5,
        CustomTextField(
          controller: controller,
          hintText: hintText,
          borderRadius: 10,
          prefixIconSvgPath: prefixIconSvgPath,
          keyboardType: keyboardType,
          isPassword: isPassword,
        ),
      ],
    ),
  );
}
