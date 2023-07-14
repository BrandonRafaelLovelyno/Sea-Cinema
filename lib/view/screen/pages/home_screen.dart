import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_cinema/const.dart';
import 'package:sea_cinema/view/widget/home_screen/hour_box.dart';
import 'package:sea_cinema/view/widget/home_screen/movie_caraousel.dart';
import 'package:sea_cinema/view/widget/universal/logo.dart';
import 'package:sea_cinema/view/widget/universal/transparent_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TextStyle reusableTextStyle =
        Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            );
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const LogoWidget(
          size: 30,
          fontColor: Colors.white,
          iconColor: Colors.red,
        ),
        actions: [
          CircleAvatar(
            backgroundImage:
                NetworkImage(kUserController.userObject.profilePicture),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Container(
        height: size.height,
        width: size.width,
        margin: const EdgeInsets.only(
          top: 20,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: HourBox(hour: "11")),
                Expanded(child: HourBox(hour: "14")),
                Expanded(child: HourBox(hour: "17")),
                Expanded(child: HourBox(hour: "20")),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MovieCarousel(),
          ],
        ),
      ),
    );
  }
}
