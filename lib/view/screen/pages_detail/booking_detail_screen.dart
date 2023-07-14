import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_cinema/const.dart';
import 'package:sea_cinema/model/movie_model.dart';
import 'package:sea_cinema/view/widget/booking_screen/chair.dart';
import 'package:sea_cinema/view/widget/booking_screen/payment_modal.dart';
import 'package:sea_cinema/view/widget/universal/transparent_box.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key, required this.movie});
  final Movie movie;
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            kBookingController.clearAllObservable();
            Navigator.of(context).pop();
          },
        ),
        title: const Text("Movie Booking"),
      ),
      backgroundColor: Colors.black,
      body: Obx(
        () {
          return Stack(
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
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      width: double.infinity,
                      height: 120,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width / 1.3,
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            child: Text(
                              widget.movie.title,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  margin: const EdgeInsets.only(bottom: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: kLightLimeGreenColor,
                                  ),
                                  child: const Icon(
                                    Icons.watch_later_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  kBookingController.watchHour,
                                  style: GoogleFonts.inter(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    TransparentBox(
                      height: size.height / 1.8,
                      width: double.infinity,
                      borderRadius: 30,
                      child: SingleChildScrollView(
                        child: Container(
                          height: size.height / 1.7,
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                            left: 25,
                            right: 25,
                            bottom: 10,
                            top: 20,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Screen",
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 40),
                                height: 2,
                                color: kLightLimeGreenColor,
                                width: size.width / 1.7,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(
                                    8,
                                    (i) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                          8,
                                          (j) {
                                            return ChairWidget(
                                              ticketPrice:
                                                  widget.movie.ticketPrice,
                                              width: size.width / 15,
                                              chairLabel: (8 * i) + j + 1,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Total:",
                                      style: GoogleFonts.poppins(
                                        color: Colors.grey.shade500,
                                        fontSize: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "${kBookingController.totalPrice}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 50,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      ".000",
                                      style: GoogleFonts.poppins(
                                        color: Colors.grey.shade500,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return PaymentModal(
                                        movie: widget.movie,
                                      );
                                    },
                                  );
                                },
                                child: Hero(
                                  tag: "Book Button",
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: double.infinity,
                                    width: double.infinity,
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: kLightLimeGreenColor,
                                    ),
                                    child: Text(
                                      "Book!",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
