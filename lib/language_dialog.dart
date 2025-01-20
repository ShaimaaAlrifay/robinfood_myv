// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('select_language'.tr),
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
                  Navigator.pop(context); // Close the dialog
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
