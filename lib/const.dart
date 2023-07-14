import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:sea_cinema/controller/auth_controller.dart';
import 'package:sea_cinema/controller/booking_controller.dart';
import 'package:sea_cinema/controller/movie_controller.dart';
import 'package:sea_cinema/controller/ticket_controller.dart';
import 'package:sea_cinema/controller/user_controller.dart';
import 'package:sea_cinema/view/screen/pages/home_screen.dart';
import 'package:sea_cinema/view/screen/pages/profile_screen.dart';
import 'package:sea_cinema/view/screen/pages/search_screen.dart';
import 'package:sea_cinema/view/screen/pages/ticket_screen.dart';

//COLOR
const Color kLightGreenColor = Color(0xFF3CB371);
const Color kDarkGreenColor = Color(0xFF006400);
const Color kLimeGreenColor = Color(0xFF32CD32);
const Color kForestGreenColor = Color(0xFF228B22);
const Color kSeaGreenColor = Color(0xFF2E8B57);
const Color kLightLimeGreenColor = Color.fromARGB(230, 206, 250, 5);
const Color kTransparentGrey = Color.fromRGBO(128, 128, 128, 0.5);

//FIREBASE INSTANCE
final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;
final storage = FirebaseStorage.instance;

//CONTROLLER
final kAuthController = AuthController.instance;
final kMovieController = MovieController.instance;
final kUserController = UserController.instance;
final kBookingController = BookingController.instance;
final kTicketController = TicketController.instance;

//PROFILEPICTURE
const String profileURL =
    "https://t4.ftcdn.net/jpg/00/64/67/27/360_F_64672736_U5kpdGs9keUll8CRQ3p3YaEv2M6qkVY5.jpg";

//PAGES
List pages = [
  const HomeScreen(),
  SearchScreen(),
  const TicketScreen(),
  const ProfileScreen(),
];

//RANDOM QR CODE
const String kQrUrl =
    "https://www.101computing.net/wp/wp-content/uploads/barcode.png";

//BACKGROUND
const String kBackGroundWall =
    "https://www.mmppicture.co.in/wp-content/uploads/2020/08/Blur-Background-2-857x1080.jpg";
