import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'settings': 'Settings',
      'previous_orders': 'Previous Orders',
      'friends': 'Friends',
      'about_us': 'About Us',
      'terms_conditions': 'Terms and Conditions',
      'contact_us': 'Contact Us',
      'language': 'Language',
      'logout': 'Logout',
      'change_language': 'Change Language',  // Add this key for translation
    },
    'ar': {
      'settings': 'الإعدادات',
      'previous_orders': 'الطلبات السابقة',
      'friends': 'الأصدقاء',
      'about_us': 'عن روبن فود',
      'terms_conditions': 'الشروط والأحكام',
      'contact_us': 'تواصل معنا',
      'language': 'اللغة',
      'logout': 'تسجيل الخروج',
      'change_language': 'تغيير اللغة', // Arabic translation for 'Change Language'
    },
  };
}

