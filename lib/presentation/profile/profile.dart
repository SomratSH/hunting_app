import 'package:flutter/material.dart';
import '../../common/text_style_custom.dart';
import '../../constant/app_colors.dart';
import 'widget/porfile_tile.dart';

class ProfilePage extends StatelessWidget {
  final String profileImage = "assets/profile_image.jpg";
  final String name = "John Doe";
  final String email = "john.doe@example.com";
  final String phone = "+1 234 567 8901";
  final String address = "123 Main Street, New York, USA";
  final String dateOfBirth = "January 1, 1990";
  final String occupation = "Software Developer";
  final String gender = "Male";
  final String nationality = "American";
  final String maritalStatus = "Single";
  final String languages = "English, Spanish";
  final String website = "www.johndoe.dev";
  final String bio =
      "Passionate developer with 10+ years of experience in mobile and web technologies. Loves solving real-world problems with clean and efficient code.";

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  Expanded(
                    child: Text(
                      "Profile",
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
              SizedBox(height: 30),

              // Profile Image + Camera Icon
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(profileImage),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        // TODO: Add image picker
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.teal,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Basic Info
              Text(
                name,
                style: customTextStyleAuth(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                email,
                style: TextStyle(fontSize: 16, color: Colors.grey[400]),
              ),
              SizedBox(height: 5),
              Text(
                phone,
                style: TextStyle(fontSize: 16, color: Colors.grey[400]),
              ),
              SizedBox(height: 30),
              Divider(color: blueShade3),

              // Additional Details
              ProfileInfoTile(
                title: "Address",
                value: address,
                icon: Icons.location_on,
              ),
              ProfileInfoTile(
                title: "Date of Birth",
                value: dateOfBirth,
                icon: Icons.cake,
              ),
              ProfileInfoTile(
                title: "Gender",
                value: gender,
                icon: Icons.person,
              ),
              ProfileInfoTile(
                title: "Marital Status",
                value: maritalStatus,
                icon: Icons.favorite,
              ),
              ProfileInfoTile(
                title: "Nationality",
                value: nationality,
                icon: Icons.flag,
              ),
              ProfileInfoTile(
                title: "Occupation",
                value: occupation,
                icon: Icons.work,
              ),
              ProfileInfoTile(
                title: "Languages",
                value: languages,
                icon: Icons.language,
              ),
              ProfileInfoTile(
                title: "Website",
                value: website,
                icon: Icons.link,
              ),
              ProfileInfoTile(
                title: "Bio",
                value: bio,
                icon: Icons.info_outline,
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
