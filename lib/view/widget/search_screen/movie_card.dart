import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_cinema/const.dart';
import 'package:sea_cinema/model/movie_model.dart';
import 'package:sea_cinema/view/screen/pages_detail/movie_detail_screen.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.selectedMovie});
  final Movie selectedMovie;
  @override
  Widget build(BuildContext context) {
    final int numberStars = selectedMovie.id % 5 + 1;
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => MovieDetailScreen(selectedMovie: selectedMovie),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [kSeaGreenColor.withOpacity(0.8), kSeaGreenColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: selectedMovie.title,
              child: Container(
                height: 170,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 3,
                      offset: const Offset(0, 3 / 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: NetworkImage(selectedMovie.posterUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                selectedMovie.title,
                textAlign: TextAlign.left,
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: 15,
              child: Row(
                children: List.generate(
                  numberStars,
                  (index) => const Icon(
                    Icons.star,
                    color: Colors.black,
                    size: 10,
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
