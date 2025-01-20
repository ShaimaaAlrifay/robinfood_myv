import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const EditProfilePage());
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var text = "الحفظ".obs;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFCFCFC),
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              _buildProfileImage(),
              const SizedBox(height: 20),
              _buildTextField(label: "اسم المستخدم", hintText: "ROBINHOOD1"),
              const SizedBox(height: 20),
              _buildTextField(label: "رقم الجوال", hintText: "0500000000"),
              const SizedBox(height: 20),
              _buildSaveButton(text),
            ],
          ),
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
      title: const Text(
        "تعديل الملف الشخصي",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Profile Image Widget
  Widget _buildProfileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/images/profile.png',
        width: 113,
        height: 113,
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
  Widget _buildSaveButton(RxString text) {
    return SizedBox(
      width: Get.width * 0.9, // Dynamic width
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          text.value = "تم الحفظ";
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
