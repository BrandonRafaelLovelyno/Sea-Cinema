import 'package:flutter/material.dart';
import 'package:sea_cinema/const.dart';
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
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                TransparentBox(
                  height: 60,
                  width: 150,
                  borderRadius: 10,
                  child: Text(
                    "Franchise picking",
                    style: reusableTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: TransparentBox(
                    height: 60,
                    width: double.infinity,
                    borderRadius: 10,
                    child: Text(
                      "Cinema picking",
                      style: reusableTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const MovieCarousel(),
          ],
        ),
      ),
    );
  }
}
