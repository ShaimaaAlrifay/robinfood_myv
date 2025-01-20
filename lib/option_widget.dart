// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function() onTap;
  final String? title2;
  final IconData? icon2;
  final void Function()? onTap2;
  final String? title3;
  final IconData? icon3;
  final void Function()? onTap3;
  final Color? iconColor2; // Added the iconColor2 parameter

  const OptionWidget({super.key, 
    required this.title,
    required this.icon,
    required this.onTap,
    this.title2,
    this.icon2,
    this.onTap2,
    this.title3,
    this.icon3,
    this.onTap3,
    this.iconColor2, // Make sure this is passed
  });

  @override
  Widget build(BuildContext context) {
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
            onTap: onTap,
            child: ListTile(
              leading: Icon(icon),
              title: Text(title),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          if (title2 != null && icon2 != null && onTap2 != null)
            InkWell(
              onTap: onTap2,
              child: ListTile(
                leading: Icon(icon2, color: iconColor2 ?? Colors.black), // Use iconColor2 here
                title: Text(title2 ?? ''),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          if (title3 != null && icon3 != null && onTap3 != null)
            InkWell(
              onTap: onTap3,
              child: ListTile(
                leading: Icon(icon3),
                title: Text(title3 ?? ''),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
        ],
      ),
    );
  }
}