import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalData extends StatelessWidget {
  const ModalData({super.key, required this.subject, required this.main});
  final String subject;
  final String main;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subject,
            style: GoogleFonts.inter(
              color: Colors.grey.shade400,
              fontSize: 17,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "\t\t\t\t\t$main",
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
