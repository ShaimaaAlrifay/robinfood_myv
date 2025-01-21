import 'package:flutter/material.dart';
import 'package:flutter_application_1/edit_profile.dart';
import 'package:get/get.dart';
import 'stat_button.dart';
import 'option_widget.dart';
import 'language_dialog.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';

    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFCFCFC),
        title: Text(
          'settings'.tr,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.edit, color: Colors.black),
          onPressed: () {
            Get.to(() => EditProfilePage());
          },
        ),
      ),
      body: Directionality(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/profile.png',
                      width: 113,
                      height: 113,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'ROBINHOOD1',
                    style: TextStyle(fontFamily: 'Shamel Bold', fontSize: 20),
                  ),
                  const Text(
                    '+966545411002',
                    style: TextStyle(
                        color: Colors.grey, fontFamily: 'Shamel Book'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StatButton(
                  title: 'friends'.tr,
                  value: '10',
                  color: const Color(0xFFF2E2BC),
                  textColor: Colors.black,
                ),
                const SizedBox(width: 10),
                StatButton(
                  title: 'previous_orders'.tr,
                  value: '10',
                  color: const Color(0xff452E09),
                  textColor: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView(
                children: [
                  OptionWidget(
                    title: 'about_us'.tr,
                    icon: Icons.info_outline,
                    onTap: () {
                      // Navigate to About Us page
                    },
                    title2: 'terms_conditions'.tr,
                    icon2: Icons.article_outlined,
                    onTap2: () {
                      // Navigate to Terms and Conditions page
                    },
                    title3: 'contact_us'.tr,
                    icon3: Icons.headset_mic_outlined,
                    onTap3: () {
                      // Navigate to Contact Us page
                    },
                  ),
                  OptionWidget(
                    title: 'change_language'.tr,
                    icon: Icons.language,
                    onTap: () {
                      _showLanguageDialog(context);
                    },
                    title2: 'logout'.tr,
                    icon2: Icons.logout,
                    iconColor2: Colors.red, // This should work now
                    onTap2: () {
                      // Handle logout
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Language selection dialog
  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LanguageDialog();
      },
    );
  }
}
