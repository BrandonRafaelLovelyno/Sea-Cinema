import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_cinema/const.dart';
import 'package:sea_cinema/view/widget/ticket_screen/ticket_card.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Obx(
          () {
            return kTicketController.usersTickets.isNotEmpty
                ? Container(
                    alignment: Alignment.center,
                    height: size.height / 1.3,
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        height: size.height / 1.3,
                        viewportFraction: 0.9,
                        enableInfiniteScroll: false,
                      ),
                      itemCount: kTicketController.usersTickets.length,
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: TicketCard(
                            height: size.height / 1.3,
                            ticket: kTicketController.usersTickets[index],
                          ),
                        );
                      },
                    ),
                  )
                : Center(
                    child: Text(
                      "You have no tickets :(",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
