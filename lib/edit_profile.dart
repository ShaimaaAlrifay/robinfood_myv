import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var text = 'save'.tr.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildProfileImage(),
              const SizedBox(height: 20),
              _buildTextField(label: 'user_name'.tr, hintText: "ROBINHOOD1"),
              const SizedBox(height: 20),
              _buildTextField(label: 'phone_number'.tr, hintText: "0500000000"),
              const SizedBox(height: 320),
              _buildSaveButton(),
            ],
          ),
        ),
      );
  }

  // AppBar Widget
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Get.back();
        },
      ),
      title: Text(
        'Edit_Profile'.tr,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: "Shamel Bold",
        ),
      ),
    );
  }

  // Profile Image Widget
  Widget _buildProfileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(75),
      child: Image.asset(
        'assets/images/profile.png',
        width: Get.width * 0.3, 
        height: Get.width * 0.3, 
        fit: BoxFit.cover, 
      ),
    );
  }

  // TextField Widget
  Widget _buildTextField({required String label, required String hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontFamily: "Shamel Book",
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontFamily: "Shamel Book",
            ),
            filled: true,
            fillColor: const Color(0xFFF7EFDC),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  // Save Button Widget
  Widget _buildSaveButton() {
    return SizedBox(
      width: Get.width * 0.9, // Dynamic width
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          text.value = 'saved'.tr;
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF5B3E1F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Obx(() => Text(
              text.value,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            )),
      ),
    );
  }
}
