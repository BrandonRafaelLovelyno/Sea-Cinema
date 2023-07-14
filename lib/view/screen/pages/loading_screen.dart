import 'package:flutter/material.dart';
import 'package:sea_cinema/const.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: kLightLimeGreenColor),
    );
  }
}
