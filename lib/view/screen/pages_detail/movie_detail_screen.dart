import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_cinema/const.dart';
import 'package:sea_cinema/model/movie_model.dart';
import 'package:intl/intl.dart';
import 'package:sea_cinema/view/screen/pages_detail/booking_detail_screen.dart';
import 'package:sea_cinema/view/widget/universal/transparent_box.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({
    super.key,
    required this.selectedMovie,
  });
  final Movie selectedMovie;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Detail"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: const [
          Icon(Icons.bookmark_add_outlined),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMxioyiVEXWkMQQ41gekRB6uW3OHOHbse9aCcqburX4YXpdlUpQt0XC-7ZBMxPSsTO_Ic&usqp=CAU",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Hero(
                      tag: selectedMovie.title,
                      child: SizedBox(
                        height: size.height / 2.5,
                        width: size.width - 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            selectedMovie.posterUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 2.5,
                      width: 130,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TransparentBox(
                            height: 100,
                            width: 100,
                            borderRadius: 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.panorama_wide_angle_sharp,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${selectedMovie.ageRating} years ",
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TransparentBox(
                            height: 100,
                            width: 100,
                            borderRadius: 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.date_range,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  DateFormat.yMMMd()
                                      .format(selectedMovie.releaseDate),
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TransparentBox(
                            height: 100,
                            width: 100,
                            borderRadius: 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.theaters,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Rp.${selectedMovie.ticketPrice},00",
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Text(
                    selectedMovie.title,
                    style: GoogleFonts.bebasNeue(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(
                  height: 8,
                  color: Colors.grey.shade500,
                  endIndent: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Text(
                        "Synopsis",
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        selectedMovie.desc,
                        style: GoogleFonts.workSans(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    await kBookingController
                        .updateTheBookedList(selectedMovie.title);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => BookingScreen(
                          movie: selectedMovie,
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: "Book Button",
                    child: Container(
                      alignment: Alignment.center,
                      width: size.width / 1.5,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: kForestGreenColor,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Buy Ticket",
                        style: GoogleFonts.libreFranklin(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
