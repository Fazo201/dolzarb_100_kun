import 'package:flutter/material.dart';

class CenterThickDivider extends StatelessWidget {
  final double height; // Divider balandligi
  final double width;  // Divider kengligi
  final Color color;   // O‘rta qalin qism rangi

  const CenterThickDivider({
    this.height = 4,
    this.width = double.infinity,
    this.color = const Color(0xFF145A78),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            color.withOpacity(0.1), 
            color.withOpacity(0.7), 
            color.withOpacity(0.8), 
            color.withOpacity(0.9), 
            color,              
            color.withOpacity(0.9), 
            color.withOpacity(0.8), 
            color.withOpacity(0.7), 
            color.withOpacity(0.1), 
          ],
        ),
      ),
    );
  }
}
