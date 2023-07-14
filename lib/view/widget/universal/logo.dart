import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget(
      {super.key,
      required this.size,
      required this.iconColor,
      required this.fontColor});
  final double size;
  final Color iconColor;
  final Color fontColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.confirmation_number_rounded,
            size: size / 0.8,
            color: iconColor,
          ),
          Text(
            "mySinEmA",
            style: GoogleFonts.openSans(
              color: fontColor,
              fontSize: size,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
