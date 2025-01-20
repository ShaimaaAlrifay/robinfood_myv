import 'package:flutter/material.dart';

class StatButton extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final Color textColor;

  const StatButton({super.key, 
    required this.title,
    required this.value,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
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
}
