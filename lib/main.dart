import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      appBar: AppBar(
        backgroundColor: Color(0xFFFCFCFC),
        elevation: 0,
        title: const Text(
          'الإعدادات',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.edit, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Column(
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
                  style: TextStyle(color: Colors.grey,
                  fontFamily: 'Shamel Book',
                  ),
                ),
              ],
            ),
          ),

          //space
          const SizedBox(height: 25),

          // Stats Section
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //first child
              _buildStatButton(
                title: 'الطلبات السابقة',
                value: '10',
                color: Color(0xff452E09),
                textColor: Colors.white,
              ),
              const SizedBox(width: 10),

              //second child
              _buildStatButton(
                title: 'الأصدقاء',
                value: '10',
                color: Color(0xFFF2E2BC),
                textColor: Colors.black,
              ),
            ],
          ),

          //space
          const SizedBox(height: 25),

          // Options Section
          Expanded(
            child: ListView(
              children: [
                _buildOption(
                  title: 'عن روبن فود',
                  icon: Icons.info_outline,
                  title2: 'الشروط والأحكام',
                  icon2: Icons.article_outlined,
                  title3: 'تواصل معنا',
                  icon3: Icons.headset_mic_outlined,
                ),
                _buildOption(
                  title: 'اللغة',
                  icon: Icons.language,
                  title2: 'تسجيل الخروج',
                  icon2: Icons.logout,
                  iconColor2: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),

      //------------ Navigation Bar -------------
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'الإعدادات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'الطلبات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
        ],
      ),
    );
  }

//--------- components section --------------

  //stat button
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

  //list option
  Widget _buildOption({
    required String title,
    required IconData icon,
    required String title2,
    required IconData icon2,
    String? title3,
    IconData? icon3,
    Color? iconColor,
    Color? iconColor2,
    Color? iconColor3,
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
          ListTile(
            leading: Icon(icon, color: iconColor ?? Colors.black),
            title: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
          ),

          ListTile(
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

          //this is Optional
          if (title3 != null && icon3 != null)
            ListTile(
              leading: Icon(icon3, color: iconColor3 ?? Colors.black),
              title: Text(
                title3,
                style: TextStyle(
                  fontSize: 16,
                  color: iconColor3 ?? Colors.black,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: iconColor3 ?? Colors.black,
              ),
            ),
        ],
      ),
    );
  }
}
