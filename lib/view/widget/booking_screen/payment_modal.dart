import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_cinema/const.dart';
import 'package:sea_cinema/model/movie_model.dart';
import 'package:sea_cinema/view/widget/booking_screen/modal_data.dart';
import 'package:sea_cinema/view/widget/profile_screen/subject_divider.dart';
import 'package:sea_cinema/view/widget/universal/logo.dart';

class PaymentModal extends StatelessWidget {
  const PaymentModal({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: kTransparentGrey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(60),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LogoWidget(
              size: 20,
              iconColor: Colors.red,
              fontColor: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            const SubjectDivider(subject: "User Data", icon: Icons.person),
            ModalData(
              subject: "Your balance",
              main: kUserController.userObject.balance.toString(),
            ),
            ModalData(
                subject: "Your age", main: kUserController.userObject.age),
            ModalData(
              subject: "Your booked seats",
              main: kBookingController.orderedList.length.toString(),
            ),
            const SizedBox(
              height: 20,
            ),
            const SubjectDivider(subject: "Movie Data", icon: Icons.movie),
            ModalData(
              subject: "Total price",
              main: (movie.ticketPrice * kBookingController.orderedList.length)
                  .toString(),
            ),
            ModalData(
              subject: "Age rating",
              main: movie.ageRating.toString(),
            ),
            const SizedBox(
              height: 10,
            ),
            ModalData(
              subject: "Watch hour",
              main: kBookingController.watchHour,
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                await kBookingController.bookTheTickets(movie);
              },
              child: Container(
                width: 150,
                height: 50,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kLightLimeGreenColor,
                ),
                child: Text(
                  "Continue!",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
