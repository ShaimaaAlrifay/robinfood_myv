import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(EditProfilePage());
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var text = "الحفظ".obs;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0XFfFCFCFC),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            "تعديل الملف الشخصي",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 20),

              //profile image
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/profile.png',
                  width: 113,
                  height: 113,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),

              buildTextField(label: "اسم المستخدم", hintText: "ROBINHOOD1"),
              SizedBox(height: 20),

              buildTextField(label: "رقم الجوال", hintText: "0500000000"),
              // Spacer(),
              SizedBox(height: 320),

              SizedBox(
                width: 366,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    text.value = "تم الحفظ";
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5B3E1F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Obx(()=> Text(text.value,
                    style: TextStyle(fontSize: 18, color: Colors.white))),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({required String label, required String hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 14, color: Colors.black, fontFamily: "Shamel Book"),
        ),
        SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 16, color: Colors.black, fontFamily: "Shamel Book"),
            filled: true,
            fillColor: Color(0xFFF7EFDC),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
