import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_cinema/controller/auth_controller.dart';
import 'package:sea_cinema/controller/booking_controller.dart';
import 'package:sea_cinema/controller/movie_controller.dart';
import 'package:sea_cinema/controller/ticket_controller.dart';
import 'package:sea_cinema/controller/user_controller.dart';
import 'package:sea_cinema/view/screen/pages/loading_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async {
    Get.put(MovieController());
    Get.put(AuthController());
    await Get.put(UserController());
    Get.put(BookingController());
    Get.put(TicketController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.openSansTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.openSans(textStyle: textTheme.bodyMedium),
        ),
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: const LoadingScreen(),
    );
  }
}
