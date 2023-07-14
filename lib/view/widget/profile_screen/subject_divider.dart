import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectDivider extends StatelessWidget {
  const SubjectDivider({super.key, required this.subject, required this.icon});
  final String subject;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
            Text(
              subject,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Divider(
          height: 15,
          thickness: 2,
        ),
      ],
    );
  }
}
