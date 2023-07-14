import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_cinema/const.dart';
import 'package:sea_cinema/model/movie_model.dart';
import 'package:sea_cinema/view/screen/pages_detail/movie_detail_screen.dart';
import 'package:sea_cinema/view/widget/universal/transparent_box.dart';
import 'package:intl/intl.dart';

class MovieCarousel extends StatelessWidget {
  const MovieCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return CarouselSlider.builder(
      itemCount: kMovieController.movieList.length,
      itemBuilder: (context, index, realIndex) {
        Movie movieIndex = kMovieController.movieList[index];
        return Column(
          children: [
            SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    movieIndex.title,
                    style: GoogleFonts.bebasNeue(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    DateFormat.yMMMd().format(movieIndex.releaseDate),
                    style: GoogleFonts.roboto(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => MovieDetailScreen(
                    selectedMovie: movieIndex,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    width: size.width / 2,
                    height: 300,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade800.withOpacity(0.6),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Hero(
                          tag: movieIndex.title,
                          child: Image.network(
                            movieIndex.posterUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: TransparentBox(
                      height: 30,
                      width: 30,
                      borderRadius: 20,
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.bookmark_add_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      options: CarouselOptions(
        height: 535,
        enlargeCenterPage: true,
        viewportFraction: 0.6,
      ),
    );
  }
}
