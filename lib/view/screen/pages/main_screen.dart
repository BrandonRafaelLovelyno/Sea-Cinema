import 'package:flutter/material.dart';
import 'package:sea_cinema/const.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              kBackGroundWall,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15),
            child: pages[_index],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kTransparentGrey,
        selectedItemColor: kLimeGreenColor,
        currentIndex: _index,
        onTap: (indeks) {
          setState(() {
            _index = indeks;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_movies), label: "MyTicket"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
