import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'edit_profile.dart';
import 'messages.dart'; // Import the translation file
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Messages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      home: const SettingsScreen(),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'SA'),
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale?.languageCode) {
            return deviceLocale;
          }
        }
        return const Locale('ar', 'SA');
      },
      themeMode: ThemeMode.light,

      // Add the material localization delegates
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';

    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.edit, color: Colors.black),
          onPressed: () {
            // Navigate to Edit Profile Page
            Get.to(() => const EditProfilePage());
          },
        ),
        backgroundColor: const Color(0xFFFCFCFC),
        title: Text(
          'settings'.tr, // Translation key for 'settings'
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: Directionality(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: Column(
          children: [
            // Profile Section
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
                    style: TextStyle(
                      fontFamily: 'Shamel Bold',
                      fontSize: 20,
                    ),
                  ),
                  const Text(
                    '+966545411002',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Shamel Book',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            // Stats Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStatButton(
                  title: 'previous_orders'.tr,
                  value: '10',
                  color: const Color(0xff452E09),
                  textColor: Colors.white,
                ),
                const SizedBox(width: 10),
                _buildStatButton(
                  title: 'الأصدقاء'.tr,
                  value: '10',
                  color: const Color(0xFFF2E2BC),
                  textColor: Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 25),
            // Options Section
            Expanded(
              child: ListView(
                children: [
                  _buildOption(
                    title: 'عن روبن فود'.tr,
                    icon: Icons.info_outline,
                    onTap: () {
                      // Navigate to About Us page
                      // Get.to(() => const AboutUsPage());
                    },
                    title2: 'الشروط والأحكام'.tr,
                    icon2: Icons.article_outlined,
                    onTap2: () {
                      // Navigate to Terms and Conditions page
                      // Get.to(() => const TermsAndConditionsPage());
                    },
                    title3: 'تواصل معنا'.tr,
                    icon3: Icons.headset_mic_outlined,
                    onTap3: () {
                      // Navigate to Contact Us page
                      // Get.to(() => const ContactUsPage());
                    },
                  ),
                  _buildOption(
                    title: 'اللغة'.tr,
                    icon: Icons.language,
                    onTap: () {
                      // Show the language selection dialog
                      _showLanguageDialog(context);
                    },
                    title2: 'تسجيل الخروج'.tr,
                    icon2: Icons.logout,
                    iconColor2: Colors.red,
                    onTap2: () {
                      // Handle logout (or navigate to a logout screen)
                      // Get.to(() => const LogoutPage());
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: 'الإعدادات'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.receipt_long),
            label: 'الطلبات'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'الرئيسية'.tr,
          ),
        ],
      ),
    );
  }
}

// Language selection dialog
void _showLanguageDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('اختر اللغة'.tr), // Translation for "Choose Language"
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: Text('العربية'),
              value: 'ar',
              groupValue: Get.locale?.languageCode,
              onChanged: (value) {
                if (value != null) {
                  Get.updateLocale(const Locale('ar', 'SA')).then((_) {
                    // Force rebuild after language change
                    Navigator.pop(context); // Close the dialog
                  });
                }
              },
            ),
            RadioListTile<String>(
              title: Text('English'),
              value: 'en',
              groupValue: Get.locale?.languageCode,
              onChanged: (value) {
                if (value != null) {
                  Get.updateLocale(const Locale('en', 'US')).then((_) {
                    // Force rebuild after language change
                    Navigator.pop(context); // Close the dialog
                  });
                }
              },
            ),
          ],
        ),
      );
    },
  );
}

Widget _buildStatButton({
  required String title,
  required String value,
  required Color color,
  required Color textColor,
}) {
  return Container(
    width: 178,
    height: 65,
    padding: const EdgeInsets.symmetric(vertical: 5),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}

Widget _buildOption({
  required String title,
  required IconData icon,
  required void Function() onTap, // Use onTap here
  String? title2,
  IconData? icon2,
  void Function()? onTap2, // onTap2 for second action
  String? title3,
  IconData? icon3,
  void Function()? onTap3, // onTap3 for third action
  Color? iconColor2, // Make sure this is passed correctly
}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    padding: const EdgeInsets.symmetric(vertical: 5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      children: [
        InkWell(
          onTap: onTap, // Correct use of onTap
          child: ListTile(
            leading: Icon(icon),
            title: Text(title),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
        if (title2 != null && icon2 != null && onTap2 != null)
          InkWell(
            onTap: onTap2, // Correct use of onTap2
            child: ListTile(
              leading: Icon(icon2, color: iconColor2 ?? Colors.black),
              title: Text(
                title2,
                style: TextStyle(
                  fontSize: 16,
                  color: iconColor2 ?? Colors.black,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: iconColor2 ?? Colors.black,
              ),
            ),
          ),
        if (title3 != null && icon3 != null && onTap3 != null)
          InkWell(
            onTap: onTap3, // Correct use of onTap3
            child: ListTile(
              leading: Icon(icon3),
              title: Text(title3),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
      ],
    ),
  );
}
